<?php $__env->startSection('content'); ?>
<div class="content-header">
                    <div>
                        <h2 class="content-title card-title">Dashboard</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-3">
                        <div class="card card-body mb-4">
                            <article class="icontext">
                                <span class="icon icon-sm rounded-circle bg-primary-light"><i class="text-primary material-icons md-monetization_on"></i></span>
                                <div class="text">
                                    <h6 class="mb-1 card-title">Today Revenue</h6>
                                    <span>Rs <?php echo e($totalCostToday); ?></span>
                                </div>
                            </article>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card card-body mb-4">
                            <article class="icontext">
                                <span class="icon icon-sm rounded-circle bg-success-light"><i class="text-success material-icons md-local_shipping"></i></span>
                                <div class="text">
                                    <h6 class="mb-1 card-title">Orders</h6>
                                    <span><?php echo e($orderCount); ?></span>
                                </div>
                            </article>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card card-body mb-4">
                            <article class="icontext">
                                <span class="icon icon-sm rounded-circle bg-warning-light"><i class="text-warning material-icons md-qr_code"></i></span>
                                <div class="text">
                                    <h6 class="mb-1 card-title">Products</h6>
                                    <span><?php echo e($productCount); ?></span>
                                </div>
                            </article>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="card card-body mb-4">
                            <article class="icontext">
                                <span class="icon icon-sm rounded-circle bg-info-light"><i class="text-info material-icons md-groups"></i></span>
                                <div class="text">
                                    <h6 class="mb-1 card-title">Customers</h6>
                                    <span><?php echo e($customerCount); ?></span>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-8 col-lg-12">
                        <div class="card mb-4">
                            <article class="card-body">
                                <h5 class="card-title">Sale statistics</h5>
                                <canvas id="myChartSale" height="120"></canvas>
                            </article>
                        </div>
                     
                    </div>
                    <div class="col-xl-4 col-lg-12">
                        <div class="card mb-4">
                        <article class="card-body">
                                        <h5 class="card-title">Recent activities</h5>
                                        <ul class="verti-timeline list-unstyled font-sm">
                                            <?php $__currentLoopData = $recentActivities; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $activity): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <li class="event-list active">
                                                    <div class="event-timeline-dot">
                                                        <i class="material-icons md-play_circle_outline font-xxl animation-fade-right"></i>
                                                    </div>
                                                    <div class="media">
                                                        <div class="me-3">
                                                            <h6>
                                                                <span><?php echo e($activity['date']); ?></span>
                                                                <i class="material-icons md-trending_flat text-brand ml-15 d-inline-block"></i>
                                                            </h6>
                                                        </div>
                                                        <div class="media-body">
                                                            <div><?php echo e($activity['message']); ?></div>
                                                        </div>
                                                    </div>
                                                </li>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        </ul>
                                    </article>
                        </div>
                       
                    </div>
                </div>
                <div class="card mb-4">
                    <header class="card-header">
                        <h4 class="card-title">Latest orders</h4>
                    </header>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="table-responsive">
                                <table class="table align-middle table-nowrap mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th scope="col" class="text-center">
                                                <div class="form-check align-middle">
                                                    <input class="form-check-input" type="checkbox" id="transactionCheck01" />
                                                    <label class="form-check-label" for="transactionCheck01"></label>
                                                </div>
                                            </th>
                                            <th class="align-middle" scope="col">Order ID</th>
                                            <th class="align-middle" scope="col">Customer Name</th>
                                            <th class="align-middle" scope="col">Date</th>
                                            <th class="align-middle" scope="col">Total</th>
                                            <th class="align-middle" scope="col">Payment Status</th>
                                            <th class="align-middle" scope="col">View Details</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $__currentLoopData = $latestOrders; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $order): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <tr>
                                            <td class="text-center">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" id="transactionCheck<?php echo e($order->id); ?>" />
                                                    <label class="form-check-label" for="transactionCheck<?php echo e($order->id); ?>"></label>
                                                </div>
                                            </td>
                                            <td><a href="#" class="fw-bold">#<?php echo e($order->order_code); ?></a></td>
                                            <td><?php echo e($order->customer_name); ?></td> 
                                            <td><?php echo e($order->created_at->format('Y-m-d')); ?></td>
                                            <td><?php echo e($order->total_cost); ?></td>
                                            <td>
                                                <span class="badge badge-pill badge-soft-<?php echo e($order->payment_status == 'Paid' ? 'success' : 'danger'); ?>">
                                                    <?php echo e($order->payment_status); ?>

                                                </span>
                                            </td>
                                            <td>
                                                <a href="<?php echo e(route('order-details', $order->order_code)); ?>" class="btn btn-xs">View details</a>
                                            </td>
                                        </tr>
                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- table-responsive end// -->
                    </div>
                </div>

              

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const ctx = document.getElementById('myChartSale').getContext('2d');
    const salesData = <?php echo json_encode($salesChartData, 15, 512) ?>;

    new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                label: 'Monthly Sales',
                data: salesData,
                fill: true,
                backgroundColor: 'rgba(44, 120, 220, 0.2)',
                borderColor: 'rgba(44, 120, 220)',
                borderWidth: 2,
                tension: 0.4,
            }],
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
            },
            scales: {
                y: {
                    beginAtZero: true,
                },
            },
        },
    });
</script>

<?php $__env->stopSection(); ?>
<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\ASUS\Desktop\crown elc\CROWN_ELECTRONICS\resources\views/AdminDashboard/Home.blade.php ENDPATH**/ ?>