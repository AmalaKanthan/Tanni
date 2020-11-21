package com.parceldelivery.ParcelCotroller;

import com.parceldelivery.Model.*;
import com.parceldelivery.Services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class HomeContoller {
    @Autowired
    UserService userService;

    @Autowired
    CustomerService customerService;

    @Autowired
    DriverService driverService;


    @Autowired
    ParcelService parcelService;

    @Autowired
    InquiryService inquiryService;


    @RequestMapping("/login-driver")
    public String loginDriver(Driver driver){

        return "loginDriver";
    }



    @RequestMapping("/login-customer")
    public String loginCustomer(Customer customer){

        return "loginCustomer";
    }

    @RequestMapping("/register-driver")
    public String registerDriver(Driver driver){

        return "driverRegister";
    }

    @RequestMapping("/register-customer")
    public String registerCustomer(Customer customer){

        return "customerRegister";
    }

    @RequestMapping("/add-delivery")
    public String registerDelivery(Delivery delivery){

        return "addDelivery";
    }

    @RequestMapping("/add-parcel")
    public String addParcel(Parcel parcel){

        return "addParcel";
    }
    @RequestMapping("/test")
    public String wwelcome(){

        return "test";
    }

    @RequestMapping("/admin")
    public String AdminPage(HttpServletRequest request){
        List<Customer> users=customerService.showAllCustomer();
        request.setAttribute("users",users);
        request.setAttribute("Hello","Admin!!");
       // request.setAttribute("users",userService.showAllUsers());
        return "admin";
    }


    @RequestMapping("/view-all-driver")
    public String viewAllDriver(HttpServletRequest request){
        List<Driver> users=driverService.showAllDriver();
        request.setAttribute("users",users);
        // request.setAttribute("users",userService.showAllUsers());
        return "viewAllDriver";
    }

    @RequestMapping("/customer-profile")
    public String customerprofile(HttpServletRequest request, Model model){
        String customer= request.getSession().getAttribute("userSession").toString();
        Customer user=customerService.findCustomer(customer);
        model.addAttribute("user",user);
        return "customerProfile";
    }

    @RequestMapping("/driver-profile")
    public String driverprofile(HttpServletRequest request, Model model){
        String driver= request.getSession().getAttribute("userSession").toString();
        Driver user=driverService.findDriver(driver);
        model.addAttribute("user",user);
        return "driverProfile";
    }
    @RequestMapping("/adminparcel")
    public String AdminParcel(HttpServletRequest request){
        List<Parcel> parcels = parcelService.showAllParcel();
        request.setAttribute("parcels",parcels);
        return "adminparcel";
    }

    @RequestMapping("/admininquiry")
    public String AdminInquiry(HttpServletRequest request){
        List<Inquiry> inquiries = inquiryService.showAllInquiry();
        request.setAttribute("inquiries",inquiries);
        return "inbox";
    }

    @RequestMapping("/contact")
    public String contact(){

        return "contact";
    }

}
