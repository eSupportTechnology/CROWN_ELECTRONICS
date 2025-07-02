@extends ('frontend.master')

@section('content')
    <!-- ========================= Breadcrumb Start =============================== -->
    <div class="mb-0 breadcrumb py-26 bg-main-two-50" style="margin-top: 120px">
        <div class="container container-lg">
            <div class="flex-wrap gap-16 breadcrumb-wrapper flex-between">
                <h6 class="mb-0">Contact</h6>
                <ul class="flex-wrap gap-8 flex-align">
                    <li class="text-sm">
                        <a href="index.html" class="gap-8 text-gray-900 flex-align hover-text-main-600">
                            <i class="ph ph-house"></i>
                            Home
                        </a>
                    </li>
                    <li class="flex-align">
                        <i class="ph ph-caret-right"></i>
                    </li>
                    <li class="text-sm text-main-600"> Contact </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- ========================= Breadcrumb End =============================== -->

    <!-- ============================ Contact Section Start ================================== -->
    <section class="contact py-80">
        <div class="container container-lg">
            <div class="row gy-5">
                <div class="col-lg-8">
                    <div class="px-24 py-40 border border-gray-100 contact-box rounded-16">
                        <form action="{{ route('store.inquiries') }}" method="post" enctype="multipart/form-data">
                            @csrf
                            <h6 class="mb-32">Make Custom Request</h6>

                            <div class="row gy-4">
                                <!-- Full Name -->
                                <div class="col-sm-6">
                                    <label for="full_name" class="mb-2 fw-semibold">Full Name <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="full_name"
                                        class="px-16 common-input @error('full_name') is-invalid @enderror" id="full_name"
                                        value="{{ old('full_name') }}" placeholder="Full name">
                                    @error('full_name')
                                        <div class="text-danger small">{{ $message }}</div>
                                    @enderror
                                </div>

                                <!-- Email -->
                                <div class="col-sm-6">
                                    <label for="email" class="mb-2 fw-semibold">Email Address <span
                                            class="text-danger">*</span></label>
                                    <input type="email" name="email"
                                        class="px-16 common-input @error('email') is-invalid @enderror" id="email"
                                        value="{{ old('email') }}" placeholder="Email address">
                                    @error('email')
                                        <div class="text-danger small">{{ $message }}</div>
                                    @enderror
                                </div>

                                <!-- Phone -->
                                <div class="col-sm-6">
                                    <label for="phone" class="mb-2 fw-semibold">Phone Number <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="phone"
                                        class="px-16 common-input @error('phone') is-invalid @enderror" id="phone"
                                        value="{{ old('phone') }}" placeholder="Phone Number">
                                    @error('phone')
                                        <div class="text-danger small">{{ $message }}</div>
                                    @enderror
                                </div>

                                <!-- Subject -->
                                <div class="col-sm-6">
                                    <label for="subject" class="mb-2 fw-semibold">Subject <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="subject"
                                        class="px-16 common-input @error('subject') is-invalid @enderror" id="subject"
                                        value="{{ old('subject') }}" placeholder="Subject">
                                    @error('subject')
                                        <div class="text-danger small">{{ $message }}</div>
                                    @enderror
                                </div>

                                <!-- Message -->
                                <div class="col-sm-12">
                                    <label for="message" class="mb-2 fw-semibold">Message <span
                                            class="text-danger">*</span></label>
                                    <textarea name="message" class="px-16 common-input @error('message') is-invalid @enderror" id="message"
                                        placeholder="Type your message">{{ old('message') }}</textarea>
                                    @error('message')
                                        <div class="text-danger small">{{ $message }}</div>
                                    @enderror
                                </div>

                                <!-- Submit -->
                                <div class="mt-4 col-sm-12">
                                    <button type="submit" class="px-32 btn btn-main py-18 rounded-8">Send</button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="px-24 py-40 border border-gray-100 contact-box rounded-16">
                        <h6 class="mb-48">Get In Touch</h6>
                        @php
                            $companySettings = \App\Models\CompanySettings::first();
                        @endphp
                        <div class="gap-16 mb-16 flex-align">
                            <span
                                class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600"><i
                                    class="ph-fill ph-phone-call"></i></span>
                            <a href="tel:{{ $companySettings->contact }}"
                                class="text-gray-900 text-md hover-text-main-600">{{ $companySettings->contact }}</a>
                        </div>
                        <div class="gap-16 mb-16 flex-align">
                            <span
                                class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600"><i
                                    class="ph-fill ph-envelope"></i></span>
                            <a href="mailto:{{ $companySettings->email }}"
                                class="text-gray-900 text-md hover-text-main-600">{{ $companySettings->email }}</a>
                        </div>
                        <div class="gap-16 mb-0 flex-align">
                            <span
                                class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600"><i
                                    class="ph-fill ph-map-pin"></i></span>
                            <span class="text-gray-900 text-md ">{{ $companySettings->address }}</span>
                        </div>
                    </div>
                    <div class="flex-wrap gap-16 mt-24 flex-align">
                        <a href="tel:+94112251202"
                            class="flex-wrap gap-8 p-10 px-16 bg-neutral-600 hover-bg-main-600 rounded-8 flex-between flex-grow-1">
                            <span class="text-white fw-medium">Get Support On Call</span>
                            <span class="text-xl text-white w-36 h-36 bg-main-600 rounded-8 flex-center"><i
                                    class="ph ph-headset"></i></span>
                        </a>
                        <a href="#"
                            class="flex-wrap gap-8 p-10 px-16 bg-neutral-600 hover-bg-main-600 rounded-8 flex-between flex-grow-1">
                            <span class="text-white fw-medium">Get Direction</span>
                            <span class="text-xl text-white w-36 h-36 bg-main-600 rounded-8 flex-center"><i
                                    class="ph ph-map-pin"></i></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>


    </section>
    <!-- ============================ Contact Section End ================================== -->
@endsection
