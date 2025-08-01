@extends('frontend.master')

@section('content')

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.account {
    display: flex;
    margin-right: 0px !important;
}
</style>

<!-- ========================= Breadcrumb Start =============================== -->
<div class="mb-0 breadcrumb py-26 bg-main-two-50">
    <div class="container container-lg">
        <div class="flex-wrap gap-16 breadcrumb-wrapper flex-between">
            <h6 class="mb-0">My Account</h6>
            <ul class="flex-wrap gap-8 flex-align">
                <li class="text-sm">
                    <a href="{{ route('home') }}" class="gap-8 text-gray-900 flex-align hover-text-main-600">
                        <i class="ph ph-house"></i>
                        Home
                    </a>
                </li>
                <li class="flex-align">
                    <i class="ph ph-caret-right"></i>
                </li>
                <li class="text-sm text-main-600"> Account </li>
            </ul>
        </div>
    </div>
</div>
<!-- ========================= Breadcrumb End =============================== -->

<!-- =============================== Account Section Start =========================== -->
<section class="account d-flex justify-content-center align-items-center py-80" style="min-height: 100vh;">
    <div class="container container-lg">
        <form method="POST" action="{{ route('register') }}">
            @csrf

           

            <div class="row gy-4 justify-content-center">
                <!-- Register Card Start -->
                <div class="col-xl-6 col-lg-8 col-md-10">
                    <div class="px-24 py-40 border border-gray-100 hover-border-main-600 transition-1 rounded-16">
                        <h6 class="mb-32 text-xl text-center">Register</h6>

                        <!-- Name -->
                        <div class="mb-24">
                            <x-input-label class="fw-bold" for="name" :value="__('Name')" />
                            <span class="text-danger">*</span>
                            <x-text-input id="name" class="common-input w-100 @error('name') is-invalid @enderror"
                                type="text" name="name" value="{{ old('name') }}" placeholder="Enter the name" required />
                            @error('name')
                                <div class="text-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Address -->
                        <div class="mb-24">
                            <x-input-label class="fw-bold" for="address" :value="__('Address')" />
                            <span class="text-danger">*</span>
                            <x-text-input id="address" class="common-input w-100 @error('address') is-invalid @enderror"
                                type="text" name="address" value="{{ old('address') }}" placeholder="Enter Address" required />
                            @error('address')
                                <div class="text-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Date of Birth -->
                        <div class="mb-24">
                            <x-input-label class="fw-bold" for="dob" :value="__('Date of Birth')" />
                            <span class="text-danger">*</span>
                            <x-text-input id="dob" class="common-input w-100 @error('dob') is-invalid @enderror"
                                type="date" name="dob" value="{{ old('dob') }}" required />
                            @error('dob')
                                <div class="text-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Phone -->
                        <div class="mb-24">
                            <x-input-label class="fw-bold" for="phone" :value="__('Phone Number')" />
                            <span class="text-danger">*</span>
                            <x-text-input id="phone" class="common-input w-100 @error('phone') is-invalid @enderror"
                                type="tel" name="phone" value="{{ old('phone') }}" placeholder="Enter Phone Number" required />
                            @error('phone')
                                <div class="text-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Email -->
                        <div class="mb-24">
                            <x-input-label class="fw-bold" for="email" :value="__('Email Address')" />
                            <span class="text-danger">*</span>
                            <x-text-input id="email" class="common-input w-100 @error('email') is-invalid @enderror"
                                type="email" name="email" value="{{ old('email') }}" placeholder="Enter Email Address" required />
                            @error('email')
                                <div class="text-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Password -->
                        <div class="mb-24">
                            <x-input-label class="fw-bold" for="password" :value="__('Password')" />
                            <span class="text-danger">*</span>
                            <div class="position-relative">
                                <input id="password" class="common-input w-100 @error('password') is-invalid @enderror"
                                    type="password" name="password" placeholder="Enter Password" required />
                                <span class="cursor-pointer toggle-password position-absolute top-50 end-0 me-3 translate-middle-y ph ph-eye-slash"
                                    id="toggle-password"></span>
                            </div>
                            @error('password')
                                <div class="text-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>

                        <!-- Privacy Policy -->
                        <div class="my-48 text-center">
                            <p class="text-gray-500">Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our
                                <a href="{{ route('PrivacyPolicy') }}" class="text-main-600 text-decoration-underline">privacy policy</a>.
                            </p>
                        </div>

                        <!-- Submit -->
                        <div class="mt-48 text-center">
                            <x-primary-button type="submit" class="px-4 py-2 btn btn-primary">
                                {{ __('Register') }}
                            </x-primary-button>
                        </div>

                        <div class="mt-3 text-center">
                            <p>Already have an account?
                                <a href="{{ route('login') }}" class="text-primary">Login</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<!-- =============================== Account Section End =========================== -->

<!-- JavaScript for Password Toggle -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const toggleIcon = document.getElementById('toggle-password');
    const passwordInput = document.getElementById('password');
    let isPasswordVisible = false;

    if (toggleIcon && passwordInput) {
        toggleIcon.addEventListener('click', function () {
            isPasswordVisible = !isPasswordVisible;
            passwordInput.type = isPasswordVisible ? 'text' : 'password';
            toggleIcon.classList.toggle('ph-eye', isPasswordVisible);
            toggleIcon.classList.toggle('ph-eye-slash', !isPasswordVisible);
        });
    }
});
</script>

<!-- JavaScript for client-side validation (optional, kept from your version) -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const form = document.querySelector('form');

    const fields = {
        name: {
            input: document.getElementById('name'),
            validate: value => /^[a-zA-Z\s]+$/.test(value),
        },
        address: {
            input: document.getElementById('address'),
            validate: value => value.trim().length > 0,
        },
        dob: {
            input: document.getElementById('dob'),
            validate: value => value && new Date(value) < new Date(),
        },
        phone: {
            input: document.getElementById('phone'),
            validate: value => /^[0-9+\-\s]{10,15}$/.test(value),
        },
        email: {
            input: document.getElementById('email'),
            validate: value => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value),
        },
        password: {
            input: document.getElementById('password'),
            validate: value => value.length >= 8,
        }
    };

    for (const key in fields) {
        const { input, validate } = fields[key];
        input.addEventListener('input', () => {
            const isValid = validate(input.value);
            input.classList.toggle('is-valid', isValid);
            input.classList.toggle('is-invalid', !isValid);
        });
    }

    form.addEventListener('submit', function (e) {
        let hasError = false;
        for (const key in fields) {
            const { input, validate } = fields[key];
            const isValid = validate(input.value);
            input.classList.toggle('is-valid', isValid);
            input.classList.toggle('is-invalid', !isValid);
            if (!isValid) hasError = true;
        }

        if (hasError) {
            e.preventDefault();
            e.stopPropagation();
        }
    });
});
</script>

@endsection
