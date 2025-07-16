<!DOCTYPE html>
<html>
<head>
    <title>Customer Report</title>
    <style>
        body { font-family: sans-serif; font-size: 12px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 6px; text-align: left; }
        h2 { margin-bottom: 5px; }
    </style>
</head>
<body>
    <h2>Customer Report</h2>

    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Registered Date</th>
                <th>Total Orders</th>
            </tr>
        </thead>
        <tbody>
            <?php $__currentLoopData = $customers; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $customer): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr>
                    <td><?php echo e($index + 1); ?></td>
                    <td><?php echo e($customer->name); ?></td>
                    <td><?php echo e($customer->email); ?></td>
                    <td><?php echo e($customer->phone); ?></td>
                    <td><?php echo e($customer->created_at->format('Y-m-d')); ?></td>
                    <td><?php echo e($customer->customer_orders_count ?? 0); ?></td>
                </tr>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </tbody>
    </table>
</body>
</html>
<?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/Reports/customer_report.blade.php ENDPATH**/ ?>