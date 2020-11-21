package com.parceldelivery.Repository;

import com.parceldelivery.Model.Parcel;
import org.springframework.data.repository.CrudRepository;

public interface ParcelRepository extends CrudRepository<Parcel,Integer> {
//    public Parcel findByParcelDetails(int id);
}
