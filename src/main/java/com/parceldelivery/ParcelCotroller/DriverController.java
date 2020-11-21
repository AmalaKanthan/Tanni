package com.parceldelivery.ParcelCotroller;
import com.parceldelivery.Model.Customer;
import com.parceldelivery.Model.Driver;
import com.parceldelivery.Model.Parcel;
import com.parceldelivery.Model.User;
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
public class DriverController {

    @Autowired
    DriverService driverService;

    @GetMapping("/driverHome")
    public String DriverHome(HttpServletRequest request){
       String hello= request.getSession().getAttribute("userSession").toString();
        return "test";
    }

    @GetMapping("/driverrHome")
    public String CustomerHome(HttpServletRequest request, Model model){
        String driver= request.getSession().getAttribute("userSession").toString();
        Driver user=driverService.findDriver(driver);
        model.addAttribute("user",user);

        return "/driver-profile";
    }



    @PostMapping("/login-driver")
    public String login(Driver driver, HttpServletRequest request) {
        String result="";
        Driver driver1=driverService.findByEmailAndPassword(driver.getEmail(), driver.getPassword());
        if ( driver1== null) {
            request.setAttribute("error", "User not Found");
            result = "redirect:/login-driver";
        }
            else {
                request.getSession().setAttribute("userSession", driver.getEmail());
                request.setAttribute("success", "Successfully Logged in");
                result = "redirect:/driver-profile";
            }

        return result;
    }




    @GetMapping("/driver/{email}")
    public String deleteUser(@PathVariable("email")Driver  email)
    {
        driverService.deleteDriver(email);
        return "redirect:/view-all-driver";
    }

    @PostMapping("/driver/addDriver")
    public String addDriver( Driver driver){
        System.out.println(driver);
        driverService.saveDriver(driver);
        System.out.println(driver);
        return "redirect:/login-driver";
    }


    @PutMapping("/updateDriver/{driverID}")
    public String updateDriver(@PathVariable String driverID, @RequestBody Driver driver) {
        driverService.updateDriver(driverID, driver);
        return "Updated";
    }

    @RequestMapping("/signOutD")
    public String sigOut(@ModelAttribute Driver driver, BindingResult bindingResult, HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/test";
    }
}


