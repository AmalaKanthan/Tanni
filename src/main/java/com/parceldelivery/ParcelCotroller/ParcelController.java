package com.parceldelivery.ParcelCotroller;
import com.parceldelivery.Model.Delivery;
import com.parceldelivery.Model.Parcel;
import com.parceldelivery.Services.ParcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ParcelController {

    @Autowired
    ParcelService parcelService;

    @GetMapping("/getParcel")
    public List<Parcel> showAllParcel() {

        return parcelService.showAllParcel();
    }

    @DeleteMapping("/parcel/{parcelID}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteBatch(@PathVariable("parcelID")Parcel  parcelID)
    {
        parcelService.deleteParcel(parcelID);
    }

    @PostMapping("/parcel/addParcel")
    public String addParcel(Parcel parcel){
        parcelService.saveParcel(parcel);
        return "redirect:/add-delivery";
    }


    @PutMapping("/updateParcel/{parcelID}")
    public Parcel updateBatch(@PathVariable Integer parcelID, @RequestBody Parcel parcel) {
        return parcelService.updateParcel(parcelID, parcel);
    }

}


