package com.parceldelivery.ParcelCotroller;
import com.parceldelivery.Model.Customer;
import com.parceldelivery.Model.Driver;
import com.parceldelivery.Model.Parcel;
import com.parceldelivery.Model.User;
import com.parceldelivery.Services.CustomerService;
import com.parceldelivery.Services.DriverService;
import com.parceldelivery.Services.ParcelService;
import com.parceldelivery.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    CustomerService customerService;

    @GetMapping("/customerHome")
    public String CustomerHome(HttpServletRequest request, Model model){
        String customer= request.getSession().getAttribute("userSession").toString();
        Customer user=customerService.findCustomer(customer);
        model.addAttribute("user",user);

        return "/customer-profile";
    }

    @PostMapping("/login-customer")
    public String login(Customer customer, HttpServletRequest request) {
        String result="";
        Customer customer1=customerService.findByEmailAndPassword(customer.getEmail(), customer.getPassword());
        if ( customer1== null) {
            request.setAttribute("error", "User not Found");
            result = "redirect:/login-customer";
        }
        else {
            request.getSession().setAttribute("userSession", customer.getEmail());
            request.setAttribute("success", "Successfully Logged in");
            result = "redirect:/customer-profile";
        }

        return result;
    }




    @GetMapping("/customer/{email}")
    public String deleteCustomer(@PathVariable("email")Customer  email)
    {
        customerService.deleteCustomer(email);
        return "redirect:/admin";
    }

    @PostMapping("/customer/addCustomer")
    public String addDriver( Customer customer){
        System.out.println(customer);
        customerService.saveCustomer(customer);
        System.out.println(customer);
        return "redirect:/login-customer";
    }


    @PutMapping("/updateDriver/{customerID}")
    public String updateCustomer(@PathVariable String driverID, @RequestBody Customer customer) {
        customerService.updateCustomer(driverID, customer);
        return "Updated";
    }

    @RequestMapping("/signOutC")
    public String sigOut(@ModelAttribute Customer Customer, BindingResult bindingResult, HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/test";
    }
}


