<?php $__env->startSection('content'); ?>
<style>


  .card {
    border-radius: 0; 
    width: 90%;
  }

  .thank-you-section {
    display: flex;
    justify-content: center; 
    align-items: center;

  }

  .card-container {
    display: flex;
    justify-content: center; 
    align-items: center; 

  }
</style>

<div class="container mt-20" >
  
  <section class="thank-you-section">
    <!-- Payment -->
    <div class="col-md-12 mb-4 card-container" >
      <div class="card shadow-0 border"  style="background-color: #fafafa;">
        <?php echo csrf_field(); ?>
        <div class="p-20 text-center">
          <h4 style="color: orange;">Thank You for Your Purchase!</h4>
          <h6 class="mt-4">Your order has been confirmed. Your order code is: <strong><?php echo e($order->order_code); ?></strong></h6>
          <p class="mt-4">Please have this amount ready on the delivery day.</p>
          <h5 style="color: orange;">Rs.<?php echo e($order->total_cost); ?></h5>
        </div>
      </div>
    </div>
  </section>
</div>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('frontend.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH D:\Manulas Doc\Project\Intern\Project\CROWN_ELECTRONICS\CROWN_ELECTRONICS\resources\views/frontend/order_received.blade.php ENDPATH**/ ?>