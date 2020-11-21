package com.parceldelivery.Repository;

import com.parceldelivery.Model.Driver;
import com.parceldelivery.Model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DriverRepository extends CrudRepository<Driver,String> {
    public Driver findByEmailAndPassword(String email, String password);
    public Driver findByEmail(String email);
    public Driver deleteByEmail(String email);
//    public List<Driver> findAllByType(String type);
}
