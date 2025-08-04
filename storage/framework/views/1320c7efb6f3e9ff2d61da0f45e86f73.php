<?php $__env->startSection('content'); ?>

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

                    
                    <?php if(session('success')): ?>
                        <div class="alert alert-success mb-4">
                            <?php echo e(session('success')); ?>

                        </div>
                    <?php endif; ?>

                    

                    <form action="<?php echo e(route('store.inquiries')); ?>" method="post" enctype="multipart/form-data">
                        <?php echo csrf_field(); ?>
                        <h6 class="mb-32">Make Custom Request</h6>

                        <div class="row gy-4">
                            <div class="col-sm-6 col-xs-6">
                                <label for="full_name" class="gap-4 mb-4 text-sm text-gray-900 flex-align font-heading-two fw-semibold">
                                    Full Name <span class="text-xl text-danger line-height-1">*</span>
                                </label>
                                <input type="text" name="full_name" class="px-16 common-input <?php $__errorArgs = ['full_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="full_name" placeholder="Full name" value="<?php echo e(old('full_name')); ?>">
                                <?php $__errorArgs = ['full_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <div class="text-danger text-sm mt-1"><?php echo e($message); ?></div>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>

                            <div class="col-sm-6 col-xs-6">
                                <label for="email" class="gap-4 mb-4 text-sm text-gray-900 flex-align font-heading-two fw-semibold">
                                    Email Address <span class="text-xl text-danger line-height-1">*</span>
                                </label>
                                <input type="email" name="email" class="px-16 common-input <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="email" placeholder="Email address" value="<?php echo e(old('email')); ?>">
                                <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <div class="text-danger text-sm mt-1"><?php echo e($message); ?></div>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>

                            <div class="col-sm-6 col-xs-6">
                                <label for="phone" class="gap-4 mb-4 text-sm text-gray-900 flex-align font-heading-two fw-semibold">
                                    Phone Number<span class="text-xl text-danger line-height-1">*</span>
                                </label>
                                <input type="text" name="phone" class="px-16 common-input <?php $__errorArgs = ['phone'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="phone" placeholder="Phone Number*" value="<?php echo e(old('phone')); ?>">
                                <?php $__errorArgs = ['phone'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <div class="text-danger text-sm mt-1"><?php echo e($message); ?></div>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>

                            <div class="col-sm-6 col-xs-6">
                                <label for="subject" class="gap-4 mb-4 text-sm text-gray-900 flex-align font-heading-two fw-semibold">
                                    Subject <span class="text-xl text-danger line-height-1">*</span>
                                </label>
                                <input type="text" name="subject" class="px-16 common-input <?php $__errorArgs = ['subject'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="subject" placeholder="Subject" value="<?php echo e(old('subject')); ?>">
                                <?php $__errorArgs = ['subject'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <div class="text-danger text-sm mt-1"><?php echo e($message); ?></div>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>

                            <div class="col-sm-12">
                                <label for="message" class="gap-4 mb-4 text-sm text-gray-900 flex-align font-heading-two fw-semibold">
                                    Message <span class="text-xl text-danger line-height-1">*</span>
                                </label>
                                <textarea name="message" class="px-16 common-input <?php $__errorArgs = ['message'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="message" placeholder="Type your message"><?php echo e(old('message')); ?></textarea>
                                <?php $__errorArgs = ['message'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                    <div class="text-danger text-sm mt-1"><?php echo e($message); ?></div>
                                <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                            </div>

                            <div class="mt-32 col-sm-12">
                                <button type="submit" class="px-32 btn btn-main py-18 rounded-8">Send</button>
                            </div>
                        </div>
                    </form>

                </div>
            </div>

            <div class="col-lg-4">
                <div class="px-24 py-40 border border-gray-100 contact-box rounded-16">
                    <h6 class="mb-48">Get In Touch</h6>
                    <?php
                        $companySettings = \App\Models\CompanySettings::first();
                    ?>
                    <div class="gap-16 mb-16 flex-align">
                        <span class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600">
                            <i class="ph-fill ph-phone-call"></i>
                        </span>
                        <a href="tel:<?php echo e($companySettings->contact); ?>" class="text-gray-900 text-md hover-text-main-600"><?php echo e($companySettings->contact); ?></a>
                    </div>
                    <div class="gap-16 mb-16 flex-align">
                        <span class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600">
                            <i class="ph-fill ph-envelope"></i>
                        </span>
                        <a href="mailto:<?php echo e($companySettings->email); ?>" class="text-gray-900 text-md hover-text-main-600"><?php echo e($companySettings->email); ?></a>
                    </div>
                    <div class="gap-16 mb-0 flex-align">
                        <span class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600">
                            <i class="ph-fill ph-map-pin"></i>
                        </span>
                        <span class="text-gray-900 text-md "><?php echo e($companySettings->address); ?></span>
                    </div>
                </div>

                <div class="flex-wrap gap-16 mt-24 flex-align">
                    <a href="#" class="flex-wrap gap-8 p-10 px-16 bg-neutral-600 hover-bg-main-600 rounded-8 flex-between flex-grow-1">
                        <span class="text-white fw-medium">Get Support On Call</span>
                        <span class="text-xl text-white w-36 h-36 bg-main-600 rounded-8 flex-center"><i class="ph ph-headset"></i></span>
                    </a>
                    <a href="https://www.google.com/maps/search/Bandaranaike%20International%20Airport/@7.18015655,79.88425807,17z "
                    class="flex-wrap gap-8 p-10 px-16 bg-neutral-600 hover-bg-main-600 rounded-8 flex-between flex-grow-1">
                        <span class="text-white fw-medium">Get Direction</span>
                        <span class="text-xl text-white w-36 h-36 bg-main-600 rounded-8 flex-center"><i class="ph ph-map-pin"></i></span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- ============================ Contact Section End ================================== -->

<?php $__env->stopSection(); ?>

<?php echo $__env->make('frontend.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH E:\eSupport Project\CROWN_ELECTRONICS\resources\views/frontend/contact.blade.php ENDPATH**/ ?>