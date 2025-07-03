<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\MobileAuthController;
use App\Http\Controllers\API\MobileCartController;
use App\Http\Controllers\API\MobileWishlistController;
use App\Http\Controllers\API\MobileProductController;
use App\Http\Controllers\API\MobileCategoryController;
use App\Http\Controllers\API\MobileUserController;

// Public Routes
Route::post('/mobile/register', [MobileAuthController::class, 'register']);
Route::post('/mobile/login', [MobileAuthController::class, 'login']);

// Protected Routes
Route::middleware('auth:api')->group(function () {
    Route::post('/mobile/logout', [MobileAuthController::class, 'logout']);
    Route::get('/mobile/user', [MobileAuthController::class, 'userProfile']);

    // Cart Routes
    Route::get('/cart/count', [MobileCartController::class, 'getCartCount']);
    Route::get('/cart/items', [MobileCartController::class, 'getCartItems']);
    Route::post('/cart/add', [MobileCartController::class, 'addToCart']);
    Route::put('/cart/update/{id}', [MobileCartController::class, 'updateCartItem']);
    Route::delete('/cart/remove/{id}', [MobileCartController::class, 'removeCartItem']);
    Route::get('/cart/checkout', [MobileCartController::class, 'checkout']);

    // Wishlist Routes
    Route::post('/mobile/wishlist/add', [MobileWishlistController::class, 'addToWishlist']);
    Route::delete('/mobile/wishlist/remove/{productId}', [MobileWishlistController::class, 'removeFromWishlist']);
    Route::post('/mobile/wishlist/check-multiple', [MobileWishlistController::class, 'checkMultipleWishlist']);
    Route::get('/mobile/wishlist', [MobileWishlistController::class, 'getWishlist']);
    Route::get('/mobile/wishlist/count', [MobileWishlistController::class, 'getWishlistCount']);

    // User Management Routes (New)
    Route::get('/mobile/user/profile', [MobileUserController::class, 'getCurrentUser']);
    Route::post('/mobile/user/store', [MobileUserController::class, 'store']);
    Route::put('/mobile/user/update', [MobileUserController::class, 'updateUser']);

    // Admin User Management
    Route::get('/mobile/users', [MobileUserController::class, 'index']); // Get all users
    Route::get('/mobile/users/{id}', [MobileUserController::class, 'show']); // Get user by ID
    Route::delete('/mobile/users/{id}', [MobileUserController::class, 'destroy']); // Delete user
    
});

// Public Product & Category Routes
Route::get('/mobile/products', [MobileProductController::class, 'getProducts']);
Route::get('/mobile/product-details/{productId}', [MobileProductController::class, 'showProductDetails']);
Route::get('/mobile/search-products', [MobileProductController::class, 'searchProducts']);
Route::get('/mobile/product-images/{productId}', [MobileProductController::class, 'getProductImages']);
Route::get('/mobile/categories', [MobileCategoryController::class, 'index']);
Route::get('/mobile/categories/{id}', [MobileCategoryController::class, 'show']);
