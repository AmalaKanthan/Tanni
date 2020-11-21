package com.parceldelivery.Services;

import com.parceldelivery.Model.Inquiry;
import com.parceldelivery.Repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class InquiryService {
    @Autowired
    InquiryRepository inquiryRepository;

    public boolean saveInquiry(Inquiry inquiry){
        inquiryRepository.save(inquiry);
        return true;
    }

    public List<Inquiry> showAllInquiry(){
        List<Inquiry> inquiries = new ArrayList<Inquiry>();
        for (Inquiry inquiry:inquiryRepository.findAll() ){
            inquiries.add(inquiry);
        }
        return inquiries;
    }

    public Inquiry findByInquiry(int id){

        return inquiryRepository.findById(id).get();
    }

    public void deleteInquiry(Inquiry inquiry){

        inquiryRepository.delete(inquiry);
    }






}
