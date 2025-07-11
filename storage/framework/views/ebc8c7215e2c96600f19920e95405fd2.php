<?php $__env->startSection('dashboard-content'); ?>

<style>
    h4.py-2.px-2 {
        margin-bottom: 20px;
    }

    .dashboard-header {
        display: flex;
        align-items: center;
        padding: 10px;
        border-bottom: 1px solid #e0e0e0;
    }

    .profile-info {
        margin-left: 20px;
    }

    .profile-info h4 {
        margin: 0;
        font-size: 18px;
        font-weight: bold;
    }

    .profile-info p {
        margin: 0;
        font-size: 14px;
        color: #888;
    }

    .orders-section {
        margin-top: 30px;
        padding: 20px;
        border-bottom: 1px solid #e0e0e0;
        margin-bottom: 20px;
    }

    .orders-row {
        display: flex;
        justify-content: space-around;
        padding: 10px 0;
    }

    .orders-box {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        width: 100px;
        padding: 10px;
        transition: all 0.3s ease;
    }

    .orders-box:hover {
        transform: scale(1.05);
        cursor: pointer;
    }

    .orders-box img {
        width: 50px;
        height: 50px;
        margin-bottom: 5px;
    }

    .orders-box p {
        margin: 0;
        font-size: 13px;
        white-space: nowrap;
        font-weight: bold;
    }
     @media (max-width: 576px) {
        .dashboard-header {
            flex-direction: column;
            align-items: flex-start;
        }

        .profile-info {
            margin-left: 0;
            margin-top: 10px;
        }

        .orders-row {
            justify-content: center;
        }

        .orders-box {
            width: 80px;
        }
    }
     @media (max-width: 576px) {
        .dashboard-header {
            flex-direction: column;
            align-items: flex-start;
        }

        .profile-info {
            margin-left: 0;
            margin-top: 10px;
        }

        .orders-row {
            justify-content: center;
        }

        .orders-box {
            width: 80px;
        }
    }
</style>

<!-- Dashboard Header -->
<h4 class="px-2 py-2">Dashboard</h4>
<div class="dashboard-header">
    <img src="<?php echo e(asset('path/to/default-user.png')); ?>" alt="Profile Image" class="rounded-circle" width="60" height="60">
    <div class="profile-info">
        <h4><?php echo e(Auth::user()->name); ?></h4>
        <p><?php echo e(Auth::user()->email); ?></p>
    </div>
</div>

<!-- My Orders Section -->
<div class="orders-section">
    <h5>My Orders</h5>
    <div class="orders-row">
        <div class="orders-box">
            <img src="https://icons.veryicon.com/png/128/miscellaneous/bigmk_app_icon/unpaid-2.png" alt="Unpaid">
            <p>Unpaid</p>
        </div>
        <div class="orders-box">
            <img src="https://icons.veryicon.com/png/128/miscellaneous/cb/to-be-shipped-25.png" alt="To be shipped">
            <p>To be Shipped</p>
        </div>
        <div class="orders-box">
            <img src="https://icons.veryicon.com/png/128/miscellaneous/bigmk_app_icon/in-transit.png" alt="Shipped">
            <p>Shipped</p>
        </div>
        <div class="orders-box">
            <img src="https://icons.veryicon.com/png/128/miscellaneous/document-format/reviewed-5.png" alt="To be reviewed">
            <p>To be revieweds</p>
        </div>
        <a href="<?php echo e(route('My-Reviews')); ?>" class="orders-box text-decoration-none text-dark">
            <?php
                use App\Models\CustomerOrder;
                use App\Models\CustomerOrderItems;

                $userId = Auth::id();
                $orderCodes = CustomerOrder::where('user_id', $userId)->pluck('order_code');
                $toBeReviewedCount = CustomerOrderItems::whereIn('order_code', $orderCodes)
                    ->where('reviewed', 'no')
                    ->count();
            ?>
            <img src="https://icons.veryicon.com/png/128/miscellaneous/document-format/reviewed-5.png" alt="To be Reviewed">
            <p>To be Reviewed (<?php echo e($toBeReviewedCount); ?>)</p>
        </a>
    </div>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.user_sidebar', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\ASUS\Desktop\crown elc\CROWN_ELECTRONICS\resources\views/user_dashboard/dashboard.blade.php ENDPATH**/ ?>