package com.parceldelivery.Services;

import com.parceldelivery.Model.Customer;
import com.parceldelivery.Repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.transaction.Transactional;
import java.util.*;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;



    public void saveCustomer(Customer customer){

        customerRepository.save(customer);
    }

    public List<Customer> showAllCustomer(){
        List<Customer> customers = new ArrayList<Customer>();
        for (Customer driver:customerRepository.findAll() ){
            customers.add(driver);
        }
        return customers;
    }

    public void deleteCustomer(Customer customer){
        customerRepository.delete(customer);
    }

    public Customer findCustomer(String email) {

        return customerRepository.findByEmail(email);
    }

    public Customer findByEmailAndPassword(String email,String password){
        return customerRepository.findByEmailAndPassword(email,password);
    }

//    public List<Customer> findAllByType(String type){
//
//        return customerRepository.findAllByType(type);
//    }

    public Customer updateCustomer(String email, Customer newCustomer)
    {
        if(customerRepository.existsById(email)) {

            Customer customer1 = customerRepository.findById(email).get();
            customer1.setFirstname(newCustomer.getFirstname());
            customer1.setLastname(newCustomer.getLastname());
            customer1.setPassword(newCustomer.getPassword());
            customer1.setContactnumber(newCustomer.getContactnumber());

            customerRepository.save(customer1);
            return  customer1;
        }else
        {
            return null;
        }
    }


}
