package com.parceldelivery.Services;


import com.parceldelivery.Model.Driver;
import com.parceldelivery.Repository.DriverRepository;
import com.parceldelivery.Repository.UserRepository;
import com.parceldelivery.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.transaction.Transactional;
import java.util.*;

@Service
@Transactional
public class DriverService {

    @Autowired
    private DriverRepository driverRepository;


    public DriverService(DriverRepository driverRepository) {

        this.driverRepository = driverRepository;
    }

    public void saveDriver(Driver driver){

        driverRepository.save(driver);
    }

    public List<Driver> showAllDriver(){
        List<Driver> drivers = new ArrayList<Driver>();
        for (Driver driver:driverRepository.findAll() ){
            drivers.add(driver);
        }
        return drivers;
    }

    public void deleteDriver(Driver driver){
        driverRepository.delete(driver);
    }

    public Driver findDriver(String email) {

        return driverRepository.findByEmail(email);
    }

    public Driver findByEmailAndPassword(String email,String password){
        return driverRepository.findByEmailAndPassword(email,password);
    }

//    public List<Driver> findAllByType(String type){
//
//        return driverRepository.findAllByType(type);
//    }

    public Driver updateDriver(String email, Driver newDriver)
    {
        if(driverRepository.existsById(email)) {

            Driver driver1 = driverRepository.findById(email).get();
            driver1.setFirstname(newDriver.getFirstname());
            driver1.setLastname(newDriver.getLastname());
            driver1.setPassword(newDriver.getPassword());
            driver1.setVehicleType(newDriver.getVehicleType());
            driver1.setVehicleNumber(newDriver.getVehicleNumber());

            driverRepository.save(driver1);
            return  driver1;
        }else
        {
            return null;
        }
    }


}
