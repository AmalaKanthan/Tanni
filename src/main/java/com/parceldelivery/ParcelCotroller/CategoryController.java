package com.parceldelivery.ParcelCotroller;
import com.parceldelivery.Model.Category;
import com.parceldelivery.Services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @GetMapping("/getCategory")
    public List<Category> showAllCategory() {

        return categoryService.showAllCategory();
    }

    @DeleteMapping("/category/{categoryID}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteCategory(@PathVariable("categoryID") Category categoryID)
    {
        categoryService.deleteCategory(categoryID);
    }

    @PostMapping(path="/category/addcategory")
    public boolean addParcel(@RequestBody Category category){
        categoryService.saveCategory(category);
        return true;
    }


    @PutMapping("/updateCategory/{categoryID}")
    public String updateBatch(@PathVariable Integer categoryID, @RequestBody Category category) {
         categoryService.updateCategory(categoryID, category);
         return "success";
    }

}


