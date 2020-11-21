package com.parceldelivery.ParcelCotroller;
import com.parceldelivery.Model.Customer;
import com.parceldelivery.Model.Delivery;
import com.parceldelivery.Services.DeliveryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class DeliveryController {

    @Autowired
    DeliveryService deliveryService;

    @GetMapping("/getDelivery")
    public List<Delivery> showAllDelivery() {

        return deliveryService.showAllDelivery();
    }

    @DeleteMapping("/delivery/{deliveryID}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteDelivery(@PathVariable("deliveryID") Delivery deliveryID)
    {
        deliveryService.deleteDelivery(deliveryID);
    }


    @GetMapping("/delivery/addDelivery")
    public String addParcel(Delivery delivery){
        deliveryService.saveDelivery(delivery);
        return "redirect:/add-delivery";
    }


    @PutMapping("/updateDelivery/{deliveryID}")
    public Delivery updateBatch(@PathVariable Integer deliveryID, @RequestBody Delivery delivery) {
        return deliveryService.updateDelivery(deliveryID, delivery);
    }

}


