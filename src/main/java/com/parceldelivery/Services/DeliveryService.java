package com.parceldelivery.Services;

import com.parceldelivery.Repository.DeliveryRepository;
import com.parceldelivery.Model.Delivery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class DeliveryService {
    @Autowired
    DeliveryRepository deliveryRepository;

    public boolean saveDelivery(Delivery delivery){
        deliveryRepository.save(delivery);
        return true;
    }

    public List<Delivery> showAllDelivery(){
        List<Delivery> deliveries = new ArrayList<Delivery>();
        for (Delivery delivery:deliveryRepository.findAll() ){
            deliveries.add(delivery);
        }
        return deliveries;
    }

    public Delivery findByAllDelivery(int id){
        return deliveryRepository.findById(id).get();
    }

    public void deleteDelivery(Delivery delivery){

        deliveryRepository.delete(delivery);
    }



    public Delivery updateDelivery(Integer deliveryID, Delivery newDelivery)
    {
        if(deliveryRepository.existsById(deliveryID)) {
            Delivery delivery1 = deliveryRepository.findById(deliveryID).get();
            delivery1.setReceiverAddress(newDelivery.getReceiverAddress());
            delivery1.setRecieverContact(newDelivery.getRecieverContact());
            delivery1.setSenderAddress(newDelivery.getReceiverAddress());
            delivery1.setSenderContact(newDelivery.getSenderContact());
            deliveryRepository.save(newDelivery);
            return delivery1;
        }else
        {
            return null;
        }
    }




}
