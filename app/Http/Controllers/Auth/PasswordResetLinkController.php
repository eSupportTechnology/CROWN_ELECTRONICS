<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Illuminate\View\View;

class PasswordResetLinkController extends Controller
{
    /**
     * Display the password reset link request view.
     */
    public function create(): View
    {
        return view('auth.forgot-password');
    }

    /**
     * Handle an incoming password reset link request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
{
    // Step 1: Validate input
    $validated = $request->validate([
        'email' => ['required', 'email'],
    ]);

    // Step 2: Attempt to send the reset link
    $status = Password::sendResetLink($validated); // Already contains only 'email'

    // Step 3: Respond based on status
    return $status === Password::RESET_LINK_SENT
        ? back()->with('status', __('We have sent a password reset link to your email.'))
        : back()->withInput($request->only('email'))
                ->withErrors(['email' => __('We could not find a user with that email address.')]);
}

}
