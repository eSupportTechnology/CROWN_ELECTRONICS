@extends ('frontend.master')

@section('content')

<style>
  :root {
    --primary-color: #ee520a;
    --text-color: #333;
    --border-color: #e5e7eb;
    --background-color: #fff;
    --secondary-bg: #f8f9fa;
  }

  .card {
    border: none;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

  .card:hover {
    transform: translateY(-4px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
  }

  .checkout-card,
  .summary-card {
    background: var(--background-color);
  }

  .error-message {
    color: #dc3545;
    font-size: 0.85rem;
    margin-top: 4px;
  }

  .square-input {
    border: 1px solid var(--border-color);
    border-radius: 4px;
    padding: 12px;
    font-size: 0.95rem;
    transition: border-color 0.3s ease;
  }

  .square-input:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(238, 82, 10, 0.1);
  }

  .nav-tabs {
    border-bottom: 2px solid var(--border-color);
    justify-content: center;
    gap: 16px;
  }

  .nav-link {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 10px;
    height: 100%;
  }

  .nav-link img {
    width: 40px;
    height: auto;
    margin-bottom: 8px;
  }

  .nav-item {
    display: flex;
    align-items: center;
    /* Ensure nav items are aligned */
  }

  .nav-link.active {
    color: var(--primary-color);
    border-bottom: 3px solid var(--primary-color);
    background: var(--secondary-bg);
  }

  .nav-link:hover {
    color: var(--primary-color);
  }

  .btn-primary {
    background-color: var(--primary-color);
    border: none;
    padding: 12px 24px;
    border-radius: 4px;
    font-weight: 500;
    transition: background-color 0.3s ease;
  }

  .btn-primary:hover {
    background-color: #d44709;
  }

  .breadcrumb {
    background: var(--secondary-bg);
    padding: 20px 0;
  }

  @media (max-width: 768px) {
    .checkout-summary-container {
      flex-direction: column;
    }

    .checkout-card,
    .summary-card {
      width: 100%;
    }

    .tab-content {
      width: 100% !important;
    }

    .nav-tabs {
      flex-direction: column;
      gap: 8px;
    }

    .nav-link {
      width: 100%;
      text-align: center;
    }
  }
</style>

<!-- ========================= Breadcrumb Start =============================== -->
<div class="breadcrumb py-4 bg-secondary-50">
  <div class="container container-lg">
    <div class="breadcrumb-wrapper d-flex justify-content-between align-items-center flex-wrap gap-3">
      <h6 class="mb-0 fw-bold">Payment</h6>
      <ul class="d-flex align-items-center gap-2 flex-wrap">
        <li class="text-sm">
          <a href="index.html" class="text-gray-900 d-flex align-items-center gap-2 hover-text-primary">
            <i class="ph ph-house"></i>
            Home
          </a>
        </li>
        <li class="d-flex align-items-center">
          <i class="ph ph-caret-right"></i>
        </li>
        <li class="text-sm text-primary fw-medium">Payment</li>
      </ul>
    </div>
  </div>
</div>
<!-- ========================= Breadcrumb End =============================== -->

<section class="py-5">
  <div class="container container-lg">
    <div class="row checkout-summary-container">
      <!-- Payment -->
      <div class="col-lg-8 col-md-12 mb-4" style=" border-radius: 8px; padding: 20px; display: flex; justify-content: center; align-items: center;">
        <div class="card checkout-card p-4">
          <h5 class="card-title mb-4 fw-bold">Select Payment Method</h5>

          <!-- Payment Tabs -->
          <ul class="nav nav-tabs mb-4" id="paymentTabs" role="tablist">
            <li class="nav-item" role="presentation">
              <a class="nav-link active" id="credit-card-tab" data-bs-toggle="tab" href="#credit-card" role="tab" aria-controls="credit-card" aria-selected="true">
                <div class="mb-2">
                  <img src="{{ asset('frontend/assets/images/imgs/card.png') }}" alt="Credit Card" style="width: 40px; height: auto; display: block; margin: 0 auto;">
                </div>
                <span>Credit/Debit Card</span>
              </a>
            </li>
            <li class="nav-item" role="presentation">
              <a class="nav-link" id="cash-on-delivery-tab" data-bs-toggle="tab" href="#cash-on-delivery" role="tab" aria-controls="cash-on-delivery" aria-selected="false">
                <div class="mb-2">
                  <img src="{{ asset('frontend/assets/images/imgs/cod.png') }}" alt="Cash on Delivery" style="width: 60px; height: auto; display: block; margin: 0 auto;">
                </div>
                <span>Cash on Delivery</span>
              </a>
            </li>
          </ul>

          <!-- Tab Content -->
          <div class="tab-content" id="paymentTabsContent">
            <!-- Credit/Debit Card Payment -->
            <div class="tab-pane fade show active" id="credit-card" role="tabpanel" aria-labelledby="credit-card-tab">
              <form action="{{ route('confirm.card.order', $order->order_code) }}" method="POST">
                @csrf
                <div class="mb-4">
                  <label for="cardName" class="form-label fw-medium"><span class="text-danger me-1">*</span>Name on Card</label>
                  <input type="text" class="form-control square-input" id="cardName" placeholder="Name on Card" required>
                  @error('cardName')
                  <div class="error-message">{{ $message }}</div>
                  @endError
                </div>
                <div class="mb-4">
                  <label for="cardNumber" class="form-label fw-medium"><span class="text-danger me-1">*</span>Card Number</label>
                  <input type="text" class="form-control square-input" id="cardNumber" placeholder="1234 5678 9012 3456" required>
                  @error('cardNumber')
                  <div class="error-message">{{ $message }}</div>
                  @endError
                </div>
                <div class="row">
                  <div class="col-md-6 mb-4">
                    <label for="expiryDate" class="form-label fw-medium"><span class="text-danger me-1">*</span>Expiry Date</label>
                    <input type="text" class="form-control square-input" id="expiryDate" placeholder="MM/YY" required>
                    @error('expiryDate')
                    <div class="error-message">{{ $message }}</div>
                    @endError
                  </div>
                  <div class="col-md-6 mb-4">
                    <label for="cvv" class="form-label fw-medium"><span class="text-danger me-1">*</span>CVV</label>
                    <input type="text" class="form-control square-input" id="cvv" placeholder="123" required>
                    @error('cvv')
                    <div class="error-message">{{ $message }}</div>
                    @endError
                  </div>
                </div>
                <button type="submit" class="btn btn-primary w-100">Pay Now</button>
              </form>
            </div>

            <!-- Cash on Delivery -->
            <div class="tab-pane fade" id="cash-on-delivery" role="tabpanel" aria-labelledby="cash-on-delivery-tab">
              <div class="mb-4">
                <p class="text-muted">
                  - Pay in cash to our courier upon receiving your parcel at the doorstep.<br>
                  - Please check if your delivery status is 'Out for Delivery' before accepting the parcel.
                </p>
              </div>
              <form action="{{ route('confirm.cod.order', $order->order_code) }}" method="POST">
                @csrf
                <button type="submit" class="btn btn-primary w-100">Confirm Order</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- Summary -->
      <div class="col-lg-4 col-md-12" style=" border-radius: 8px;padding: 20px; align-items: center;">
        <div class="card summary-card p-4">
          <h5 class="mb-4 fw-bold">Order Summary</h5>
          <div class="d-flex justify-content-between mb-3">
            <p class="mb-0 text-muted">Subtotal:</p>
            <p class="mb-0">Rs. {{ number_format($order->total_cost - 300, 2) }}</p>
          </div>
          <div class="d-flex justify-content-between mb-3">
            <p class="mb-0 text-muted">Delivery Fee:</p>
            <p class="mb-0">Rs. 300.00</p>
          </div>
          <hr class="my-3">
          <div class="d-flex justify-content-between">
            <h6 class="mb-0 fw-bold">Total Amount:</h6>
            <h6 class="mb-0 fw-bold">Rs. {{ number_format($order->total_cost, 2) }}</h6>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

@endsection