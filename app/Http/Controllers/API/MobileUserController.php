<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\SystemUser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Http\JsonResponse;

class MobileUserController extends Controller
{
    /**
     * Fetch the current authenticated user.
     */
    public function getCurrentUser(Request $request): JsonResponse
    {
        $user = JWTAuth::parseToken()->authenticate();
        return response()->json($user);
    }

    /**
     * Store a new user (for registration).
     */
    public function store(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:system_users',
            'password' => 'required|string|min:6',
            'address' => 'nullable|string',
            'dob' => 'nullable|date',
            'phone' => 'nullable|string|max:20',
            'gender' => 'nullable|string|in:Male,Female,Other',
        ]);

        if ($validator->fails()) {
            return response()->json(['message' => $validator->errors()], 400);
        }

        $user = SystemUser::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'address' => $request->address,
            'dob' => $request->dob,
            'phone' => $request->phone,
            'gender' => $request->gender,
        ]);

        return response()->json(['message' => 'User created successfully', 'user' => $user], 201);
    }

    /**
     * Update the user profile.
     */
    public function updateUser(Request $request): JsonResponse
    {
        $user = Auth::user();

        if (!$user) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => "required|string|email|max:255|unique:system_users,email,{$user->id}",
            'address' => 'nullable|string',
            'dob' => 'nullable|date',
            'phone' => 'nullable|string|max:20',
            'gender' => 'nullable|string|in:Male,Female,Other',
        ]);

        if ($validator->fails()) {

            return response()->json(['message' => $validator->errors()], 400);
        }

        try {
            $user->update([
                'name' => $request->name,
                'email' => $request->email,
                'address' => $request->address,
                'dob' => $request->dob,
                'phone' => $request->phone,
                'gender' => $request->gender,
            ]);
            return response()->json(['message' => 'User updated successfully', 'user' => $user], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Update failed', 'error' => $e->getMessage()], 500);
        }
    }

    /**
     * Get all users (Admin Only).
     */
    public function index(): JsonResponse
    {
        $users = SystemUser::all();
        return response()->json($users);
    }

    /**
     * Get a user by ID.
     */
    public function show($id): JsonResponse
    {
        $user = SystemUser::find($id);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        return response()->json($user);
    }

    /**
     * Delete a user.
     */
    public function destroy($id): JsonResponse
    {
        $user = SystemUser::find($id);

        if (!$user) {
            return response()->json(['message' => 'User not found'], 404);
        }

        $user->delete();
        return response()->json(['message' => 'User deleted successfully'], 200);
    }
}
