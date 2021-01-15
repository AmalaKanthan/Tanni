package com.parceldelivery.MobileController;

import com.parceldelivery.Model.Inquiry;
import com.parceldelivery.Services.CustomerService;
import com.parceldelivery.Services.InquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

public class MobileInquiryController {
    @Autowired
    InquiryService IService;

    @PostMapping(path="/mobile/addInquiry")
    public boolean saveInquiry(Inquiry inquiry){
        IService.saveInquiry(inquiry);
        return true;
    }

    @GetMapping(path="/mobile/showAllInquiry")
    public List<Inquiry> showAllInquiry(){
        return IService.showAllInquiry();
    }

    @DeleteMapping("/inquiry/{inquiryID}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteInquiry(@PathVariable("inquiryID")Inquiry  inquiryID)
    {
        IService.deleteInquiry(inquiryID);
    }

}
