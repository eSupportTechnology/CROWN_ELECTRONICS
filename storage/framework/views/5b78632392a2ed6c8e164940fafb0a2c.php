<?php $__env->startSection('content'); ?>
<!DOCTYPE html>
<html lang="en">

<body>
    <?php if(session('success')): ?>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <?php echo e(session('success')); ?>

        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <?php endif; ?>

    <?php if($errors->any()): ?>
    <div class="alert alert-danger">
        <ul class="mb-0">
            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <li><?php echo e($error); ?></li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
    </div>
    <?php endif; ?>

    <section class="content-main">
        <div class="content-header">
            <h2 class="content-title">Report - Vendors</h2>
        </div>

        <!-- Room Form -->
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <!-- Room Table -->
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table id="tableData" class="table table-hover display">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Name</th>
                                        <th>Shop Name</th>
                                        <th>Address</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php $__currentLoopData = $vendors; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $vendor): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr>
                                        <td><?php echo e($index + 1); ?></td>
                                        <td><?php echo e($vendor->name); ?></td>
                                        <td><?php echo e($vendor->shop ? $vendor->shop->shop_name : 'No Shop'); ?></td>
                                        <td><?php echo e($vendor->address); ?></td>
                                        <td><?php echo e($vendor->email); ?></td>
                                        <td><?php echo e($vendor->phone); ?></td>
                                        <td>
                                            <span class="<?php echo e(strtolower($vendor->status)); ?>-status">
                                                <?php echo e(ucfirst($vendor->status)); ?>

                                            </span>
                                        </td>
                                    </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>

    <!-- JavaScript to handle delete confirmation -->
    <script>
        $(document).ready(function() {
            var table = $('#tableData').DataTable({
                dom: 'Bfrtip', // Layout for DataTables with Buttons
                buttons: [{
                        extend: 'copyHtml5',
                        footer: true
                    },
                    {
                        extend: 'excelHtml5',
                        footer: true
                    },
                    {
                        extend: 'csvHtml5',
                        footer: true
                    },
                    {
                        extend: 'pdfHtml5',
                        footer: true,
                        title: 'Vendor Report',
                        customize: function(doc) {
                            // Set a margin for the footer
                            doc.content[1].margin = [0, 0, 0, 20];
                        }
                    },
                    {
                        extend: 'print',
                        footer: true,
                        title: 'Vendor Report',
                    }
                ],

            });


        });
    </script>



</body>

</html>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/Reports/vendor_report.blade.php ENDPATH**/ ?>