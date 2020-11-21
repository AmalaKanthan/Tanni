package com.parceldelivery.Services;

import com.parceldelivery.Model.TimeSlot;
import com.parceldelivery.Repository.TimeSlotRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TimeSlotService {

    @Autowired
    TimeSlotRepository timeSlotRepository;

    public List<TimeSlot> getAllTimeSlots(){
        List<TimeSlot> timeSlots = new ArrayList<TimeSlot>();
        for (TimeSlot timeSlot:timeSlotRepository.findAll() ){
            timeSlots.add(timeSlot);
        }
        return timeSlots;
    }
}
