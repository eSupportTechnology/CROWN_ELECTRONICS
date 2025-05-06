<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;

class MobileProductController extends Controller
{
    // Fetch all products with pagination
    public function getProducts(Request $request)
    {
        $products = Product::with('category', 'images', 'variations')->paginate(10);

        // Modify response to include full image URLs
        $products->getCollection()->transform(function ($product) {
            $product->images->transform(function ($image) {
                $image->image_url = url('storage/' . $image->image_path); 
                return $image;
            });
            return $product;
        });

        return response()->json($products);
    }

    // Fetch product details by ID
    public function showProductDetails($productId)
    {
        // Use where to find the product by product_id
        $product = Product::with(['category', 'images', 'variations'])->where('product_id', $productId)->first();

        if (!$product) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found'
            ], 404);
        }

        // Convert image paths to full URLs
        $product->images->transform(function ($image) {
            $image->image_url = url('storage/' . $image->image_path);
            return $image;
        });

        // Transform variations to include necessary data
        $product->variations->transform(function ($variation) {
            return [
                'id' => $variation->id,
                'type' => $variation->type,
                'value' => $variation->value,
                'hex_value' => $variation->hex_value,
                'quantity' => $variation->quantity,
            ];
        });

        return response()->json([
            'status' => true,
            'product' => $product
        ]);
    }

    // Fetch images of a product by product ID
    public function getProductImages($productId)
    {
        // Check if the product exists
        $product = Product::where('product_id', $productId)->first();

        if (!$product) {
            return response()->json([
                'status' => false,
                'message' => 'Product not found'
            ], 404);
        }

        // Fetch images associated with the product
        $images = ProductImage::where('product_id', $product->product_id)->get();

        if ($images->isEmpty()) {
            return response()->json([
                'status' => false,
                'message' => 'No images found for this product'
            ], 404);
        }

        // Return the images with full URLs
        return response()->json([
            'status' => true,
            'product_id' => $productId,
            'images' => $images->map(function ($image) {
                return [
                    'id' => $image->id,
                    'image_url' => url('storage/' . $image->image_path),
                ];
            }),
        ]);
    }
}