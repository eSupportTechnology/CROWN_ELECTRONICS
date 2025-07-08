<x-guest-layout>
    <div class="mb-4 text-sm text-gray-600 dark:text-gray-400">
        {{ __("Forgot your password? No worries! Just enter your email below and we'll send you a secure link to reset your password.") }}
    </div>

    <!-- Show success message if email is sent -->
    @if (session('status'))
        <div class="mb-4 font-medium text-sm text-green-600 dark:text-green-400">
            {{ session('status') }}
        </div>
    @endif

    <!-- Show form only if status is not set -->
    @if (!session('status'))
        <form method="POST" action="{{ route('password.email') }}">
            @csrf

            <!-- Email Address -->
            <div>
                <x-input-label for="email" :value="__('Email')" />
                <x-text-input id="email" class="block mt-1 w-full" type="email" name="email"
                              :value="old('email')" required autofocus />
                <x-input-error :messages="$errors->get('email')" class="mt-2" />
            </div>

            <div class="flex items-center justify-end mt-4">
                <x-primary-button>
                    {{ __('Email Password Reset Link') }}
                </x-primary-button>
            </div>
        </form>
    @else
        <div class="mt-4 text-sm text-gray-600 dark:text-gray-400">
            {{ __('Please check your inbox for the password reset link.') }}
        </div>
    @endif
</x-guest-layout>
