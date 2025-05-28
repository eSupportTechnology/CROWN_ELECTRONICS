<?php $__env->startSection('content'); ?>


<div class="content-header">
    <div>
        <h2 class="content-title card-title">Edit Category</h2>
    </div>
</div>
<div>
    <div class="card">
        <div class="card-body">
            <form id="editCategoryForm" action="<?php echo e(route('categories.update', $category->id)); ?>" method="POST">
                <?php echo csrf_field(); ?>
                <?php echo method_field('PUT'); ?>

                <div class="mb-3">
                    <label for="categoryName" class="form-label" style="font-size: 15px;">Main Category</label>
                    <input type="text" class="form-control" id="categoryName" name="name" value="<?php echo e($category->name); ?>" required>
                </div>

                <button type="button" class="btn btn-secondary mb-3" id="addSubcategoryGroup">
                    Add Subcategory
                </button>
                <div id="subcategories" class="mb-3">
                <?php $__currentLoopData = $category->subcategories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subcategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="subcategory-wrapper mb-3" data-index="<?php echo e($loop->index); ?>">
                        <input type="hidden" name="subcategories[<?php echo e($loop->index); ?>][id]" value="<?php echo e($subcategory->id); ?>">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" name="subcategories[<?php echo e($loop->index); ?>][name]" value="<?php echo e($subcategory->name); ?>" placeholder="Enter subcategory name" required>
                            
                            <button type="button" class="btn btn-secondary add-subsubcategory">
                                <i class="fas fa-plus"></i>
                            </button>
                            <button type="button" class="btn btn-danger delete-subcategory">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                        <div class="sub-subcategories ms-4">
                            <?php $__currentLoopData = $subcategory->subSubcategories; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $subSubcategory): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <div class="input-group mb-3">
                                    <input type="hidden" name="subcategories[<?php echo e($loop->parent->index); ?>][sub_subcategories][<?php echo e($loop->index); ?>][id]" value="<?php echo e($subSubcategory->id); ?>">
                                    <input type="text" class="form-control" name="subcategories[<?php echo e($loop->parent->index); ?>][sub_subcategories][<?php echo e($loop->index); ?>][name]" value="<?php echo e($subSubcategory->name); ?>" placeholder="Enter sub-subcategory name" required>
                                    <button type="button" class="btn btn-danger delete-subsubcategory">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </div>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                </div>

                <button type="submit" class="btn btn-primary">Update Category</button>
            </form>
        </div>
    </div>
</div>

<script>

document.addEventListener('DOMContentLoaded', function () {
    let subcategoryIndex = <?php echo e(count($category->subcategories)); ?>; 
    
    // Event delegation for adding sub-subcategories
    document.getElementById('subcategories').addEventListener('click', function (e) {
        if (e.target.closest('.add-subsubcategory')) {
            const subcategoryWrapper = e.target.closest('.subcategory-wrapper');
            const subSubcategoriesContainer = subcategoryWrapper.querySelector('.sub-subcategories');

            const subSubcategoryIndex = subSubcategoriesContainer.children.length;

            const subSubInputGroup = document.createElement('div');
            subSubInputGroup.className = 'input-group mb-3';

            const subSubInput = document.createElement('input');
            subSubInput.type = 'text';
            subSubInput.className = 'form-control';
            subSubInput.name = `subcategories[${subcategoryWrapper.dataset.index}][sub_subcategories][${subSubcategoryIndex}][name]`; // Correctly structured for submission
            subSubInput.placeholder = 'Enter sub-subcategory name';
            subSubInput.required = true; // Make it required if needed

            const subSubDeleteButton = document.createElement('button');
            subSubDeleteButton.className = 'btn btn-danger';
            subSubDeleteButton.type = 'button';
            subSubDeleteButton.innerHTML = '<i class="fas fa-trash"></i>';

            subSubDeleteButton.addEventListener('click', function () {
                subSubInputGroup.remove();
            });

            subSubInputGroup.appendChild(subSubInput);
            subSubInputGroup.appendChild(subSubDeleteButton);
            subSubcategoriesContainer.appendChild(subSubInputGroup);
        }

        if (e.target.closest('.delete-subcategory')) {
            e.target.closest('.subcategory-wrapper').remove();
        }
    });

    // Add new subcategory logic
    document.getElementById('addSubcategoryGroup').addEventListener('click', function () {
        const subcategoriesContainer = document.getElementById('subcategories');

        const subcategoryWrapper = document.createElement('div');
        subcategoryWrapper.className = 'subcategory-wrapper mb-3';
        subcategoryWrapper.dataset.index = subcategoryIndex; 

        const inputGroup = document.createElement('div');
        inputGroup.className = 'input-group mb-3';

        const input = document.createElement('input');
        input.type = 'text';
        input.className = 'form-control';
        input.name = `subcategories[${subcategoryIndex}][name]`; 
        input.placeholder = 'Enter subcategory name';
        input.required = true; 

        const addSubSubcategoryButton = document.createElement('button');
        addSubSubcategoryButton.className = 'btn btn-secondary add-subsubcategory';
        addSubSubcategoryButton.type = 'button';
        addSubSubcategoryButton.innerHTML = '<i class="fas fa-plus"></i>';

        const deleteButton = document.createElement('button');
        deleteButton.className = 'btn btn-danger delete-subcategory';
        deleteButton.type = 'button';
        deleteButton.innerHTML = '<i class="fas fa-trash"></i>';

        inputGroup.appendChild(input);
        inputGroup.appendChild(addSubSubcategoryButton);
        inputGroup.appendChild(deleteButton);
        subcategoryWrapper.appendChild(inputGroup);

        const subSubcategoriesContainer = document.createElement('div');
        subSubcategoriesContainer.className = 'sub-subcategories ms-4';
        subcategoryWrapper.appendChild(subSubcategoriesContainer);

        subcategoriesContainer.appendChild(subcategoryWrapper);

        subcategoryIndex++;
    });
});


</script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('AdminDashboard.master', array_diff_key(get_defined_vars(), ['__data' => 1, '__path' => 1]))->render(); ?><?php /**PATH C:\Users\ASUS\Desktop\crown elc\CROWN_ELECTRONICS\resources\views/AdminDashboard/edit_category.blade.php ENDPATH**/ ?>