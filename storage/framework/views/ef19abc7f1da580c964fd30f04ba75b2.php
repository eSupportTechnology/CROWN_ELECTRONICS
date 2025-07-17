<?php $__env->startSection('content'); ?>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Product List PDF</title>
        <style>
            body {
                font-family: sans-serif;
                font-size: 12px;
                background-color: #000;
                color: #fff;
            }

            h2 {
                text-align: center;
                color: #fff;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 15px;
            }

            th,
            td {
                border: 1px solid #555;
                padding: 8px;
                text-align: center;
            }

            th {
                background-color: #222;
                color: #fff;
            }

            tr:nth-child(even) td {
                background-color: #111;
            }

            tr:nth-child(odd) td {
                background-color: #000;
            }

            .table tbody,
            .table tbody tr,
            .table tbody td {
                background-color: #3d3c3cb2 !important;
                color: #ffffff !important;
            }
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
                        <td><?php echo e($product->currency->symbol ?? 'Rs'); ?> <?php echo e(number_format($product->normal_price, 2)); ?></td>
                    </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>

    </body>

    </html>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/Reports/product_report.blade.php ENDPATH**/ ?>