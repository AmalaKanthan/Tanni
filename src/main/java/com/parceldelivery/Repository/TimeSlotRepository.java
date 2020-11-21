package com.parceldelivery.Repository;

import com.parceldelivery.Model.TimeSlot;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TimeSlotRepository extends CrudRepository<TimeSlot,Integer> {
}
