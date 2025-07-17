<<<<<<< HEAD
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
            <h2 class="content-title">Report - Products</h2>
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
                                        <th>Product ID</th>
                                        <th>Product</th>
                                        <th>Category</th>
                                        <th>Quantity</th>
                                        <th>Normal Price (Rs)</th>
                                        <th>Affiliate Price (Rs)</th>
                                        <th>Commision Price (Rs)</th>
                                        <th class="text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index=>$product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <tr class="product-row" data-category="<?php echo e($product->category->id ?? 'none'); ?>">
                                        <td><?php echo e($index+1); ?></td>
                                        <td><?php echo e($product->product_id); ?></td>
                                        <td><?php echo e($product->product_name); ?></td>
                                        <td><?php echo e($product->category->name ?? 'N/A'); ?></td>
                                        <td><?php echo e($product->quantity); ?></td>
                                        <td><?php echo e($product->normal_price); ?></td>
                                        <td><?php echo e($product->affiliate_price ?? 'No'); ?></td>
                                        <td><?php echo e($product->commission_price ?? 'No'); ?></td>
                                        <td class="text-end">
                                            <div>
                                                <a href="<?php echo e(route('products.view', $product->id)); ?>" class="btn btn-view btn-sm me-2">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                               
                                            </div>
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
                        title: 'Product Report',
                        customize: function(doc) {
                            // Set a margin for the footer
                            doc.content[1].margin = [0, 0, 0, 20];
                        }
                    },
                    {
                        extend: 'print',
                        footer: true,
                        title: 'Product Report',
                    }
                ],

            });


        });
    </script>



</body>

</html>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/Reports/product_report.blade.php ENDPATH**/ ?>
=======
<!DOCTYPE html>
<html>
<head>
    <title>Product List PDF</title>
    <style>
        body { font-family: sans-serif; font-size: 12px; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #000; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>Product List</h2>
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Product ID</th>
                <th>Product</th>
                <th>Category</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
            <tr>
                <td><?php echo e($loop->iteration); ?></td>
                <td><?php echo e($product->product_id); ?></td>
                <td><?php echo e($product->product_name); ?></td>
                <td><?php echo e($product->category->name ?? 'N/A'); ?></td>
                <td><?php echo e($product->quantity); ?></td>
                <td><?php echo e($product->currency->symbol ?? 'Rs'); ?> <?php echo e($product->normal_price); ?></td>
            </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </tbody>
    </table>
</body>
</html>
<?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/Reports/product_report.blade.php ENDPATH**/ ?>
>>>>>>> 1006f4f51c608c85d6f4e6ac86418b5fc35da199
