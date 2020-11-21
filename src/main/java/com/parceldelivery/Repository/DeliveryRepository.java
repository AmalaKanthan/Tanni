package com.parceldelivery.Repository;

import com.parceldelivery.Model.Delivery;
import org.springframework.data.repository.CrudRepository;

public interface DeliveryRepository extends CrudRepository<Delivery,Integer> {
//    public Parcel findByParcelDetails(int id);
}