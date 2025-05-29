<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Auth;
use App\Models\CartItem;


use App\Models\Product;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        View::composer('includes.navbar-2', function ($view) {
            if (Auth::check()) {
                $cartCount = CartItem::where('user_id', Auth::id())->count();
            } else {
                $cart = session()->get('cart', []);
                $cartCount = count($cart);
            }
            $view->with('cartCount', $cartCount);
        });



        View::composer('*', function ($view) {
            $miniCart = [];
            $cartTotal = 0;
            $cartCount = 0;

            if (Auth::check()) {
                $userId = Auth::id();
                $cartItems = CartItem::where('user_id', $userId)->get();

                foreach ($cartItems as $item) {
                    $product = Product::find($item->product_id);
                    $productImage = $product->images()->first();
                    $imagePath = $productImage ? 'storage/' . $productImage->image_path : 'default.png';

                    if ($product->currency && $product->currency->code != 'LKR') {
                        $subtotal = number_format($item->price * $item->quantity * $product->currency->exchange_rate, 2);
                        $cartTotal += $item->price * $item->quantity * $product->currency->exchange_rate;
                    } else {
                        $subtotal = number_format($item->price * $item->quantity, 2);
                        $cartTotal += $item->price * $item->quantity;
                    }

                    $miniCart[] = [
                        'name' => $product->product_name,
                        'image' => asset($imagePath),
                        'quantity' => $item->quantity,
                        'subtotal' => $subtotal,
                    ];

                }

                $cartCount = $cartItems->count();
            }

            $view->with('miniCart', $miniCart)
                 ->with('cartTotal', number_format($cartTotal, 2))
                 ->with('cartCount', $cartCount);
        });





    }
}
