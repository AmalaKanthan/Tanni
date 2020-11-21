package com.parceldelivery.Services;

import com.parceldelivery.Model.Parcel;
import com.parceldelivery.Repository.ParcelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class ParcelService {
    @Autowired
    ParcelRepository parcelRepository;

    public boolean saveParcel(Parcel parcel){
        parcelRepository.save(parcel);
        return true;
    }

    public List<Parcel> showAllParcel(){
        List<Parcel> parcels = new ArrayList<Parcel>();
        for (Parcel parcel:parcelRepository.findAll() ){
            parcels.add(parcel);
        }
        return parcels;
    }

    public Parcel findByParcelId(int id){

        return parcelRepository.findById(id).get();
    }

    public void deleteParcel(Parcel parcel){

        parcelRepository.delete(parcel);
    }



    public Parcel updateParcel(Integer parcelID, Parcel newParcel)
    {
        if(parcelRepository.existsById(parcelID)) {
            Parcel parcel1 = parcelRepository.findById(parcelID).get();
            parcelRepository.save(parcel1);
            return parcel1;
        }else
        {
            return null;
        }
    }




}
