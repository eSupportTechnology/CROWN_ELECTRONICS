<?php $__env->startSection('content'); ?>
    <form method="POST" action="<?php echo e(route('products.update', $product->id)); ?>" enctype="multipart/form-data">
        <?php echo csrf_field(); ?>
        <?php echo method_field('PUT'); ?>
        <div class="row">
            <div class="col-12">
                <div class="content-header">
                    <h2 class="content-title">Edit Product</h2>

                    <div>
                        <button type="submit" class="btn btn-md rounded font-sm hover-up">Update</button>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="card mb-4">
                    <div class="card-header">
                        <h4>Basic</h4>
                    </div>
                    <div class="card-body">
                        <!-- Bind the form inputs to the existing product data -->
                        <div class="mb-4">
                            <label for="product_name" class="form-label">Product title <i class="text-danger">*</i></label>
                            <input type="text" name="product_name"
                                value="<?php echo e(old('product_name', $product->product_name)); ?>" placeholder="Type here"
                                class="form-control" id="product_name" />
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Product description<i class="text-danger">*</i></label>
                            <textarea name="product_description" placeholder="Type here" class="form-control" rows="4"><?php echo e(old('product_description', $product->product_description)); ?></textarea>
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Total Quantity <i class="text-danger">*</i></label>
                            <input name="quantity" id="quantity" type="number"
                                value="<?php echo e(old('quantity', $product->quantity)); ?>" class="form-control" />
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Currency <i class="text-danger">*</i></label>
                            <select name="currency_id" class="form-select" id="currencySelect">
                                <?php $__currentLoopData = $currencies; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $currency): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($currency->id); ?>" data-symbol="<?php echo e($currency->symbol); ?>" <?php echo e($currency->id == $product->currency_id ? 'selected' : ''); ?>>
                                        <?php echo e($currency->name); ?> <?php echo e($currency->symbol); ?>

                                    </option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>

                        </div>

                        <label class="form-check mb-4">
                            <input name="is_affiliate" id="affiliate_checkbox" class="form-check-input" type="checkbox"
                                <?php echo e($product->is_affiliate ? 'checked' : ''); ?> />
                            <span class="form-check-label">Affiliate the Product</span>
                        </label>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="mb-4">
                                    <label class="form-label">Normal price <i class="text-danger">*</i></label>
                                    <input name="normal_price" id="normal_price"
                                        value="<?php echo e(old('normal_price', $product->normal_price)); ?>" placeholder="<?php echo e($currencies->first()->symbol ?? 'Rs'); ?>"
                                        type="number" class="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-4">
                                    <label class="form-label">Affiliate price</label>
                                    <input name="affiliate_price" id="affiliate_price"
                                        value="<?php echo e(old('affiliate_price', $product->affiliate_price)); ?>" placeholder="<?php echo e($currencies->first()->symbol ?? 'Rs'); ?>"
                                        type="number" class="form-control" readonly />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="mb-4">
                                    <label class="form-label">Commission percentage %</label>
                                    <input name="commission_percentage" id="commission"
                                        value="<?php echo e(old('commission_percentage', $product->commission_percentage)); ?>"
                                        type="number" placeholder="%" class="form-control" />
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="mb-4">
                                    <label class="form-label">Commission price</label>
                                    <input name="com_price" id="com_price"
                                        value="<?php echo e(old('commission_price', $product->commission_price)); ?>" placeholder="<?php echo e($currencies->first()->symbol ?? 'Rs'); ?>"
                                        type="number" class="form-control" readonly />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="card mb-4">
                    <div class="card-header">
                        <h4>Variations</h4>
                    </div>
                    <div class="card-body">
                        <div id="variationsContainer">
                            <?php $__currentLoopData = $product->variations; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $variation): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="row mb-3 variation-row">
                                    <div class="col-lg-4">
                                        <label class="form-label">Select Type</label>
                                        <select name="variations[<?php echo e($index); ?>][type]" class="form-select"
                                            onchange="toggleColorInput(this)">
                                            <option value="size" <?php echo e($variation->type == 'size' ? 'selected' : ''); ?>>Size
                                            </option>
                                            <option value="color" <?php echo e($variation->type == 'color' ? 'selected' : ''); ?>>
                                                Color</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="form-label">Value</label>
                                        <input type="text" name="variations[<?php echo e($index); ?>][value]"
                                            class="form-control"
                                            value="<?php echo e($variation->type == 'color' ? '' : $variation->value); ?>" />
                                        <input type="color" name="variations[<?php echo e($index); ?>][hex_value]"
                                            class="form-control color-input"
                                            style="display: <?php echo e($variation->type == 'color' ? 'block' : 'none'); ?>;"
                                            value="<?php echo e($variation->hex_value); ?>" />
                                    </div>
                                    <div class="col-lg-3">
                                        <label class="form-label">Quantity</label>
                                        <input type="number" name="variations[<?php echo e($index); ?>][quantity]"
                                            class="form-control" value="<?php echo e($variation->quantity); ?>" />
                                    </div>
                                    <div class="col-lg-1 text-center">
                                        <label class="form-label">Delete</label>
                                        <button type="button" class="btn btn-danger delete-variation"
                                            onclick="removeVariation(this)">✖</button>
                                    </div>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                        <button type="button" class="btn btn-success" onclick="addVariation()">Add Variation</button>
                    </div>
                </div>



            </div>
            <div class="col-lg-5">
                <div class="card mb-4">
                    <div class="card-header">
                        <h4>Media</h4>
                    </div>
                    <div class="card-body">
                        <div class="input-upload">
                            <img src="<?php echo e(asset('backend/assets/imgs/theme/upload.svg')); ?>" alt="" />
                            <input name="images[]" id="media_upload" class="form-control" type="file" multiple />
                        </div>
                        <div class="image-preview mt-4" id="image_preview_container"
                            style="display: flex; gap: 10px; flex-wrap: wrap;">
                            <!-- Image previews will appear here -->
                            <?php $__currentLoopData = $product->images; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $image): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="position-relative">
                                    <img src="<?php echo e(asset('storage/' . $image->image_path)); ?>" alt="Product Image"
                                        class="img-thumbnail" style="width: 100px; height: 100px; object-fit: cover;">
                                    <span
                                        class="position-absolute top-0 end-0 bg-danger text-white rounded-circle p-1 cursor-pointer delete-existing-image"
                                        data-image-id="<?php echo e($image->id); ?>" style="cursor: pointer;">&times;</span>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                </div>
                <div class="card mb-4">
                    <div class="card-header">
                        <h4>Organization</h4>
                    </div>
                    <div class="card-body">
                        <div class="row gx-2">
                            <div class="col-sm-6 mb-3">
                                <label class="form-label">Category <i class="text-danger">*</i></label>
                                <select name="category_id" class="form-select" id="categorySelect">
                                    <option value="">Select a category</option>
                                    <?php $__currentLoopData = $categories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $category): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($category->id); ?>"
                                            <?php echo e($category->id == $product->category_id ? 'selected' : ''); ?>>
                                            <?php echo e($category->name); ?>

                                        </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>

                            <div class="col-sm-6 mb-3">
                                <label class="form-label">Subcategory</label>
                                <select name="subcategory_id" class="form-select" id="subcategorySelect">
                                    <option value="">Select a subcategory</option>
                                    <?php $__currentLoopData = $product->category->subcategories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subcategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($subcategory->id); ?>"
                                            <?php echo e($subcategory->id == $product->subcategory_id ? 'selected' : ''); ?>>
                                            <?php echo e($subcategory->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                            <div class="col-sm-6 mb-3">
                                <label class="form-label">Sub-Subcategory</label>
                                <select name="sub_subcategory_id" class="form-select" id="subsubcategorySelect">
                                    <option value="">Select a sub-subcategory</option>
                                    <?php $__currentLoopData = $product->subcategory ? $product->subcategory->subSubcategories : []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subSubcategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($subSubcategory->id); ?>"
                                            <?php echo e($subSubcategory->id == $product->sub_subcategory_id ? 'selected' : ''); ?>>
                                            <?php echo e($subSubcategory->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>

                            <div class="col-sm-6 mb-3">
                                <label class="form-label">Brand </label>
                                <select name="brand_id" class="form-select" id="brandSelect">
                                    <option value="">Select a brand</option>
                                    <?php $__currentLoopData = $brands; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $brand): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($brand->id); ?>"
                                            <?php echo e($brand->id == $product->brand_id ? 'selected' : ''); ?>><?php echo e($brand->name); ?>

                                        </option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>

                            <div class="mb-4">
                                <label for="product_tags" class="form-label">Tags</label>
                                <input name="tags" type="text" class="form-control"
                                    value="<?php echo e(old('tags', $product->tags)); ?>" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const currencySelect = document.getElementById('currencySelect');
            const placeholderFields = [
                document.getElementById('normal_price'),
                document.getElementById('affiliate_price'),
                document.getElementById('com_price')
            ];

            function updatePlaceholders() {
                const selectedOption = currencySelect.options[currencySelect.selectedIndex];
                const symbol = selectedOption.getAttribute('data-symbol') || 'Rs';
                placeholderFields.forEach(field => {
                    field.placeholder = symbol;
                });
            }

            // Initial placeholder set
            updatePlaceholders();

            // On currency change
            currencySelect.addEventListener('change', updatePlaceholders);
        });
    </script>


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const affiliateCheckbox = document.getElementById('affiliate_checkbox');
            const normalPriceInput = document.getElementById('normal_price');
            const affiliatePriceInput = document.getElementById('affiliate_price');
            const commissionInput = document.getElementById('commission');
            const comPriceInput = document.getElementById('com_price');

            affiliatePriceInput.value = normalPriceInput.value || 0;
            affiliatePriceInput.readOnly = true;
            comPriceInput.readOnly = true;
            commissionInput.readOnly = true;

            if (affiliateCheckbox.checked) {
                commissionInput.readOnly = false;
                calculateCommissionPrice();
            }

            affiliateCheckbox.addEventListener('change', function() {
                if (affiliateCheckbox.checked) {
                    // When affiliate checkbox is checked
                    affiliatePriceInput.value = normalPriceInput.value || 0;
                    affiliatePriceInput.readOnly = true;

                    commissionInput.readOnly = false;
                    calculateCommissionPrice();
                } else {
                    // When affiliate checkbox is unchecked
                    affiliatePriceInput.value = '';
                    commissionInput.value = '';
                    comPriceInput.value = '';

                    commissionInput.readOnly = true;
                }
            });


            normalPriceInput.addEventListener('input', function() {
                if (affiliateCheckbox.checked) {
                    affiliatePriceInput.value = normalPriceInput.value || 0;
                }
                calculateCommissionPrice();
            });


            commissionInput.addEventListener('input', function() {
                if (affiliateCheckbox.checked) {
                    calculateCommissionPrice();
                }
            });

            // Function to calculate commission price
            function calculateCommissionPrice() {
                const normalPrice = parseFloat(normalPriceInput.value) || 0;
                const commissionRate = parseFloat(commissionInput.value) || 0;
                const commissionPrice = normalPrice * (commissionRate / 100);
                comPriceInput.value = commissionPrice.toFixed(2);
            }
        });



        //image upload
        document.addEventListener('DOMContentLoaded', function() {
            const mediaUploadInput = document.getElementById('media_upload');
            const imagePreviewContainer = document.getElementById('image_preview_container');
            let currentFiles = [];

            mediaUploadInput.addEventListener('change', function() {
                const files = Array.from(mediaUploadInput.files);
                files.forEach((file, index) => {
                    currentFiles.push(file);
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        const imageUrl = e.target.result;
                        const imageContainer = document.createElement('div');
                        imageContainer.classList.add('position-relative');
                        imageContainer.style.width = '100px';
                        imageContainer.style.height = '100px';

                        const imgElement = document.createElement('img');
                        imgElement.src = imageUrl;
                        imgElement.classList.add('img-thumbnail');
                        imgElement.style.width = '100%';
                        imgElement.style.height = '100%';
                        imgElement.style.objectFit = 'cover';

                        const deleteIcon = document.createElement('span');
                        deleteIcon.classList.add('position-absolute', 'top-0', 'end-0',
                            'bg-danger', 'text-white', 'rounded-circle', 'p-1',
                            'cursor-pointer');
                        deleteIcon.innerHTML = '&times;';
                        deleteIcon.style.cursor = 'pointer';

                        deleteIcon.addEventListener('click', function() {
                            imageContainer.remove();
                            removeImageFromFileList(currentFiles.indexOf(file));
                        });

                        imageContainer.appendChild(imgElement);
                        imageContainer.appendChild(deleteIcon);
                        imagePreviewContainer.appendChild(imageContainer);
                    };

                    reader.readAsDataURL(file);
                });

                updateFileInput();
            });

            // Adding event listener for existing images
            imagePreviewContainer.addEventListener('click', function(event) {
                if (event.target.classList.contains('delete-existing-image')) {
                    const imageId = event.target.getAttribute('data-image-id');
                    // Handle the deletion of the image here (e.g., send an AJAX request to delete the image from the server)
                    console.log('Delete existing image with ID:', imageId);

                    // Optionally, remove the image from the UI
                    event.target.parentElement.remove();
                }
            });

            function removeImageFromFileList(index) {
                currentFiles.splice(index, 1);
                updateFileInput();
            }

            function updateFileInput() {
                const dt = new DataTransfer();
                currentFiles.forEach(file => {
                    dt.items.add(file);
                });
                mediaUploadInput.files = dt.files;
            }
        });



        //categories dropdown
        document.addEventListener('DOMContentLoaded', function() {
            const categorySelect = document.getElementById('categorySelect');
            const subcategorySelect = document.getElementById('subcategorySelect');
            const subsubcategorySelect = document.getElementById('subsubcategorySelect');

            categorySelect.addEventListener('change', function() {
                const categoryId = this.value;

                subcategorySelect.innerHTML = '<option value="">Select a subcategory</option>';
                subsubcategorySelect.innerHTML = '<option value="">Select a sub-subcategory</option>';
                subcategorySelect.disabled = true;
                subsubcategorySelect.disabled = true;

                if (categoryId) {
                    fetch(`/api/subcategories/${categoryId}`)
                        .then(response => response.json())
                        .then(data => {
                            data.forEach(subcategory => {
                                const option = document.createElement('option');
                                option.value = subcategory.id;
                                option.textContent = subcategory.name;
                                subcategorySelect.appendChild(option);
                            });
                            subcategorySelect.disabled = false;
                        })
                        .catch(error => console.error('Error fetching subcategories:', error));
                }
            });

            subcategorySelect.addEventListener('change', function() {
                const subcategoryId = this.value;

                subsubcategorySelect.innerHTML = '<option value="">Select a sub-subcategory</option>';
                subsubcategorySelect.disabled = true;

                if (subcategoryId) {
                    fetch(`/api/sub-subcategories/${subcategoryId}`)
                        .then(response => response.json())
                        .then(data => {
                            data.forEach(subSubcategory => {
                                const option = document.createElement('option');
                                option.value = subSubcategory.id;
                                option.textContent = subSubcategory.name;
                                subsubcategorySelect.appendChild(option);
                            });
                            subsubcategorySelect.disabled = false;
                        })
                        .catch(error => console.error('Error fetching sub-subcategories:', error));
                }
            });
        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const affiliateCheckbox = document.getElementById('affiliate_checkbox');
            const affiliatePriceInput = document.getElementById('affiliate_price');
            const commissionInput = document.getElementById('commission');
            const normalPriceInput = document.getElementById('normal_price');
            const totalPriceInput = document.getElementById('total_price');


            affiliateCheckbox.addEventListener('change', function() {
                if (!affiliateCheckbox.checked) {

                    affiliatePriceInput.value = '';
                    commissionInput.value = '';
                    totalPriceInput.value = normalPriceInput.value;
                }
            });


            normalPriceInput.addEventListener('input', function() {
                if (!affiliateCheckbox.checked) {
                    totalPriceInput.value = normalPriceInput.value;
                }
            });
        });
    </script>
    <script>
        let variationIndex = <?php echo e(count($product->variations)); ?>;

        function addVariation() {
            const variationsContainer = document.getElementById('variationsContainer');

            const newVariationRow = document.createElement('div');
            newVariationRow.className = 'row mb-3 variation-row';
            newVariationRow.innerHTML = `
            <div class="col-lg-4">
                <label class="form-label">Select Type</label>
                <select name="variations[${variationIndex}][type]" class="form-select" onchange="toggleColorInput(this)">
                    <option value="">Select</option>
                    <option value="size">Size</option>
                    <option value="color">Color</option>
                </select>
            </div>
            <div class="col-lg-4">
                <label class="form-label">Value</label>
                <input type="text" name="variations[${variationIndex}][value]" class="form-control" placeholder="Enter value" />
                <input type="color" name="variations[${variationIndex}][hex_value]" class="form-control color-input" style="display: none;" />
            </div>
            <div class="col-lg-3">
                <label class="form-label">Quantity</label>
                <input type="number" name="variations[${variationIndex}][quantity]" class="form-control" placeholder="Qty" />
            </div>
            <div class="col-lg-1 text-center">
                <label class="form-label">Delete</label>
                <button type="button" class="btn btn-danger delete-variation" onclick="removeVariation(this)">✖</button>
            </div>
        `;

            variationsContainer.appendChild(newVariationRow);
            variationIndex++;
        }

        function toggleColorInput(select) {
            const colorInput = select.closest('.variation-row').querySelector('.color-input');
            const valueInput = select.closest('.variation-row').querySelector('input[name*="[value]"]');

            if (select.value === 'color') {
                colorInput.style.display = 'block';
                valueInput.style.display = 'none';
                valueInput.value = '';
            } else {
                colorInput.style.display = 'none';
                valueInput.style.display = 'block';
                colorInput.value = '';
            }
        }

        function removeVariation(button) {
            const variationRow = button.closest('.variation-row');
            variationRow.remove();
        }
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\ASUS\Desktop\crown elc\CROWN_ELECTRONICS\resources\views/AdminDashboard/edit_products.blade.php ENDPATH**/ ?>