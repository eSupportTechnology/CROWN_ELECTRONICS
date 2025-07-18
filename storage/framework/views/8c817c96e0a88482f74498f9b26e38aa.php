<?php $__env->startSection('dashboard-content'); ?>
<style>
    /* Existing styles remain unchanged */

    /* Add tracking button styles */
    .track-button {
        color: #fff;
        background-color: #ff7b00;
        /* Orange */
        border: none;
        padding: 5px 15px;
        border-radius: 5px;
        font-size: 13px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .track-button:hover {
        background-color: #e56b00;
        /* Darker orange */
    }
</style>

<h4 class="px-2 py-2">My Orders</h4>


<!-- All Orders Tab -->
<div id="all-orders" class="tab-content active">
    <?php if(auth()->guard()->check()): ?>
    <?php $__empty_1 = true; $__currentLoopData = $orders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
    <div class="order-card" style="border: 1px solid #ccc; border-radius: 10px; padding: 15px; margin-bottom: 15px;">
        <div class="order-card-header d-flex justify-content-between align-items-center" style="margin-bottom: 20px; border-bottom: 1px solid #eaeaea;">
            <span class="status <?php echo e(strtolower(str_replace(' ', '-', $order->status))); ?>"><?php echo e($order->status); ?></span>
        </div>

        <div class="order-card-body d-flex align-items-center">
            <div class="order-image" style="margin-right: 15px;">
                <?php $__currentLoopData = $order->items; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $orderItem): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if($orderItem->product && $orderItem->product->images->first()): ?>
                <img src="<?php echo e(asset('storage/' . $orderItem->product->images->first()->image_path)); ?>" alt="Product Image" style="width: 70px; height: 80px;">
                <?php break; ?>
                <?php endif; ?>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </div>
            <div class="order-info" style="font-size: 13px; color: black;">
                <p><a href="#" class="order-link">Order ID:</a> <a href="#" class="order-link"><?php echo e($order->order_code); ?></a></p>
                <p class="order-date">Order date: <?php echo e($order->created_at->format('Y-m-d')); ?></p>
                <p class="order-price">Total: Rs <?php echo e(number_format($order->total_cost, 2)); ?></p>
            </div>
            <div style="text-align: right; margin-left: auto;">
                <a href="<?php echo e(route('user.track-order', $order->order_code)); ?>" class="track-button">Track Order</a>
            </div>
        </div>
    </div>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
    <div class="text-center py-5">
        <h5 style="color: #999;">You have no orders yet.</h5>
        <a href="<?php echo e(route('shop.index')); ?>" class="btn btn-primary mt-3">Start Shopping</a>
    </div>
    <?php endif; ?>

    <?php endif; ?>
    <?php if(auth()->guard()->guest()): ?>
    <div class="alert alert-warning" role="alert">
        Please <a href="<?php echo e(route('login')); ?>" class="alert-link">log in</a> to view your orders.
    </div>
    <?php endif; ?>
</div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.user_sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\ASUS\Desktop\crown elc\CROWN_ELECTRONICS\resources\views/user_dashboard/my-orders.blade.php ENDPATH**/ ?>