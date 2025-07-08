<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\Banner;
use App\Models\Slider;
use App\Models\CustomerOrderItems;
use Illuminate\Http\Request;
use App\Http\Controllers\SliderController;
use App\Http\Controllers\BannerController;
use Illuminate\Support\Facades\Log;

class HomeTemplateController extends Controller
{

    public function index()
    {
        // Fetch categories with subcategories and sub-subcategories
        $categories = Category::with(['subcategories.subSubcategories'])->withCount('products')->get();

        // Fetch products with images and reviews
        $products = Product::with(['images','currency', 'reviews' => function ($query) {
            $query->where('status', 'Published');
        }, 'shop'])->get();

        // Loop through each product to calculate sold quantities, total quantities, and ratings
        foreach ($products as $product) {
            $orderedQuantity = CustomerOrderItems::where('product_id', $product->id)->sum('quantity');
            $product->sold_quantity = $orderedQuantity;
            $product->total_quantity = $orderedQuantity + $product->quantity;

            $product->average_rating = $product->reviews->where('status', 'Published')->avg('rating') ?? 0;
            $product->total_reviews = $product->reviews->where('status', 'Published')->count();
        }

        // Filter products based on tags
        $topSellingProducts = $products->filter(function ($product) {
            return strpos($product->tags, 'Top Selling') !== false;
        });

        $Onlineexclusive = $products->filter(function ($product) {
            return strpos($product->tags, 'Online Exclusive') !== false;
        });

        $belowrs = $products->filter(function ($product) {
            return strpos($product->tags, 'Below') !== false;
        });

        // Fetch the banner and slider images
        $banners = Banner::all(); // Assuming you have a Banner model

        $sliders = Slider::all(); // Assuming you have a Slider model
         if (isset($banners[3])) {
        Log::info('Fetched Banner[3]: ', $banners[3]->toArray());
    } else {
        Log::info('Banner index 3 does not exist.');
    }

        // Return the view with all the necessary data
        return view('frontend.Home', compact('categories', 'products', 'topSellingProducts', 'Onlineexclusive', 'belowrs', 'banners', 'sliders'));
    }

    public function OnlineExclusive(){
        $products = Product::where('tags', 'like', '%Online Exclusive%')
        ->paginate(12); // Paginate instead of all()

    return view('frontend.shop', compact('products'));

    }

    public function TopSelling(){
         $products = Product::where('tags', 'like', '%Top Selling%')
        ->paginate(12); // Paginate instead of all()

    return view('frontend.shop', compact('products'));

    }

    public function BelowProduct(){

        $products = Product::where('tags', 'like', '%Below%')
        ->paginate(12); // Paginate instead of all()

    return view('frontend.shop', compact('products'));

    }

}
