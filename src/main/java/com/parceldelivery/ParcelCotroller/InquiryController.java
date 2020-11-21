package com.parceldelivery.ParcelCotroller;
import com.parceldelivery.Model.Inquiry;
import com.parceldelivery.Services.InquiryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class InquiryController {

    @Autowired
    InquiryService inquiryService;

    @GetMapping("/getInquiry")
    public List<Inquiry> showAllInquiry() {

        return inquiryService.showAllInquiry();
    }

    @GetMapping("/inquiry/{inquiryID}")
    public String deleteInquiry(@PathVariable("inquiryID")Inquiry  inquiryID)
    {
        inquiryService.deleteInquiry(inquiryID);
        return "redirect:/admininquiry";
    }



    @PostMapping("/inquiry/addInquiry")
    public String addInquiry(Inquiry inquiry){

        inquiryService.saveInquiry(inquiry);

        return "redirect:/contact";
    }




}


