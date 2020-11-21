package com.parceldelivery.Services;

import com.parceldelivery.Repository.BatchRepository;
import com.parceldelivery.Model.Batch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BatchService {
    @Autowired
    BatchRepository batchRepository;

    public boolean saveBatch(Batch batch){
        batchRepository.save(batch);
        return true;
    }

    public List<Batch> showAllBatches(){
        List<Batch> batches = new ArrayList<Batch>();
        for (Batch batch:batchRepository.findAll() ){
            batches.add(batch);
        }
        return batches;
    }

    public Batch findByBatchId(int id){
        return batchRepository.findByIdBatchDetails(id);
    }

    public void deleteBatch(Batch batch){
        batchRepository.delete(batch);
    }



    public Batch updateBatch(Integer batchID, Batch newbatch)
    {
        if(batchRepository.existsById(batchID)) {
            Batch batch1 = batchRepository.findById(batchID).get();
            batch1.setBatchName(newbatch.getBatchName());
            batch1.setLecturerEmail(newbatch.getLecturerEmail());
            batchRepository.save(batch1);
            return batch1;
        }else
        {
            return null;
        }
    }




}
