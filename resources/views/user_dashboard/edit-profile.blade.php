@extends('layouts.user_sidebar')

@section('dashboard-content')
    <style>
        .btn-primary {
            background-color: #ff3c00 !important;
            border-color: #ff3c00 !important;
        }

        .form-control:focus,
        .form-select:focus {
            border-color: hsl(14, 72%, 69%) !important;
            box-shadow: 0 0 0 0.2rem hsla(12, 81%, 40%, 0.251) !important;
        }

        #profileImageInput {
            display: none;
        }

        #profileImagePreview {
            cursor: pointer;
            border-radius: 50%;
        }
    </style>

    <h4 class="px-2 py-2">Edit Profile</h4>
    <div class="container p-4">
        @if (session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
        @endif

        <form action="{{ route('user.profile.update') }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            <div class="mb-3 text-center">
                <!-- Profile image preview -->

                <!-- Hidden file input for image upload -->
                <input type="file" id="profileImageInput" name="profile_image" accept="image/*">
            </div>

            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control @error('full_name') is-invalid @enderror" id="fullName"
                    name="full_name" value="{{ old('full_name', $user->name) }}" placeholder="Enter your full name">
                @error('full_name')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <!-- Email -->
            <div class="mb-3 col-md-6">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" class="form-control @error('email') is-invalid @enderror" id="email"
                    name="email" value="{{ old('email', $user->email) }}" placeholder="Enter your email">
                @error('email')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <!-- Mobile -->
            <div class="mb-3 col-md-6">
                <label for="mobile" class="form-label">Mobile</label>
                <input type="text" class="form-control @error('phone_num') is-invalid @enderror" id="mobile"
                    name="phone_num" value="{{ old('phone_num', $user->phone) }}" placeholder="Enter your mobile number"
                    inputmode="numeric" pattern="[0-9]*" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                @error('phone_num')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <!-- Birthday -->
            <div class="mb-3 col-md-6">
                <label for="birthday" class="form-label">Birthday</label>
                <input type="date" class="form-control @error('date_of_birth') is-invalid @enderror" id="birthday"
                    name="date_of_birth" value="{{ old('date_of_birth', $user->dob) }}">
                @error('date_of_birth')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>

            <!-- Address -->
            <div class="mb-3 col-md-6">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control @error('address') is-invalid @enderror" id="address"
                    name="address" value="{{ old('address', $user->address) }}" placeholder="Enter your address">
                @error('address')
                    <div class="invalid-feedback">{{ $message }}</div>
                @enderror
            </div>
            <button type="submit" class="mt-3 btn btn-primary">Save Changes</button>
        </form>
    </div>

    <script>
        const profileImageInput = document.getElementById('profileImageInput');
        const profileImagePreview = document.getElementById('profileImagePreview');

        // Open file input when profile image is clicked
        profileImagePreview.addEventListener('click', () => profileImageInput.click());

        // Preview the selected image
        profileImageInput.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = (e) => profileImagePreview.src = e.target.result;
                reader.readAsDataURL(file);
            }
        });
    </script>
@endsection
