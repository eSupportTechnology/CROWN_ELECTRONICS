<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rules;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\JsonResponse;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class MobileAuthController extends Controller
{
    /**
     * Handle mobile registration.
     */
    public function register(Request $request): JsonResponse
    {
        // Validate the incoming request data
        $validator = Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email'],
            'password' => ['required', Rules\Password::defaults()],
            'address' => ['required', 'string', 'max:255'],
            'dob' => ['required', 'date'],
            'phone' => ['required', 'string', 'max:15'],
        ]);

        // If validation fails, return validation errors
        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 400);
        }

        // Create the user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'address' => $request->address,
            'dob' => $request->dob,
            'phone' => $request->phone,
        ]);

        // Generate token
        $token = JWTAuth::fromUser ($user);

        // Return a success response with token
        return response()->json([
            'message' => 'Registration successful!',
            'user' => $user,
            'token' => $token
        ], 201);
    }

    /**
     * Handle mobile login.
     */
    public function login(Request $request): JsonResponse
    {
        $credentials = $request->only('email', 'password');

        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json(['message' => 'Invalid credentials'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['message' => 'Could not create token'], 500);
        }

        $user = Auth::user();

        return response()->json([
            'message' => 'Login successful!',
            'user' => $user,
            'token' => $token
        ], 200);
    }

    /**
     * Handle mobile logout.
     */
    public function logout(Request $request): JsonResponse
    {
        try {
            JWTAuth::invalidate(JWTAuth::getToken());
            return response()->json(['message' => 'Logged out successfully!'], 200);
        } catch (JWTException $e) {
            return response()->json(['message' => 'Could not log out'], 500);
        }
    }

    /**
     * Get authenticated user details.
     */
    public function userProfile(Request $request): JsonResponse
    {
        return response()->json([
            'user' => $request->user()
        ], 200);
    }
}