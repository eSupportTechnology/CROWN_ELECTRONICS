<?php $__env->startSection('content'); ?>




    <!-- ========================= Breadcrumb Start =============================== -->
    <div class="mb-0 breadcrumb py-26 bg-main-two-50" style="margin-top: 100px">
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
                        <form action="<?php echo e(route('store.inquiries')); ?>" method="post" enctype="multipart/form-data">
                            <?php echo csrf_field(); ?>
                            <h6 class="mb-32">Make Custom Request</h6>

                            <div class="row gy-4">
                                <!-- Full Name -->
                                <div class="col-sm-6">
                                    <label for="full_name" class="mb-2 fw-semibold">Full Name <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="full_name"
                                        class="px-16 common-input <?php $__errorArgs = ['full_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="full_name"
                                        value="<?php echo e(old('full_name')); ?>" placeholder="Full name">
                                    <?php $__errorArgs = ['full_name'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="text-danger small"><?php echo e($message); ?></div>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>

                                <!-- Email -->
                                <div class="col-sm-6">
                                    <label for="email" class="mb-2 fw-semibold">Email Address <span
                                            class="text-danger">*</span></label>
                                    <input type="email" name="email"
                                        class="px-16 common-input <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="email"
                                        value="<?php echo e(old('email')); ?>" placeholder="Email address">
                                    <?php $__errorArgs = ['email'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="text-danger small"><?php echo e($message); ?></div>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>

                                <!-- Phone -->
                                <div class="col-sm-6">
                                    <label for="phone" class="mb-2 fw-semibold">Phone Number <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="phone"
                                        class="px-16 common-input <?php $__errorArgs = ['phone'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="phone"
                                        value="<?php echo e(old('phone')); ?>" placeholder="Phone Number">
                                    <?php $__errorArgs = ['phone'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="text-danger small"><?php echo e($message); ?></div>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>

                                <!-- Subject -->
                                <div class="col-sm-6">
                                    <label for="subject" class="mb-2 fw-semibold">Subject <span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="subject"
                                        class="px-16 common-input <?php $__errorArgs = ['subject'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="subject"
                                        value="<?php echo e(old('subject')); ?>" placeholder="Subject">
                                    <?php $__errorArgs = ['subject'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="text-danger small"><?php echo e($message); ?></div>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
                                </div>

                                <!-- Message -->
                                <div class="col-sm-12">
                                    <label for="message" class="mb-2 fw-semibold">Message <span
                                            class="text-danger">*</span></label>
                                    <textarea name="message" class="px-16 common-input <?php $__errorArgs = ['message'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?> is-invalid <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>" id="message"
                                        placeholder="Type your message"><?php echo e(old('message')); ?></textarea>
                                    <?php $__errorArgs = ['message'];
$__bag = $errors->getBag($__errorArgs[1] ?? 'default');
if ($__bag->has($__errorArgs[0])) :
if (isset($message)) { $__messageOriginal = $message; }
$message = $__bag->first($__errorArgs[0]); ?>
                                        <div class="text-danger small"><?php echo e($message); ?></div>
                                    <?php unset($message);
if (isset($__messageOriginal)) { $message = $__messageOriginal; }
endif;
unset($__errorArgs, $__bag); ?>
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
                        <?php
                            $companySettings = \App\Models\CompanySettings::first();
                        ?>
                        <div class="gap-16 mb-16 flex-align">
                            <span
                                class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600"><i
                                    class="ph-fill ph-phone-call"></i></span>
                            <a href="tel:<?php echo e($companySettings->contact); ?>"
                                class="text-gray-900 text-md hover-text-main-600"><?php echo e($companySettings->contact); ?></a>
                        </div>
                        <div class="gap-16 mb-16 flex-align">
                            <span
                                class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600"><i
                                    class="ph-fill ph-envelope"></i></span>
                            <a href="mailto:<?php echo e($companySettings->email); ?>"
                                class="text-gray-900 text-md hover-text-main-600"><?php echo e($companySettings->email); ?></a>
                        </div>
                        <div class="gap-16 mb-0 flex-align">
                            <span
                                class="flex-shrink-0 w-40 h-40 text-2xl border border-gray-100 flex-center rounded-circle text-main-two-600"><i
                                    class="ph-fill ph-map-pin"></i></span>
                            <span class="text-gray-900 text-md "><?php echo e($companySettings->address); ?></span>
                        </div>
                    </div>
                    <div class="flex-wrap gap-16 mt-24 flex-align">
                        <a href="tel:+94112251202"
                            class="flex-wrap gap-8 p-10 px-16 bg-neutral-600 hover-bg-main-600 rounded-8 flex-between flex-grow-1">
                            <span class="text-white fw-medium">Get Support On Call</span>
                            <span class="text-xl text-white w-36 h-36 bg-main-600 rounded-8 flex-center"><i
                                    class="ph ph-headset"></i></span>
                        </a>
                        <a href="#" data-bs-toggle="modal" data-bs-target="#mapModal"
   class="flex-wrap gap-8 p-10 px-16 bg-neutral-600 hover-bg-main-600 rounded-8 flex-between flex-grow-1">
    <span class="text-white fw-medium">Get Direction</span>
    <span class="text-xl text-white w-36 h-36 bg-main-600 rounded-8 flex-center">
        <i class="ph ph-map-pin"></i>
    </span>
</a>
                    </div>
                </div>
            </div>
        </div>


        <!-- Google Map Modal -->
<div class="modal fade" id="mapModal" tabindex="-1" aria-labelledby="mapModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="mapModalLabel">Get Directions</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    <div id="map" class="mb-5" style="width: 100%; height: 500px;">
        <iframe
             src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d15844.735919332763!2d79.88583444475668!3d6.868544940080565!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sNo.%2038%2C%202nd%20Lane%2C%20Rubber%20Watte%20Road%2C%20Gangodawila%2C%20Nugegoda%2C%20Sri%20Lanka.!5e0!3m2!1sen!2slk!4v1751443775086!5m2!1sen!2slk"
            width="100%"
            height="100%"
            style="border:0;"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade">
        </iframe>
    </div>
</div>

    </div>
  </div>
</div>




    </section>
    <!-- ============================ Contact Section End ================================== -->
<?php $__env->stopSection(); ?>

<?php echo $__env->make('frontend.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\ASUS\Desktop\crown elc\CROWN_ELECTRONICS\resources\views/frontend/contact.blade.php ENDPATH**/ ?>