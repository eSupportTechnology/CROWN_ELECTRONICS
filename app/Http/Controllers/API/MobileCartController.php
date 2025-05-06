<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\CartItem;
use App\Models\Product;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Http\JsonResponse;

class MobileCartController extends Controller
{
    // Get cart count
    public function getCartCount(): JsonResponse
    {
        $user = JWTAuth::parseToken()->authenticate();
        $cartCount = CartItem::where('user_id', $user->id)->count();
        return response()->json(['cart_count' => $cartCount]);
    }

    // Get cart items
    public function getCartItems(): JsonResponse
    {
        $user = JWTAuth::parseToken()->authenticate();
        $cartItems = CartItem::where('user_id', $user->id)->get();

        foreach ($cartItems as $item) {
            $product = Product::find($item->product_id);
            $item->product_name = $product->product_name;
            $item->product_image = optional($product->images()->first())->image_path;
            $item->subtotal = $item->price * $item->quantity;
        }

        return response()->json(['cart_items' => $cartItems]);
    }

    // Add item to cart
    public function addToCart(Request $request): JsonResponse
    {
        $user = JWTAuth::parseToken()->authenticate();

        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1',
            'size' => 'nullable|string',
            'color' => 'nullable|string',
        ]);

        $product = Product::findOrFail($request->product_id);
        $subtotal = $request->quantity * $product->normal_price;

        $cartItem = CartItem::updateOrCreate([
            'user_id' => $user->id,
            'product_id' => $request->product_id,
            'size' => $request->size,
            'color' => $request->color,
        ], [
            'quantity' => $request->quantity,
            'price' => $product->normal_price,
            'subtotal' => $subtotal,
        ]);

        return response()->json(['message' => 'Product added to cart', 'cart_item' => $cartItem]);
    }

    // Update cart item
    public function updateCartItem(Request $request, $id): JsonResponse
    {
        $user = JWTAuth::parseToken()->authenticate();
        
        $request->validate(['quantity' => 'required|integer|min:1']);

        $cartItem = CartItem::where('id', $id)->where('user_id', $user->id)->firstOrFail();
        $cartItem->update(['quantity' => $request->quantity, 'subtotal' => $cartItem->price * $request->quantity]);

        return response()->json(['message' => 'Cart updated successfully', 'cart_item' => $cartItem]);
    }

    // Remove cart item
    public function removeCartItem($id): JsonResponse
    {
        $user = JWTAuth::parseToken()->authenticate();

        $cartItem = CartItem::where('id', $id)->where('user_id', $user->id)->firstOrFail();
        $cartItem->delete();

        return response()->json(['message' => 'Item removed from cart']);
    }

    // Checkout
    public function checkout(): JsonResponse
    {
        $user = JWTAuth::parseToken()->authenticate();
        $cartItems = CartItem::where('user_id', $user->id)->get();
        $subtotal = $cartItems->sum('subtotal');
        $total = $subtotal + 300; // Assuming a fixed shipping fee

        return response()->json(['cart_items' => $cartItems, 'subtotal' => $subtotal, 'total' => $total]);
    }
}