package com.parceldelivery.Services;

import com.parceldelivery.Repository.CategoryRepository;
import com.parceldelivery.Model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    public String saveCategory(Category category){
        categoryRepository.save(category);
        return "success";
    }

    public List<Category> showAllCategory(){
        List<Category> deliveries = new ArrayList<Category>();
        for (Category delivery:categoryRepository.findAll() ){
            deliveries.add(delivery);
        }
        return deliveries;
    }

    public Category findByAllCategory(int id){

        return categoryRepository.findById(id).get();
    }

    public String deleteCategory(Category category){

        categoryRepository.delete(category);

        return "Deleted successfully";
    }



    public String updateCategory(Integer categoryID, Category newCategory)
    {
        if(categoryRepository.existsById(categoryID)) {
            Category category1 = categoryRepository.findById(categoryID).get();
            category1.setCategoryType(newCategory.getCategoryType());
            //category1.setParcell(newCategory.getParcell());
            categoryRepository.save(newCategory);
            return "updated successfully";
        }else
        {
            return null;
        }
    }




}
