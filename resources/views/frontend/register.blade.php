@extends ('frontend.master')

@section('content')


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">



<style>
.account {
    display: flex
;
    margin-right:0px !important;
}

</style>


    <!-- ========================= Breadcrumb Start =============================== -->
<div class="mb-0 breadcrumb py-26 bg-main-two-50">
    <div class="container container-lg">
        <div class="flex-wrap gap-16 breadcrumb-wrapper flex-between">
            <h6 class="mb-0">My Account</h6>
            <ul class="flex-wrap gap-8 flex-align">
                <li class="text-sm">
                    <a href="index.html" class="gap-8 text-gray-900 flex-align hover-text-main-600">
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
                    <!-- Name -->
<div class="mb-24">
    <x-input-label class="fw-bold" for="name" :value="__('Name')" />
    <span class="text-danger">*</span>
    <x-text-input id="name" class="common-input w-100" type="text" name="name" placeholder="Enter the name" required />
    <div class="invalid-feedback">Only letters and spaces are allowed.</div>
</div>

<!-- Address -->
<div class="mb-24">
    <x-input-label class="fw-bold" for="address" :value="__('Address')" />
    <span class="text-danger">*</span>
    <x-text-input id="address" class="common-input w-100" type="text" name="address" placeholder="Enter Address" required />
    <div class="invalid-feedback">Address is required.</div>
</div>

<!-- Date of Birth -->
<div class="mb-24">
    <x-input-label class="fw-bold" for="dob" :value="__('Date of Birth')" />
    <span class="text-danger">*</span>
    <x-text-input id="dob" class="common-input w-100" type="date" name="dob" placeholder="Enter Date of Birth" required />
    <div class="invalid-feedback">Please select a valid date before today.</div>
</div>

<!-- Phone -->
<div class="mb-24">
    <x-input-label class="fw-bold" for="phone" :value="__('Phone Number')" />
    <span class="text-danger">*</span>
    <x-text-input id="phone" class="common-input w-100" type="tel" name="phone" placeholder="Enter Phone Number" required />
    <div class="invalid-feedback">Phone must be 10–15 digits (may include +, - or space).</div>
</div>

<!-- Email -->
<div class="mb-24">
    <x-input-label class="fw-bold" for="email" :value="__('Email address')" />
    <span class="text-danger">*</span>
    <x-text-input id="email" class="common-input w-100" type="email" name="email" placeholder="Enter Email Address" required />
    <div class="invalid-feedback">Please enter a valid email address.</div>
</div>

<!-- Password -->
<div class="mb-24">
    <x-input-label class="fw-bold" for="password" :value="__('Password')" />
    <span class="text-danger">*</span>
    <div class="position-relative">
        <input id="password" class="common-input w-100" type="password" name="password" placeholder="Enter Password" required />
        <span class="cursor-pointer toggle-password position-absolute top-50 end-0 me-3 translate-middle-y ph ph-eye-slash" id="toggle-password"></span>
    </div>
    <div class="invalid-feedback">Password must be at least 8 characters long.</div>
</div>


                    <!-- Privacy Policy -->
                    <div class="my-48 text-center">
                        <p class="text-gray-500">Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our
                            <a href="{{ route('PrivacyPolicy') }}"  class="text-main-600 text-decoration-underline">privacy policy</a>.
                        </p>
                    </div>
                    <!-- Submit Button -->
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
            <!-- Register Card End -->
        </div>
    </form>

    </div>
</section>
<!-- =============================== Account Section End =========================== -->


@endsection

<!-- JavaScript for Password Toggle -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    const toggleIcon = document.getElementById('toggle-password');
    const passwordInput = document.getElementById('password');

    let isPasswordVisible = false; // track state manually

    if (toggleIcon && passwordInput) {
        toggleIcon.addEventListener('click', function () {
            console.log('Toggle password visibility clicked');

            isPasswordVisible = !isPasswordVisible;

            if (isPasswordVisible) {
                console.log('Showing password');
                passwordInput.type = 'text';
                toggleIcon.classList.remove('ph-eye-slash');
                toggleIcon.classList.add('ph-eye');
            } else {
                console.log('Hiding password');
                passwordInput.type = 'password';
                toggleIcon.classList.remove('ph-eye');
                toggleIcon.classList.add('ph-eye-slash');
            }
        });
    }
});


</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.querySelector('form');

        const fields = {
            name: {
                input: document.getElementById('name'),
                validate: value => /^[a-zA-Z\s]+$/.test(value),
                message: 'Only letters and spaces are allowed.'
            },
            address: {
                input: document.getElementById('address'),
                validate: value => value.trim().length > 0,
                message: 'Address is required.'
            },
            dob: {
                input: document.getElementById('dob'),
                validate: value => value && new Date(value) < new Date(),
                message: 'Please select a valid date before today.'
            },
            phone: {
                input: document.getElementById('phone'),
                validate: value => /^[0-9+\-\s]{10,15}$/.test(value),
                message: 'Phone must be 10–15 digits (may include +, - or space).'
            },
            email: {
                input: document.getElementById('email'),
                validate: value => /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value),
                message: 'Please enter a valid email address.'
            },
            password: {
                input: document.getElementById('password'),
                validate: value => value.length >= 8,
                message: 'Password must be at least 8 characters long.'
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



    </body>
</html>
