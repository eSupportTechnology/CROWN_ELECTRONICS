<aside class="navbar-aside shadow-sm" id="offcanvas_aside">
    <div class="aside-top" style="padding:0">
        <a href="{{ route('admin.index') }}" class="brand-wrap">
            @php
                $companySettings = \App\Models\CompanySettings::first();
            @endphp

            @if ($companySettings && $companySettings->logo)
                <img src="{{ asset('frontend/newstyle/assets/images/logo.png') }}" class="logo" alt="DK-Mart"
                    style="margin-left:80%;" />
            @else
                <img src="{{ asset('frontend/assets/images/logo/preloader-new1.png') }}" class="logo" alt="DK-Mart"
                    style="margin-left:80%;" />
            @endif
        </a>
        <div>
            <button class="btn btn-icon btn-aside-minimize"><i
                    class="text-muted material-icons md-menu_open"></i></button>
        </div>
    </div>

    <nav>
        <ul class="menu-aside">
            <li class="menu-item {{ request()->routeIs('admin.index') ? 'active' : '' }}">
                <a class="menu-link" href="{{ route('admin.index') }}">
                    <i class="icon material-icons md-home"></i>
                    <span class="text">Dashboard</span>
                </a>
            </li>

            <li class="menu-item has-submenu {{ request()->is('admin/products*') || request()->is('admin/categories*') || request()->is('admin/brands*') ? 'active' : '' }}">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-shopping_bag"></i>
                    <span class="text">Products</span>
                </a>
                <div class="submenu {{ request()->is('admin/products*') || request()->is('admin/categories*') || request()->is('admin/brands*') ? 'show' : '' }}">
                    <a href="{{ route('products_list') }}" class="{{ request()->is('admin/products*') ? 'active' : '' }}">Product List</a>
                    <a href="{{ route('categories') }}" class="{{ request()->is('admin/categories*') ? 'active' : '' }}">Categories</a>
                    <a href="{{ route('brand_list') }}" class="{{ request()->is('admin/brands*') ? 'active' : '' }}">Brands</a>
                </div>
            </li>

            <li class="menu-item {{ request()->routeIs('customers') ? 'active' : '' }}">
                <a class="menu-link" href="{{ route('customers') }}">
                    <i class="icon material-icons md-group"></i>
                    <span class="text">Customers</span>
                </a>
            </li>

            <li class="menu-item has-submenu {{ request()->is('admin/affiliate*') ? 'active' : '' }}">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-share"></i>
                    <span class="text">Affiliate</span>
                </a>
                <div class="submenu {{ request()->is('admin/affiliate*') ? 'show' : '' }}">
                    <a href="{{ route('affiliate_customers') }}" class="{{ request()->is('admin/affiliate_customers*') ? 'active' : '' }}">Affiliate Customers</a>
                    <a href="{{ route('affiliate_rules') }}" class="{{ request()->is('admin/affiliate_rules*') ? 'active' : '' }}">Affiliate Rules</a>
                    <a href="{{ route('affiliate_withdrawals') }}" class="{{ request()->is('admin/affiliate_withdrawals*') ? 'active' : '' }}">Affiliate Withdrawals</a>
                </div>
            </li>

            <li class="menu-item {{ request()->routeIs('orders') ? 'active' : '' }}">
                <a class="menu-link" href="{{ route('orders') }}">
                    <i class="icon material-icons md-shopping_cart"></i>
                    <span class="text">Orders</span>
                </a>
            </li>

            <li class="menu-item has-submenu {{ request()->is('admin/vendors*') || request()->is('admin/payments*') ? 'active' : '' }}">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-store"></i>
                    <span class="text">Vendors</span>
                </a>
                <div class="submenu {{ request()->is('admin/vendors*') || request()->is('admin/payments*') ? 'show' : '' }}">
                    <a href="{{ route('vendors') }}" class="{{ request()->is('admin/vendors*') ? 'active' : '' }}">Vendors</a>
                    <a href="{{ route('admin.vendor.payments') }}" class="{{ request()->is('admin/payments*') ? 'active' : '' }}">Payment Requests</a>
                </div>
            </li>

            <li class="menu-item {{ request()->routeIs('adminReviews') ? 'active' : '' }}">
                <a class="menu-link" href="{{ route('adminReviews') }}">
                    <i class="icon material-icons md-comment"></i>
                    <span class="text">Reviews</span>
                </a>
            </li>

            <li class="menu-item has-submenu {{ request()->is('admin/reports*') ? 'active' : '' }}">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-description"></i>
                    <span class="text">Reports</span>
                </a>
                <div class="submenu {{ request()->is('admin/reports*') ? 'show' : '' }}">
                    <a href="{{ route('customerReport') }}" class="{{ request()->routeIs('customerReport') ? 'active' : '' }}">Customers</a>
                    <a href="{{ route('productReport') }}" class="{{ request()->routeIs('productReport') ? 'active' : '' }}">Products</a>
                    <a href="{{ route('affiliateCustomerReport') }}" class="{{ request()->routeIs('affiliateCustomerReport') ? 'active' : '' }}">Affiliate Customer</a>
                    <a href="{{ route('affiliateCusBankData') }}" class="{{ request()->routeIs('affiliateCusBankData') ? 'active' : '' }}">Affiliate Bank Details</a>
                    <a href="{{ route('vendorReport') }}" class="{{ request()->routeIs('vendorReport') ? 'active' : '' }}">Vendors</a>
                    <a href="{{ route('orderReport') }}" class="{{ request()->routeIs('orderReport') ? 'active' : '' }}">Orders</a>
                </div>
            </li>

            <li class="menu-item has-submenu {{ request()->is('admin/settings*') || request()->routeIs(['admin.customer.inquiries', 'manage_company_profile', 'currencies.index', 'users', 'slider', 'banners']) ? 'active' : '' }}">
                <a class="menu-link" href="#">
                    <i class="icon material-icons md-settings"></i>
                    <span class="text">Settings</span>
                </a>
                <div class="submenu show">
                    <a href="{{ route('admin.customer.inquiries') }}" class="{{ request()->routeIs('admin.customer.inquiries') ? 'active' : '' }}">Inquiries</a>
                    <a href="{{ route('manage_company_profile') }}" class="{{ request()->routeIs('manage_company_profile') ? 'active' : '' }}">Manage Company</a>
                    <a href="{{ route('currencies.index') }}" class="{{ request()->routeIs('currencies.index') ? 'active' : '' }}">Manage Currencies</a>
                    <a href="{{ route('users') }}" class="{{ request()->routeIs('users') ? 'active' : '' }}">Users</a>
                    <a href="{{ route('slider') }}" class="{{ request()->routeIs('slider') ? 'active' : '' }}">Slider Images</a>
                    <a href="{{ route('banners') }}" class="{{ request()->routeIs('banners') ? 'active' : '' }}">Banner Images</a>
                </div>
            </li>
        </ul>
        <hr />
        <br /><br />
    </nav>

    {{-- Highlighting Style --}}
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
