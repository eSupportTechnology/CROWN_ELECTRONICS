@extends ('AdminDashboard.master')

@section('content')

    <style>
        .modal-content {
            background-color: #1a1a1a !important;
            /* Dark background */
            color: #ffffff !important;
            /* Light text */
        }

        .modal-content .form-label,
        .modal-content .form-check-label,
        .modal-content .modal-title {
            color: #ffffff !important;
        }

        .modal-content .form-control,
        .modal-content .form-select {
            background-color: #333 !important;
            /* Dark input background */
            color: #ffffff !important;
            /* Light text in input */
            border: 1px solid #555;
        }

        .modal-content input::placeholder {
            color: #bbbbbb !important;
            /* Light gray placeholder */
        }
    </style>


    <div class="content-header">
        <div>
            <h2 class="content-title card-title">Users</h2>
        </div>
        <div>
            <button type="button" class="btn btn-primary btn-sm rounded" data-bs-toggle="modal"
                data-bs-target="#addUserModal">Add</button>
        </div>
    </div>

    <div class="card mb-4">
        <header class="card-header"></header>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Image</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th class="text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @if ($users->isEmpty())
                            <tr>
                                <td colspan="8" class="text-center">No users found.</td>
                            </tr>
                        @else
                            @foreach ($users as $user)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $user->name }}</td>
                                    <td>
                                        <img src="{{ asset('storage/user_images/' . ($user->image ?? 'default-user.png')) }}"
                                            class="img-sm img-thumbnail" alt="user" />
                                    </td>
                                    <td>{{ $user->email }}</td>
                                    <td>{{ $user->contact }}</td>
                                    <td>{{ $user->role }}</td>
                                    <td>
                                        <span class="badge {{ $user->status === 'Active' ? 'bg-success' : 'bg-danger' }}">
                                            {{ $user->status }}
                                        </span>
                                    </td>
                                    <td class="text-end">
                                        <a href="{{ route('edit_users', $user->id) }}" class="btn btn-warning btn-sm me-2">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <form id="delete-form-{{ $user->id }}"
                                            action="{{ route('delete_users', $user->id) }}" method="POST"
                                            style="display: inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="button" class="btn btn-danger btn-sm"
                                                onclick="confirmDelete('delete-form-{{ $user->id }}', 'Are you sure you want to delete this user?');">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        @endif
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-black">Add New User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('system_users.store') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" class="form-control text-white " id="name" name="name"
                                        placeholder="Full name" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control @error('email') is-invalid @enderror"
                                        id="email" name="email" value="{{ old('email') }}"
                                        placeholder="example@mail.com" required>
                                    @error('email')
                                        <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="mb-3">
                                    <label for="contact" class="form-label">Contact</label>
                                    <input type="tel" class="form-control" id="contact" name="contact"
                                        placeholder="Phone number">
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="Password" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="role" class="form-label">Role</label>
                                    <select class="form-select" id="role" name="role" required>
                                        <option selected disabled>Select role</option>
                                        <option value="Admin">Admin</option>
                                        <option value="User">User</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="image" class="form-label">Upload Image</label>
                                    <input type="file" class="form-control" id="image" name="image"
                                        accept="image/*">
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Status</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" value="Active"
                                            checked>
                                        <label class="form-check-label" for="statusActive">Active</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="status" value="Inactive">

                                        <label class="form-check-label" for="statusInactive">Inactive</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary" id="modalCloseBtn"
                                data-bs-dismiss="modal">Close</button>

                            <button type="submit" class="btn btn-primary">Save User</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.getElementById('modalCloseBtn').addEventListener('click', function() {
            setTimeout(() => {
                location.reload();
            }, 300);
        });
    </script>

@endsection
