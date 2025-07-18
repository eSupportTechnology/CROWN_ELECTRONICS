<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\CustomerOrderItems;
use App\Models\Review;

class ShopPageController extends Controller
{
    public function index(Request $request)
    {
        $minPrice = $request->input('min_price');
        $maxPrice = $request->input('max_price');
        $categoryId = $request->input('category_id');

        $query = Product::with(['images', 'variations', 'reviews' => function ($q) {
            $q->where('status', 'Published');
        }]);

        if ($categoryId) {
            $query->where('category_id', $categoryId);
        }

        if ($minPrice !== null && $maxPrice !== null) {
            $query->whereBetween('normal_price', [$minPrice, $maxPrice]);
        }

        $products = $query->paginate(20);

        $categories = Category::withCount('products')->get();

        foreach ($products as $product) {
            $orderedQuantity = CustomerOrderItems::where('product_id', $product->id)->sum('quantity');
            $product->sold_quantity = $orderedQuantity;
            $product->total_quantity = $orderedQuantity + $product->quantity;
            $product->average_rating = $product->reviews->avg('rating') ?? 0;
            $product->total_reviews = $product->reviews->count();
        }

        return view('frontend.shop', compact('products', 'categories', 'minPrice', 'maxPrice', 'categoryId'));
    }



    public function showProductDetails($product_id)
    {
        $product = Product::with(['images', 'variations', 'category'])->where('product_id', $product_id)->first();
        if (!$product) {
            abort(404);
        }

        $similarProducts = Product::where('category_id', $product->category_id)
            ->where('product_id', '!=', $product_id)
            ->with(['images', 'variations'])
            ->take(10)
            ->get();

        $reviews = Review::where('product_id', $product->id)
            ->where('status', 'Published')
            ->with('reviewer')
            ->get();


        $averageRating = $reviews->avg('rating');

        $ratingCounts = $reviews->groupBy('rating')->map(function ($group) {
            return $group->count();
        });

        $totalReviews = $reviews->count();

        $ratingCounts = collect([1, 2, 3, 4, 5])->mapWithKeys(function ($rating) use ($ratingCounts) {
            return [$rating => $ratingCounts->get($rating, 0)];
        });

        return view('frontend.product-details', compact(
            'product',
            'similarProducts',
            'reviews',
            'averageRating',
            'ratingCounts',
            'totalReviews'
        ));
    }
}
