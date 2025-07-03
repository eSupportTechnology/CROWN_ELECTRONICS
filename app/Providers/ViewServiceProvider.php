<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use App\Models\Vendor;

class ViewServiceProvider extends ServiceProvider
{
    public function boot()
    {
        View::composer('*', function ($view) {
            if (session('vendor_id')) {
                $vendor = Vendor::find(session('vendor_id'));
                $view->with('vendor', $vendor);
            }
        });
    }

    public function register()
    {
        //
    }
}
