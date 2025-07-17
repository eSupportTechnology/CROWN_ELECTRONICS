<?php $__env->startSection('content'); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        body {
            background-color: #000000;
            color: #ffffff;
        }

        .card {
            background-color: #1a1a1a;
            color: #ffffff;
        }

        .table thead th {
            background-color: #333333;
            color: #ffffff;
        }

        .table tfoot td {
            background-color: #1a1a1a;
            color: #ffffff;
        }

        .table tbody,
        .table tbody tr,
        .table tbody td {
            background-color: #3d3c3cb2 !important;
            color: #ffffff !important;
        }

        .dataTables_wrapper .dataTables_filter input,
        .dataTables_wrapper .dataTables_length select {
            background-color: #222;
            color: #fff;
            border: 1px solid #555;
        }

        .dt-button {
            background-color: #333 !important;
            color: white !important;
            border: 1px solid #555 !important;
        }

        .alert {
            color: #fff;
        }

        .alert-success {
            background-color: #14532d;
            border-color: #166534;
        }

        .alert-danger {
            background-color: #7f1d1d;
            border-color: #991b1b;
        }

        .dataTables_info,
        .dataTables_paginate,
        .dataTables_length,
        .dataTables_filter {
            color: #fff !important;
        }

        .paginate_button.current {
            background: #444 !important;
            color: #fff !important;
        }
    </style>
</head>

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
            <h2 class="content-title">Report - Product List</h2>
        </div>

        <div class="card">
            <div class="card-body">
                <div class="table-responsive">
                    <table id="tableData" class="table table-hover table-bordered text-white">
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
                            <?php $__currentLoopData = $products; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $product): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                                <td><?php echo e($index + 1); ?></td>
                                <td><?php echo e($product->product_id); ?></td>
                                <td><?php echo e($product->product_name); ?></td>
                                <td><?php echo e($product->category->name ?? 'N/A'); ?></td>
                                <td><?php echo e($product->quantity); ?></td>
                                <td><?php echo e($product->currency->symbol ?? 'Rs'); ?> <?php echo e(number_format($product->normal_price, 2)); ?></td>
                            </tr>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="6" class="text-center">End of Product Report</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </section>

    <!-- DataTables Script -->
    <script>
        $(document).ready(function () {
            $('#tableData').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    { extend: 'copyHtml5', footer: true },
                    { extend: 'excelHtml5', footer: true },
                    { extend: 'csvHtml5', footer: true },
                    {
                        extend: 'pdfHtml5',
                        footer: true,
                        title: 'Product Report',
                        orientation: 'landscape',
                        customize: function (doc) {
                            doc.content[1].margin = [0, 0, 0, 20];
                            doc.styles.tableHeader.fillColor = '#000000';
                            doc.styles.tableHeader.color = '#ffffff';
                        }
                    },
                    {
                        extend: 'print',
                        footer: true,
                        title: 'Product Report',
                        customize: function (win) {
                            $(win.document.body).css('background', '#000');
                            $(win.document.body).css('color', '#fff');
                            $(win.document.body).find('table').addClass('display').css('color', '#fff');
                        }
                    }
                ]
            });
        });
    </script>
</body>

</html>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/Reports/product_report.blade.php ENDPATH**/ ?>