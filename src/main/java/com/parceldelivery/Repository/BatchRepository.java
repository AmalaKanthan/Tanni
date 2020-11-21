package com.parceldelivery.Repository;

import com.parceldelivery.Model.Batch;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BatchRepository extends CrudRepository <Batch,Integer> {
    public Batch findByIdBatchDetails(int id);
}
