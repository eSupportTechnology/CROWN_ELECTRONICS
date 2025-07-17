<aside class="navbar-aside shadow-sm" id="offcanvas_aside">
    <div class="aside-top" style="padding:0">
        <a href="<?php echo e(route('admin.index')); ?>" class="brand-wrap">
            <?php
                $companySettings = \App\Models\CompanySettings::first();
            ?>

            <?php if($companySettings && $companySettings->logo): ?>
                <img src="<?php echo e(asset('frontend/newstyle/assets/images/logo.png')); ?>" class="logo" alt="DK-Mart"
                    style="margin-left:80%;" />
            <?php else: ?>
                <img src="<?php echo e(asset('frontend/assets/images/logo/preloader-new1.png')); ?>" class="logo" alt="DK-Mart"
                    style="margin-left:80%;" />
            <?php endif; ?>
        </a>
        <div>
            <button class="btn btn-icon btn-aside-minimize"><i
                    class="text-muted material-icons md-menu_open"></i></button>
        </div>
    </div>

    <nav>
        <ul class="menu-aside">
            <li class="menu-item <?php echo e(request()->routeIs('admin.index') ? 'active' : ''); ?>">
                <a class="menu-link" href="<?php echo e(route('admin.index')); ?>">
                    <i class="icon material-icons md-home"></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>

            <li class="menu-item has-submenu <?php echo e(request()->is('admin/products*') || request()->is('admin/categories*') || request()->is('admin/brands*') ? 'active' : ''); ?>">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-shopping_bag"></i>
                    <span class="text">Products</span>
                </a>
                <div class="submenu <?php echo e(request()->is('admin/products*') || request()->is('admin/categories*') || request()->is('admin/brands*') ? 'show' : ''); ?>">
                    <a href="<?php echo e(route('products_list')); ?>" class="<?php echo e(request()->is('admin/products*') ? 'active' : ''); ?>">Product List</a>
                    <a href="<?php echo e(route('categories')); ?>" class="<?php echo e(request()->is('admin/categories*') ? 'active' : ''); ?>">Categories</a>
                    <a href="<?php echo e(route('brand_list')); ?>" class="<?php echo e(request()->is('admin/brands*') ? 'active' : ''); ?>">Brands</a>
                </div>
            </li>

            <li class="menu-item <?php echo e(request()->routeIs('customers') ? 'active' : ''); ?>">
                <a class="menu-link" href="<?php echo e(route('customers')); ?>">
                    <i class="icon material-icons md-group"></i>
                    <span class="text">Customers</span>
                </a>
            </li>

            <li class="menu-item has-submenu <?php echo e(request()->is('admin/affiliate*') ? 'active' : ''); ?>">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-share"></i>
                    <span class="text">Affiliate</span>
                </a>
                <div class="submenu <?php echo e(request()->is('admin/affiliate*') ? 'show' : ''); ?>">
                    <a href="<?php echo e(route('affiliate_customers')); ?>" class="<?php echo e(request()->is('admin/affiliate_customers*') ? 'active' : ''); ?>">Affiliate Customers</a>
                    <a href="<?php echo e(route('affiliate_rules')); ?>" class="<?php echo e(request()->is('admin/affiliate_rules*') ? 'active' : ''); ?>">Affiliate Rules</a>
                    <a href="<?php echo e(route('affiliate_withdrawals')); ?>" class="<?php echo e(request()->is('admin/affiliate_withdrawals*') ? 'active' : ''); ?>">Affiliate Withdrawals</a>
                </div>
            </li>

            <li class="menu-item <?php echo e(request()->routeIs('orders') ? 'active' : ''); ?>">
                <a class="menu-link" href="<?php echo e(route('orders')); ?>">
                    <i class="icon material-icons md-shopping_cart"></i>
                    <span class="text">Orders</span>
                </a>
            </li>

            <li class="menu-item has-submenu <?php echo e(request()->is('admin/vendors*') || request()->is('admin/payments*') ? 'active' : ''); ?>">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-store"></i>
                    <span class="text">Vendors</span>
                </a>
                <div class="submenu <?php echo e(request()->is('admin/vendors*') || request()->is('admin/payments*') ? 'show' : ''); ?>">
                    <a href="<?php echo e(route('vendors')); ?>" class="<?php echo e(request()->is('admin/vendors*') ? 'active' : ''); ?>">Vendors</a>
                    <a href="<?php echo e(route('admin.vendor.payments')); ?>" class="<?php echo e(request()->is('admin/payments*') ? 'active' : ''); ?>">Payment Requests</a>
                </div>
            </li>

            <li class="menu-item <?php echo e(request()->routeIs('adminReviews') ? 'active' : ''); ?>">
                <a class="menu-link" href="<?php echo e(route('adminReviews')); ?>">
                    <i class="icon material-icons md-comment"></i>
                    <span class="text">Reviews</span>
                </a>
            </li>

            <li class="menu-item has-submenu <?php echo e(request()->is('admin/reports*') ? 'active' : ''); ?>">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-description"></i>
                    <span class="text">Reports</span>
                </a>
                <div class="submenu <?php echo e(request()->is('admin/reports*') ? 'show' : ''); ?>">
                    <a href="<?php echo e(route('customerReport')); ?>" class="<?php echo e(request()->routeIs('customerReport') ? 'active' : ''); ?>">Customers</a>
                    <a href="<?php echo e(route('productReport')); ?>" class="<?php echo e(request()->routeIs('productReport') ? 'active' : ''); ?>">Products</a>
                    <a href="<?php echo e(route('affiliateCustomerReport')); ?>" class="<?php echo e(request()->routeIs('affiliateCustomerReport') ? 'active' : ''); ?>">Affiliate Customer</a>
                    <a href="<?php echo e(route('affiliateCusBankData')); ?>" class="<?php echo e(request()->routeIs('affiliateCusBankData') ? 'active' : ''); ?>">Affiliate Bank Details</a>
                    <a href="<?php echo e(route('vendorReport')); ?>" class="<?php echo e(request()->routeIs('vendorReport') ? 'active' : ''); ?>">Vendors</a>
                    <a href="<?php echo e(route('orderReport')); ?>" class="<?php echo e(request()->routeIs('orderReport') ? 'active' : ''); ?>">Orders</a>
                </div>
            </li>

            <li class="menu-item has-submenu <?php echo e(request()->is('admin/settings*') || request()->routeIs(['admin.customer.inquiries', 'manage_company_profile', 'currencies.index', 'users', 'slider', 'banners']) ? 'active' : ''); ?>">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-settings"></i>
                    <span class="text">Settings</span>
                </a>
                <div class="submenu show">
                    <a href="<?php echo e(route('admin.customer.inquiries')); ?>" class="<?php echo e(request()->routeIs('admin.customer.inquiries') ? 'active' : ''); ?>">Inquiries</a>
                    <a href="<?php echo e(route('manage_company_profile')); ?>" class="<?php echo e(request()->routeIs('manage_company_profile') ? 'active' : ''); ?>">Manage Company</a>
                    <a href="<?php echo e(route('currencies.index')); ?>" class="<?php echo e(request()->routeIs('currencies.index') ? 'active' : ''); ?>">Manage Currencies</a>
                    <a href="<?php echo e(route('users')); ?>" class="<?php echo e(request()->routeIs('users') ? 'active' : ''); ?>">Users</a>
                    <a href="<?php echo e(route('slider')); ?>" class="<?php echo e(request()->routeIs('slider') ? 'active' : ''); ?>">Slider Images</a>
                    <a href="<?php echo e(route('banners')); ?>" class="<?php echo e(request()->routeIs('banners') ? 'active' : ''); ?>">Banner Images</a>
                </div>
            </li>
        </ul>
        <hr />
        <br /><br />
    </nav>

    
    <style>
        .menu-aside .menu-item.active > .menu-link {
            background-color: #ffe6e6;
            color: #d32f2f !important;
            font-weight: bold;
        }

        .menu-aside .menu-item.active > .menu-link .icon {
            color: #d32f2f !important;
        }

        .menu-aside .submenu a.active {
            color: #d32f2f !important;
            font-weight: bold;
        }

        .menu-aside .menu-link {
            transition: background-color 0.3s, color 0.3s;
        }
    </style>
</aside>
<?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/AdminDashboard/Sidebar.blade.php ENDPATH**/ ?>