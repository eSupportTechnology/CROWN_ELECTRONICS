
@extends ('frontend.master')

@section('content')
<style>

.color-circle {
    display: inline-block;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    margin-left: 4px;
    vertical-align: middle;
    border: 1px solid #ccc;


}



.quantity__input {
  color: black;
}

.quantity__input::placeholder {
  color: black;
}
















</style>

    <!-- ========================= Breadcrumb Start =============================== -->
<div class="breadcrumb mb-0 py-26 bg-main-two-50">
    <div class="container container-lg">
        <div class="breadcrumb-wrapper flex-between flex-wrap gap-16">
            <h6 class="mb-0">Cart</h6>
            <ul class="flex-align gap-8 flex-wrap">
                <li class="text-sm">
                    <a href="index.html" class="text-gray-900 flex-align gap-8 hover-text-main-600">
                        <i class="ph ph-house"></i>
                        Home
                    </a>
                </li>
                <li class="flex-align">
                    <i class="ph ph-caret-right"></i>
                </li>
                <li class="text-sm text-main-600"> Product Cart </li>
            </ul>
        </div>
    </div>
</div>
<!-- ========================= Breadcrumb End =============================== -->

    <!-- ================================ Cart Section Start ================================ -->

    <section class="cart py-80">
    <div class="container container-lg">
        <div class="row gy-4">
                @if(isset($message))
                    <!-- Display the empty cart message -->
                    <div class="cart-empty-card text-center border border-gray-100 rounded-8 py-48 px-40 bg-light">
                        <i class="material-icons text-6xl mb-24">shopping_cart</i>
                        <h3 class="text-lg fw-semibold mb-16">{{ $message }}</h3>
                        @if(!auth()->check())
                            <p class="mb-24">Sign in to view your cart and start shopping.</p>
                            <a href="{{ route('login') }}" class="btn btn-main py-12 w-50 rounded-8">Sign In</a>
                        @else
                            <p class="mb-24">Start shopping to fill your cart.</p>
                            <a href="{{ route('shop.index') }}" class="btn btn-main py-12 w-50 rounded-8">Start Shopping</a>
                        @endif
                    </div>
                @else
                <div class="col-xl-9 col-lg-8">
                    <!-- Display the cart items table -->
                    <div class="cart-table border border-gray-100 rounded-8 px-40 py-40">
                        <div class="overflow-x-auto scroll-sm scroll-sm-horizontal">
                            <table class="table style-three">
                                <thead>
                                    <tr>
                                        <th class="h6 mb-0 text-lg fw-bold">Product Name</th>
                                        <th class="h6 mb-0 text-lg fw-bold">Price</th>
                                        <th class="h6 mb-0 text-lg fw-bold">Quantity</th>
                                        <th class="h6 mb-0 text-lg fw-bold">Subtotal</th>
                                        <th class="h6 mb-0 text-lg fw-bold">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($cartItems as $item)
                                    <tr>
                                        <td>
                                            <div class="table-product d-flex align-items-center gap-24">
                                                <a href="{{ route('showProductDetails', $item->product_id) }}" class="table-product__thumb border border-gray-100 rounded-8 flex-center p-0">
                                                    <img src="{{ asset('storage/' . $item->product_image) }}" ">
                                                </a>
                                                <div class="table-product__content text-start">
                                                    <h6 class="title text-lg fw-semibold mb-8">
                                                        <a href="{{ route('showProductDetails', $item->product_id) }}" class="link text-line-2" tabindex="0">{{ $item->product_name }}</a>
                                                    </h6>
                                                    @if($item->size || $item->color)
                                                            <div class="mt-2">
                                                                @if($item->size)
                                                                    <span>Size: {{ $item->size }}</span>
                                                                @endif
                                                                @if($item->color)
                                                                    <span>Color:</span>
                                                                    <span class="color-circle" style="background-color: {{ $item->color }};"></span>
                                                                @endif
                                                            </div>
                                                        @endif
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="text-lg h6 mb-0 fw-semibold">{{$item->product->currency->symbol ?? 'Rs' }}. {{ number_format($item->price, 2) }}</span>
                                            @if($item->product->currency && $item->product->currency->code != 'LKR')
                                            <div class="mt-2">
                                            <span>Rs: {{ number_format($item->price * $item->product->currency->exchange_rate , 2) }}</span>
                                            </div>
                                            @endif
                                        </td>
                                        <td>
                                            <form action="{{ route('cart.update', $item->id) }}" method="POST">
                                                @csrf
                                                @method('PUT')
                                                <div class="d-flex rounded-4 overflow-hidden">
                                                    <button type="button" class="quantity__minus border border-end border-gray-100 flex-shrink-0 h-48 w-48 text-neutral-600 flex-center hover-bg-main-600 hover-text-white" data-id="{{ $item->id }}">
                                                        <i class="ph ph-minus"></i>
                                                    </button>
                                                    <input type="number" name="quantity" class="quantity__input flex-grow-1 border border-gray-100 border-start-0 border-end-0 text-center w-32 " value="{{ $item->quantity }}" min="1" style="height: 47px;">
                                                    <button type="button" class="quantity__plus border border-end border-gray-100 flex-shrink-0 h-48 w-48 text-neutral-600 flex-center hover-bg-main-600 hover-text-white" data-id="{{ $item->id }}">
                                                        <i class="ph ph-plus"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </td>
                                        <td>
                                            <span class="text-lg h6 mb-0 fw-semibold">{{$item->product->currency->symbol ?? 'Rs' }}. {{ number_format($item->subtotal, 2) }}</span>
                                            @if($item->product->currency && $item->product->currency->code != 'LKR')
                                            <div class="mt-2">
                                            <span>Rs: {{ number_format($item->subtotal * $item->product->currency->exchange_rate , 2) }}</span>
                                            </div>
                                            @endif
                                        </td>
                                        <td>
                                            <form action="{{ route('cart.remove', $item->id) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button type="submit" class="remove-tr-btn flex-align gap-12 hover-text-danger-600">
                                                    <i class="material-icons text-2xl">delete</i>
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>

                <div class="col-xl-3 col-lg-4">
                    <div class="cart-sidebar border border-gray-100 rounded-8 px-24 py-40">

                    <h6 class="text-xl mb-32">Cart Totals </h6>
                    <div class="bg-color-three rounded-8 p-24">
                        <div class="mb-32 flex-between gap-8">
                            <span class="text-gray-900 font-heading-two">Subtotal</span>

                            @php
    $total = $cartItems->sum(function ($item) {
        $product = $item->product;
        $subtotal = $item->subtotal;

        if ($product && $product->currency && $product->currency->code !== 'LKR') {
            return $subtotal * $product->currency->exchange_rate;
        }

        return $subtotal;
    });
@endphp

<span class="text-gray-900 fw-semibold">Rs. {{ number_format($total, 2) }}</span>

                        </div>
                        <div class="mb-0 flex-between gap-8">
                            <span class="text-gray-900 font-heading-two">Delivery Fee</span>
                            <span class="text-gray-900 fw-semibold">Rs 300.00</span>
                        </div>
                    </div>
                    <div class="bg-color-three rounded-8 p-24 mt-24">
                        <div class="flex-between gap-8">
                            <span class="text-gray-900 text-xl fw-semibold">Total</span>
                            <span class="text-gray-900 text-xl fw-semibold">Rs. {{ number_format($total + 300, 2) }}</span>
                        </div>
                    </div>
                    <a href="{{ route('checkout') }}" class="btn btn-main mt-40 py-18 w-100 rounded-8">Proceed to checkout</a>
                </div>
                @endif
            </div>
        </div>
    </div>
</section>





<!-- ================================ Cart Section End ================================ -->


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function () {
    // Handle the increment (plus button) click
    $('.quantity__plus').on('click', function () {
        var input = $(this).siblings('.quantity__input');
        var value = parseInt(input.val());
        value++;
        input.val(value);

        var form = $(this).closest('form');
        form.find('[name="quantity"]').val(value);
        form.submit();
    });

    $('.quantity__minus').on('click', function () {
        var input = $(this).siblings('.quantity__input');
        var value = parseInt(input.val());
        if (value > 1) {
            value--;
            input.val(value);

            var form = $(this).closest('form');
            form.find('[name="quantity"]').val(value);
            form.submit();
        }
    });
});


</script>
@endsection

