package com.parceldelivery.Repository;

import com.parceldelivery.Model.Customer;
import com.parceldelivery.Model.Driver;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends CrudRepository<Customer,String > {
    public Customer findByEmailAndPassword(String email, String password);
    public Customer findByEmail(String email);
    public Customer deleteByEmail(String email);
//    public List<Customer> findAllByType(String type);
}
