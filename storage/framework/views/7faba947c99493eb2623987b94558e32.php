<?php $__env->startSection('content'); ?>

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
        <h2 class="content-title card-title">Currencies</h2>
    </div>
    <div>
        <button type="button" class="btn btn-primary btn-sm rounded" data-bs-toggle="modal" data-bs-target="#addCurrencyModal">Add</button>
    </div>
</div>

<div class="card mb-4">
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Code</th>
                        <th>Name</th>
                        <th>Symbol</th>
                        <th>Exchange Rate</th>
                        <th class="text-end">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if($currencies->isEmpty()): ?>
                        <tr>
                            <td colspan="5" class="text-center">No currencies found.</td>
                        </tr>
                    <?php else: ?>
                        <?php $__currentLoopData = $currencies; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $currency): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                                <td><?php echo e($loop->iteration); ?></td>
                                <td><?php echo e($currency->code); ?></td>
                                <td><?php echo e($currency->name); ?></td>
                                <td><?php echo e($currency->symbol); ?></td>
                                <td><?php echo e($currency->exchange_rate); ?></td>
                                <td class="text-end">
                                    <a href="<?php echo e(route('currencies.edit', $currency->id)); ?>" class="btn btn-warning btn-sm me-2">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="<?php echo e(route('currencies.destroy', $currency->id)); ?>" method="POST" style="display: inline;">
                                        <?php echo csrf_field(); ?>
                                        <?php echo method_field('DELETE'); ?>
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="confirmDelete('currency-form-<?php echo e($currency->id); ?>', 'Are you sure you want to delete this currency?');">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Add Currency Modal -->
<div class="modal fade" id="addCurrencyModal" tabindex="-1" aria-labelledby="addCurrencyModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add New Currency</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="<?php echo e(route('currencies.store')); ?>" method="POST">
                    <?php echo csrf_field(); ?>
                    <div class="mb-3">
                        <label for="code" class="form-label">Currency Code</label>
                        <input type="text" class="form-control" id="code" name="code" placeholder="e.g. USD" required>
                    </div>
                    <div class="mb-3">
                        <label for="name" class="form-label">Currency Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="e.g. US Dollar" required>
                    </div>
                    <div class="mb-3">
                        <label for="symbol" class="form-label">Currency Symbol</label>
                        <input type="text" class="form-control" id="symbol" name="symbol" placeholder="e.g. $">
                    </div>
                    <div class="mb-3">
                        <label for="exchange_rate" class="form-label">Currency Exchange Rate</label>
                        <input type="text" class="form-control" id="exchange_rate" name="exchange_rate" placeholder="e.g. 1.00">
                    </div>
                    <div class="text-end">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Currency</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/currencies.blade.php ENDPATH**/ ?>