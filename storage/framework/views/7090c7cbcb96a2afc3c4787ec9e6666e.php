<?php $__env->startSection('content'); ?>

<div class="content-header">
    <div>
        <h2 class="content-title card-title">Edit User</h2>
    </div>
</div>

<div class="card mb-4">
    <header class="card-header">
        <div class="row align-items-center">
        </div>
    </header>
    <div class="card-body">
        <form action="<?php echo e(route('system_users.update', $user->id)); ?>" method="POST" enctype="multipart/form-data">
            <?php echo csrf_field(); ?>
            <?php echo method_field('PUT'); ?> <!-- Important: Specify the method for updating -->
            <div class="row">
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" class="form-control" id="name" name="name" value="<?php echo e(old('name', $user->name)); ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="<?php echo e(old('email', $user->email)); ?>" required>
                    </div>
                    <div class="mb-3">
                        <label for="contact" class="form-label">Contact</label>
                        <input type="tel" class="form-control" id="contact" name="contact" value="<?php echo e(old('contact', $user->contact)); ?>" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-3">
                        <label for="role" class="form-label">Role</label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="Admin" <?php echo e($user->role == 'Admin' ? 'selected' : ''); ?>>Admin</option>
                            <option value="User" <?php echo e($user->role == 'User' ? 'selected' : ''); ?>>User</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="image" class="form-label">Upload Image</label>
                        <input type="file" class="form-control" id="image" name="image" accept="image/*" onchange="previewImage(event)">
                    </div>
                    <!-- Image Preview -->
                    <div class="mb-3">
                        <img id="imagePreview" src="<?php echo e(asset('storage/user_images/' . ($user->image ?? 'default-user.png'))); ?>" alt="Current Image" style="max-width: 20%; height: auto;" />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="statusActive" value="active" <?php echo e($user->status == 'Active' ? 'checked' : ''); ?>>
                            <label class="form-check-label" for="statusActive">Active</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="status" id="statusInactive" value="inactive" <?php echo e($user->status == 'Inactive' ? 'checked' : ''); ?>>
                            <label class="form-check-label" for="statusInactive">Inactive</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-end">
                <button type="submit" class="btn btn-primary">Update</button>
            </div>
        </form>
    </div>
</div>

<!-- JavaScript for Image Preview -->
<script>
    function previewImage(event) {
        const reader = new FileReader();
        reader.onload = function() {
            const output = document.getElementById('imagePreview');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\ASUS\Desktop\crown elc\CROWN_ELECTRONICS\resources\views/AdminDashboard/edit_users.blade.php ENDPATH**/ ?>