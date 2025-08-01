<?php
namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {

        return view('frontend.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        $request->merge([
            'email' => strtolower($request->input('email')),
        ]);

        $request->validate([
            'name'     => ['required', 'string', 'max:255', 'min:2'],
            'email'    => [
                'required',
                'string',
                'email',
                'max:255',
                Rule::unique('users')->where(function ($query) use ($request) {
                    return $query->whereRaw('LOWER(email) = ?', [strtolower($request->email)]);
                }),
            ],
            'password' => ['required', Rules\Password::defaults()],
            'address'  => ['required', 'string', 'max:255'],
            'dob'      => ['required', 'date', 'before:today'],
            'phone'    => ['required', 'regex:/^[0-9+\-\s()]+$/', 'min:10', 'max:15'],
        ], [
            // ✅ Custom Error Messages
            'name.min'           => 'The name must be at least 2 characters.',
            'address.required'   => 'The address field is required.',
            'address.max'        => 'The address may not be greater than 255 characters.',
            'dob.required'       => 'The date of birth field is required.',
            'dob.date'           => 'Please enter a valid date for date of birth.',
            'dob.before'         => 'Date of birth must be a valid date before today.',
            'phone.required'     => 'The phone number field is required.',
            'phone.regex'        => 'Please enter a valid phone number (10-15 digits, optionally with +, -, or spaces).',
            'phone.min'          => 'The phone number must be at least 10 characters.',
            'phone.max'          => 'The phone number may not be greater than 15 characters.',
            'password.required'  => 'The password field is required.',
            'password.min'       => 'The password must be at least 8 characters.',
            'password.confirmed' => 'The password confirmation does not match.',
            'email.required'     => 'The email field is required.',
            'email.string'       => 'The email must be a string.',
            'email.unique'       => 'The email has already been taken.',
            'email.string'       => 'The email must be a string.',
            'email.max'          => 'The email may not be greater than 255 characters.',
            'email.email'        => 'Please enter a valid email address.',
            'email.lowercase'    => 'The email must be in lowercase.',
            'email.unique'       => 'This email address is already registered.',
            'email.exists'       => 'This email address does not exist in our records.',
            'email.email'        => 'Please enter a valid email address.',
            'email.max'          => 'The email may not be greater than 255 characters.',
            'email.unique'       => 'This email address is already taken.',
        ]);

        $user = User::create([
            'name'     => $request->name,
            'email'    => strtolower($request->email),
            'password' => Hash::make($request->password),
            'address'  => $request->address,
            'dob'      => $request->dob,
            'phone'    => $request->phone,
        ]);

        event(new Registered($user));

        Auth::login($user);

        return redirect()->route('login')->with('success', 'Registration successful! Please log in.');
    }
}
