<?php
namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use App\Models\CustomerOrder;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit(Request $request): View
    {
        return view('profile.edit', [
            'user' => $request->user(),
        ]);
    }

    /**
     * Update the user's profile information.
     */
    public function update(ProfileUpdateRequest $request): RedirectResponse
    {
        $request->user()->fill($request->validated());

        if ($request->user()->isDirty('email')) {
            $request->user()->email_verified_at = null;
        }

        $request->user()->save();

        return Redirect::route('profile.edit')->with('status', 'profile-updated');
    }

    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }

    public function myOrders()
    {
        if (! auth()->check()) {
            return redirect()->route('login')->with('error', 'You must be logged in to view your orders.');
        }
        $orders = CustomerOrder::where('user_id', auth()->id())->get();
        return view('user_dashboard.my-orders', compact('orders'));
    }

    public function trackOrder($orderCode)
    {
        $order = CustomerOrder::where('order_code', $orderCode)->firstOrFail();

        // Convert activity_logs to a Laravel Collection
        $order->activity_logs = collect($order->activity_logs ?? []);

        return view('user_dashboard.tracking-page', compact('order'));
    }

    public function dashboard()
    {
        if (! auth()->check()) {
            return redirect()->route('login')->with('error', 'You must be logged in to access the dashboard.');
        }
        $user = Auth::user();
        //dd($user);

        // Pass the user to the view
        return view('user_dashboard.dashboard', compact('user'));
    }

    public function editProfile()
    {
        // Get the authenticated user
        if (! auth()->check()) {
            return redirect()->route('login')->with('error', 'You must be logged in to access the profile.');
        }
        $user = Auth::user();
        // Pass the user data to the view
        return view('user_dashboard.edit-profile', compact('user'));
    }

    public function updateProfile(Request $request)
    {
        $request->validate([
            'full_name'     => ['required', 'string', 'max:255', 'regex:/^[a-zA-Z\s.]+$/'],
            'email'         => ['required', 'email', 'max:255', Rule::unique('users', 'email')->ignore(Auth::id())],
            'phone_num'     => ['nullable', 'digits_between:7,15'],
            'address'       => ['nullable', 'string', 'max:255', 'regex:/^[a-zA-Z0-9\s,.-]+$/'],
            'date_of_birth' => ['nullable', 'date'],
            'profile_image' => ['nullable', 'image', 'mimes:jpeg,png,jpg', 'max:2048'],
        ], [
            'full_name.regex'          => 'Full name can only contain letters, spaces, and periods.',
            'phone_num.digits_between' => 'Mobile must be between 7 to 15 digits.',
            'address.regex'            => 'Address can only contain letters, numbers, commas, periods, hyphens and spaces.',
        ]);

        $user          = Auth::user();
        $user->name    = $request->input('full_name');
        $user->email   = $request->input('email');
        $user->address = $request->input('address');
        $user->phone   = $request->input('phone_num');
        $user->dob     = $request->input('date_of_birth');

        if ($request->hasFile('profile_image')) {
            $file     = $request->file('profile_image');
            $filename = time() . '.' . $file->getClientOriginalExtension();
            $file->move(public_path('uploads/profile_images'), $filename);
            $user->profile_image = $filename;
        }

        $user->save();

        return redirect()->route('edit-profile')->with('success', 'Profile updated successfully.');
    }

    public function editPassword()
    {
        if (! auth()->check()) {
            return redirect()->route('login')->with('error', 'You must be logged in to access the password change page.');
        }
        // Pass the user data to the view
        return view('user_dashboard.edit-password');
    }

  public function changePassword(Request $request)
{
    // Validate the input fields
    $request->validate([
        'current_password' => 'required',
        'new_password' => 'required|min:8|confirmed',
    ]);

    // Get the currently authenticated user
    $user = Auth::user();

    // Check if the provided current password matches the stored password
    if (!Hash::check($request->current_password, $user->password)) {
        return redirect()->back()->with('error', 'The current password is incorrect.');
    }

    // Update the user's password
    $user->password = Hash::make($request->new_password);
    $user->save();

    return redirect()->route('dashboard')->with('success', 'Password updated successfully.');
}
}
