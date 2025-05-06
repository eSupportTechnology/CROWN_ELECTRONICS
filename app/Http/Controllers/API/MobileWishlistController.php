<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Wishlist;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Http\JsonResponse;
use Illuminate\Database\Eloquent\ModelNotFoundException;

class MobileWishlistController extends Controller
{
    // Add a product to the wishlist
    public function addToWishlist(Request $request): JsonResponse
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();
            $request->validate(['product_id' => 'required|string']);

            $productId = $request->input('product_id');
            $wishlistItem = Wishlist::where('user_id', $user->id)->where('product_id', $productId)->first();

            if ($wishlistItem) {
                return response()->json(['message' => 'Product is already in the wishlist'], 409);
            }

            Wishlist::create(['user_id' => $user->id, 'product_id' => $productId]);

            return response()->json(['message' => 'Product added to wishlist'], 201);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    // Remove a product from the wishlist
    public function removeFromWishlist($productId): JsonResponse
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();

            $wishlistItem = Wishlist::where('user_id', $user->id)->where('product_id', $productId)->firstOrFail();
            $wishlistItem->delete();

            return response()->json(['message' => 'Item removed from wishlist'], 200);
        } catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Item not found in wishlist'], 404);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    // Check if multiple products are in the wishlist
    public function checkMultipleWishlist(Request $request): JsonResponse
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();
            $request->validate(['product_ids' => 'required|array']);

            $wishlistProducts = Wishlist::where('user_id', $user->id)
                ->whereIn('product_id', $request->input('product_ids'))
                ->pluck('product_id');

            return response()->json(['wishlist' => $wishlistProducts], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    // Get wishlist items
    public function getWishlist(): JsonResponse
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();

            $wishlistItems = Wishlist::where('user_id', $user->id)->with('product')->get();

            return response()->json(['wishlist' => $wishlistItems], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }

    // Get wishlist count
    public function getWishlistCount(): JsonResponse
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();

            $wishlistCount = Wishlist::where('user_id', $user->id)->count();

            return response()->json(['wishlist_count' => $wishlistCount], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'An error occurred: ' . $e->getMessage()], 500);
        }
    }
}