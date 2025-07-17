<?php $__env->startSection('content'); ?>
    <!DOCTYPE html>
    <html lang="en">
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
            border: 1px solid #0c0b0b !important;
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
                <h2 class="content-title">Report - Customers</h2>
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
                                            <th>No.</th>
                                            <th>Name</th>
                                            <th>DOB</th>
                                            <th>Email</th>
                                            <th>Phone Number</th>
                                            <th>Address</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $__currentLoopData = $customers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $customer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                            <tr>
                                                <td><?php echo e($index + 1); ?></td>
                                                <td><?php echo e($customer->name); ?> </td>
                                                <td><?php echo e($customer->dob); ?> </td>
                                                <td><?php echo e($customer->email); ?></td>
                                                <td><?php echo e($customer->phone); ?></td>
                                                <td><?php echo e($customer->address); ?></td>

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
                            title: 'Customer Report',
                            customize: function(doc) {
                                // Set a margin for the footer
                                doc.content[1].margin = [0, 0, 0, 20];
                            }
                        },
                        {
                            extend: 'print',
                            footer: true,
                            title: 'Customer Report',
                        }
                    ],

                });


            });
        </script>



    </body>

    </html>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/Reports/customer_report.blade.php ENDPATH**/ ?>