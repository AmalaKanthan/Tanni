package com.parceldelivery.Repository;

import com.parceldelivery.Model.Inquiry;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InquiryRepository extends CrudRepository<Inquiry, Integer> {
}
