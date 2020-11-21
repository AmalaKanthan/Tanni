package com.parceldelivery.MobileController;
import com.parceldelivery.Model.Customer;
import com.parceldelivery.Services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class MobileCustomerController {

    @Autowired
    CustomerService SService;

    @RequestMapping("/mobile/login-customer")
    public String loginCustomer(@RequestBody Customer customer) {
        String result = "";
        System.out.println(customer);
        Customer customer1 = SService.findByEmailAndPassword(customer.getEmail(), customer.getPassword());
        System.out.println(customer1);
        //  String lastPage = (String) request.getSession().getAttribute("lastPage");
        if (customer1 != null) {//  request.getSession().setAttribute("userSession", user.getEmail());
//            if(lastPage == null){
//                return "redirect:/home";
//            }else {
//                return "redirect:/" + lastPage;
//            }
            result = "Successfully Logged in";
            return result;

        } else {
            // request.setAttribute("user", new User());
            //request.setAttribute("user1", userService.findUser(user.getEmail()));
            //request.getSession().setAttribute("userSession", user.getEmail());

            result = "User not Found";
            return result;
        }
    }

    @GetMapping("/mobile/getAllCustomers")
    public List<Customer> getAllCustomers(){
        return SService.showAllCustomer();
    }

    @PostMapping(path="/mobile/addCustomer")
    public boolean addCustomer(@RequestBody Customer customer){
        SService.saveCustomer(customer);
        return true;
    }

    @PutMapping("/mobile/updateCustomer/{emailID}")
    public Customer updateCustomer(@PathVariable String emailID, @RequestBody Customer customer) {
        return SService.updateCustomer(emailID, customer);
    }

    @DeleteMapping("/mobile/Customer/{email}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteCustomer(@PathVariable("email") Customer email){
        SService.deleteCustomer(email);
    }

}

