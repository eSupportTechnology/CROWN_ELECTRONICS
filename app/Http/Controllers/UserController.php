<?php
namespace App\Http\Controllers;

use App\Models\SystemUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;


class UserController extends Controller
{

    public function show()
    {
        $users = SystemUser::all();
        return view('AdminDashboard.users', compact('users'));
    }

    public function slider()
    {

        return view('AdminDashboard.slider');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'     => 'required|string|max:255',
            'email'    => 'required|string|email|max:255|unique:system_users,email',
            'contact'  => 'nullable|string|max:15',
            'password' => 'required|string|min:8',
            'role'     => 'required|string',
            'image'    => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'status'   => 'required|in:Active,Inactive',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $validatedData           = $validator->validated();


        if ($request->hasFile('image')) {
            $file     = $request->file('image');
            $fileName = time() . '_' . $file->getClientOriginalName();
            $file->storeAs('user_images', $fileName, 'public');
            $validatedData['image'] = $fileName;
        } else {
            $validatedData['image'] = 'default-user.png';
        }

        try {
            SystemUser::create([
                'name'     => $validatedData['name'],
                'email'    => $validatedData['email'],
                'contact'  => $validatedData['contact'],
                'password' => Hash::make($validatedData['password']),
                'role'     => $validatedData['role'],
                'image'    => $validatedData['image'],
                'status'   => $validatedData['status'],
            ]);

            return redirect()->back()->with('success', 'User created successfully.');
        } catch (\Illuminate\Database\QueryException $e) {
            Log::error('User creation failed: ' . $e->getMessage());

            return back()->with('error', 'Failed to create user. Please check the input or try again later.');
        }
    }

    public function edit($id)
    {
        $user = SystemUser::findOrFail($id);
        return view('AdminDashboard.edit_users', compact('user'));
    }

    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name'    => 'required|string|max:255',
            'email'   => 'required|string|email|max:255|unique:system_users,email,' . $id,
            'contact' => 'nullable|string|max:15',
            'role'    => 'required|string',
            'image'   => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'status'  => 'required|in:active,inactive',
        ]);

        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        }

        $user = SystemUser::findOrFail($id);

        if ($request->hasFile('image')) {
            $file     = $request->file('image');
            $fileName = time() . '_' . $file->getClientOriginalName();
            $file->storeAs('user_images', $fileName, 'public');
            $user->image = $fileName;
        }

        $user->name    = $request->name;
        $user->email   = $request->email;
        $user->contact = $request->contact;
        $user->role    = $request->role;
        $user->status  = $request->status;
        $user->save();

        return redirect()->route('users')->with('success', 'User updated successfully.');
    }

public function destroy($id)
{
    $user = SystemUser::findOrFail($id);

    // Delete the image file only if it's not the default image
    if ($user->image && $user->image !== 'default-user.png') {
        Storage::disk('public')->delete('user_images/' . $user->image);
    }

    // Delete the user
    $user->delete();

    return redirect()->route('users')->with('success', 'User deleted successfully.');
}

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');

    if (Auth::attempt($credentials)) {
        return redirect()->intended('frontend.Home');
    }

    return back()->withErrors([
        'email' => 'The provided credentials do not match our records.',
    ])->withInput($request->except('password'));
}


}
