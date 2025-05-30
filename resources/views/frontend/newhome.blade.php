@include('layouts.newheader')

<!-- ==============================================================================================================
                                home page
============================================================================================================== -->

<style>
   /* Custom styles */
   .carousel-item {
       background-size: cover;
       background-position: center;
       height: 650px; /* Adjust height as needed */
       width: 100%;
       position: relative;
   }

   /* Each carousel item with a different image */
   .carousel-item:nth-child(1) {
       background-image: url('frontend/newstyle/assets/images/public.jpg'); /* Replace with your image path */
   }

   .carousel-item:nth-child(2) {
       background-image: url('frontend/newstyle/assets/images/public.jpg'); /* Replace with your image path */
   }

   .carousel-item:nth-child(3) {
       background-image: url('frontend/newstyle/assets/images/public.jpg'); /* Replace with your image path */
   }

   .carousel-item-next, .carousel-item-prev, .carousel-item.active {
       transition: transform 0.5s ease;
   }

   /* Optional: Ensure the carousel controls are visible */
   .carousel-control-prev-icon, .carousel-control-next-icon {
       background-color: black; /* For better visibility */
   }

   /* Hide the carousel control buttons */
   .carousel-control-prev, .carousel-control-next {
       display: none;
   }

   /* Style the dots (indicators) */
   .carousel-indicators li {
       background-color: transparent;
       width: 20px;
       height: 20px;
       border-radius: 0;
       border: 2px solid white;
       margin: 0 5px; /* Adds some space between dots */
   }

   .carousel-indicators .active {
       background-color: white;
       transform: scale(1.2);
   }


   .owl-carousel .owl-nav button.owl-next, .owl-carousel .owl-nav button.owl-prev, .owl-carousel button.owl-dot {
    background: 0 0;
    color: inherit;
    border: none;
    padding: 0 !important;
    font: inherit;
    font-size: 37px!important;
}
</style>

<body>
    <!-- Carousel Section -->
    <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <!-- First banner image -->
            </div>
            <div class="carousel-item">
                <!-- Second banner image -->
            </div>
            <div class="carousel-item">
                <!-- Third banner image -->
            </div>
        </div>
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2"></button>
        </div>
    </div>

    <div class="site-common-con">
        <div class="home-product d-flex">
            <div class="home-product-title exclusive">
                <p class="home-page-product-title">Online Exclusive</p>
            </div>
            <div class="view-all-txt">
                <a class="view-all-link" href="#">VIEW ALL</a>
            </div>
        </div>

        <div id="category_products_list_28" class="products-grid row">
            <div class="home-product-list owl-carousel owl-theme owl-loaded owl-drag">
                <div class="owl-stage-outer">
                    <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all; width: 2600px;">
                        @foreach ($products->slice(0, 10) as $product)
                            <div class="owl-item active" style="width: 216.638px;">
                                <div class="item items-28">
                                    <div class="grid-product-wapper">
                                        <!-- Discount Tag -->
                                        @if($product->discount > 0)
                                            <div class="normal-pro-promo-tags">
                                                <div class="discout-tag">
                                                    <span class="discount-amount">{{ $product->discount }}%</span>
                                                    <span class="off-txt">OFF</span>
                                                </div>
                                            </div>
                                        @endif
                                        
                                        <!-- Product Image -->
                                        <div class="product-image">
                                            <a href="{{ route('showProductDetails', $product->product_id) }}">
                                                <img src="{{ asset('storage/' . $product->images->first()->image_path) }}" alt="{{ $product->product_name }}" class="grid-product-img" loading="eager" width="178" height="178">
                                            </a>
                                            <div class="products-btn-set">
                                                <a href="{{ route('showProductDetails', $product->product_id) }}" class="home-buynow">BUY NOW</a>
                                            </div>
                                        </div>
                                        
                                        <!-- Product Title & Prices -->
                                        <div class="grid-pro-drtail-con">
                                            <div class="col-md-12 grid-product-title">
                                                <div class="pro-name-compact" title="{{ $product->product_name }}">
                                                    {{ $product->product_name }}
                                                </div>
                                            </div>
                                            <div class="u">
                                                <span class="market-price">Rs. {{ number_format($product->normal_price, 2) }}</span>
                                                <span class="selling-price">Rs. {{ number_format($product->normal_price, 2) }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

    </div>




<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Include Owl Carousel CSS -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/frontend/newstyle/assets/owl.carousel.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/assets/owl.theme.default.min.css"> -->

<!-- Include Owl Carousel JS -->
<!-- <script src="https://cdn.jsdelivr.net/npm/owl.carousel@2.3.4/dist/owl.carousel.min.js"></script> -->


<script>
    $(document).ready(function() {
    $(".owl-carousel").owlCarousel({
        loop: true,              // Enable looping
        margin: 10,              // Margin between items
        nav: true,               // Show next/prev arrows
        
        dots: false,             // Disable dots navigation
        autoplay: false,          // Enable auto-scrolling
        autoplayTimeout: 2000,   // Auto-scroll interval in ms
        responsive: {
            0: {
                items: 1         // Show 1 item for small screens
            },
            600: {
                items: 3         // Show 3 items for medium screens
            },
            1000: {
                items: 5         // Show 5 items for large screens
            }
        }
    });
});

</script>




















    <div class="site-common-con">
        <div class="home-product d-flex">
            <div class="home-product-title">
                <p class="home-page-product-title">Top Selling</p>
            </div>
            <div class="view-all-txt">
                <a class="view-all-link" href="top-selling.html">VIEW ALL</a>
            </div>
        </div>

        <div id="category_products_list_28" class="products-grid row">
            <div class="home-product-list owl-carousel owl-theme owl-loaded owl-drag">
                <div class="owl-stage-outer">
                    <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all; width: 2600px;">
                        @foreach ($products as $product)
                            <div class="owl-item active" style="width: 216.638px;">
                                <div class="item items-28">
                                    <div class="grid-product-wapper">
                                        <!-- Discount Tag -->
                                        @if($product->discount > 0)
                                            <div class="normal-pro-promo-tags">
                                                <div class="discout-tag">
                                                    <span class="discount-amount">{{ $product->discount }}%</span>
                                                    <span class="off-txt">OFF</span>
                                                </div>
                                            </div>
                                        @endif
                                        
                                        <!-- Product Image -->
                                        <div class="product-image">
                                            <a href="{{ route('showProductDetails', $product->product_id) }}">
                                                <img src="{{ asset('storage/' . $product->images->first()->image_path) }}" alt="{{ $product->product_name }}" class="grid-product-img" loading="eager" width="178" height="178">
                                            </a>
                                            <div class="products-btn-set">
                                                <a href="{{ route('showProductDetails', $product->product_id) }}" class="home-buynow">BUY NOW</a>
                                            </div>
                                        </div>
                                        
                                        <!-- Product Title & Prices -->
                                        <div class="grid-pro-drtail-con">
                                            <div class="col-md-12 grid-product-title">
                                                <div class="pro-name-compact" title="{{ $product->product_name }}">
                                                    {{ $product->product_name }}
                                                </div>
                                            </div>
                                            <div class="u">
                                                <span class="market-price">Rs. {{ number_format($product->normal_price, 2) }}</span>
                                                <span class="selling-price">Rs. {{ number_format($product->normal_price, 2) }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="site-common-con">
        <div class="home-product d-flex">
            <div class="home-product-title">
                <p class="home-page-product-title">Below Rs.10,000</p>
            </div>
            <div class="view-all-txt">
                <a class="view-all-link" href="top-selling.html">VIEW ALL</a>
            </div>
        </div>

        <div id="category_products_list_28" class="products-grid row">
            <div class="home-product-list owl-carousel owl-theme owl-loaded owl-drag">
                <div class="owl-stage-outer">
                    <div class="owl-stage" style="transform: translate3d(0px, 0px, 0px); transition: all; width: 2600px;">
                        @foreach ($products as $product)
                            <div class="owl-item active" style="width: 216.638px;">
                                <div class="item items-28">
                                    <div class="grid-product-wapper">
                                        <!-- Discount Tag -->
                                        @if($product->discount > 0)
                                            <div class="normal-pro-promo-tags">
                                                <div class="discout-tag">
                                                    <span class="discount-amount">{{ $product->discount }}%</span>
                                                    <span class="off-txt">OFF</span>
                                                </div>
                                            </div>
                                        @endif
                                        
                                        <!-- Product Image -->
                                        <div class="product-image">
                                            <a href="{{ route('showProductDetails', $product->product_id) }}">
                                                <img src="{{ asset('storage/' . $product->images->first()->image_path) }}" alt="{{ $product->product_name }}" class="grid-product-img" loading="eager" width="178" height="178">
                                            </a>
                                            <div class="products-btn-set">
                                                <a href="{{ route('showProductDetails', $product->product_id) }}" class="home-buynow">BUY NOW</a>
                                            </div>
                                        </div>
                                        
                                        <!-- Product Title & Prices -->
                                        <div class="grid-pro-drtail-con">
                                            <div class="col-md-12 grid-product-title">
                                                <div class="pro-name-compact" title="{{ $product->product_name }}">
                                                    {{ $product->product_name }}
                                                </div>
                                            </div>
                                            <div class="u">
                                                <span class="market-price">Rs. {{ number_format($product->normal_price, 2) }}</span>
                                                <span class="selling-price">Rs. {{ number_format($product->normal_price, 2) }}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="site-common-con" style="margin-bottom: 50px;">
    <div class="row m-0">
        <!-- First Banner Image (Left Side) -->
        <div class="col-12 col-sm-6 custom-4-banner">
            <img src="https://buyabans.com/cdn-cgi/imagedelivery/OgVIyabXh1YHxwM0lBwqgA/home_banner_images/fFf1mBa7KiYTuodxN4vb4U2I3VhH6fhM2fI1HjYq.webp/public" class="img-fluid" alt="Banner 1">
        </div>
        
        <!-- Second Banner Image (Right Side) -->
        <div class="col-12 col-sm-6 custom-4-banner">
            <img src="https://buyabans.com/cdn-cgi/imagedelivery/OgVIyabXh1YHxwM0lBwqgA/home_banner_images/uMCmKMfFueAmgMbp5oOQH3cNlKvCU7OEZgDMeltq.webp/public" class="img-fluid" alt="Banner 2">
        </div>
    </div>
    
    <!-- Single Banner Image (Full Width) -->
    <a href="https://buyabans.com/kitchen-appliance/blenders-mixers">
        <div class="col-12 col-sm-12 single-banner-m">
            <img src="https://buyabans.com/cdn-cgi/imagedelivery/OgVIyabXh1YHxwM0lBwqgA/home_banner_images/xS47eoY0DBO7b1nahDL2aDyLpJShrPkV2tnsbhFY.webp/public" class="img-fluid" alt="Blenders and Mixers Banner">
        </div>
    </a>
</div>







@include('layouts.newfooter')
