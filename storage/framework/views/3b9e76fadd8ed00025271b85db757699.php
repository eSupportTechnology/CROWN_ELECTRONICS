<?php $__env->startSection('content'); ?>

<div class="content-header">
    <div>
        <h2 class="content-title card-title">Affiliate Rules</h2>
    </div>
    <div>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
                <i class="fa-solid fa-plus"></i> Add
            </button>
    </div>
</div>


        <div class="card">
            <div class="card-body">
                <div class="container mt-4 mb-4">
                    <div class="table-responsive">
                        <table id="example" class="table" style="width:100%">
                            <thead>
                                <tr>
                                    <th style="width: 10%">#</th>
                                    <th>Rule</th>
                                    <th style="width: 15%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $__currentLoopData = $rules; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $rule): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($loop->iteration); ?></td>
                                        <td><?php echo e($rule->rule); ?></td>
                                        <td>
                                            <button class="btn btn-warning btn-sm edit-btn" data-bs-toggle="modal" data-bs-target="#editRuleModal" data-id="<?php echo e($rule->id); ?>" data-rule="<?php echo e($rule->rule); ?>">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <form id="deleteForm<?php echo e($rule->id); ?>" action="<?php echo e(route('affiliate_rules.destroy', $rule->id)); ?>" method="POST" style="display: inline;">
                                                <?php echo csrf_field(); ?>
                                                <?php echo method_field('DELETE'); ?>
                                                <button type="button" class="btn btn-danger btn-sm" onclick="confirmDelete('deleteForm<?php echo e($rule->id); ?>', 'Are you sure you want to delete this rule?')">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>

                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


<!-- Add User Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content" style="background-color: #222736">
            <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel">Add New Rule</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="p-4 modal-body">
                <form id="addUserForm" action="<?php echo e(route('admin_rules.store')); ?>" method="POST" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <textarea name="rule" rows="3" class="form-control w-100" required></textarea>
                    <button type="submit" class="mt-2 btn btn-success btn-create">Add</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Edit Rule Modal -->
<div class="modal fade" id="editRuleModal" tabindex="-1" aria-labelledby="editRuleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editRuleModalLabel">Edit Rule</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="p-4 modal-body">
                <form id="editRuleForm" action="<?php echo e(route('admin_users.update', ':id')); ?>" method="POST">
                    <?php echo csrf_field(); ?>
                    <?php echo method_field('PUT'); ?>
                    <div class="mb-3">
                        <label for="edit_rule" class="form-label">Rule</label>
                        <textarea id="edit_rule" name="rule" class="form-control" rows="3" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-success btn-create">Update</button>
                </form>
            </div>
        </div>
    </div>
</div>



<script>
    document.addEventListener('DOMContentLoaded', function () {
        const editButtons = document.querySelectorAll('.edit-btn');

        editButtons.forEach(button => {
            button.addEventListener('click', function () {
                const ruleId = this.getAttribute('data-id');
                const ruleText = this.getAttribute('data-rule');

                const form = document.getElementById('editRuleForm');
                form.action = form.action.replace(':id', ruleId);

                document.getElementById('edit_rule').value = ruleText;
            });
        });
    });
</script>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\ASUS\Desktop\crown elc\CROWN_ELECTRONICS\resources\views/AdminDashboard/affiliate_rules.blade.php ENDPATH**/ ?>