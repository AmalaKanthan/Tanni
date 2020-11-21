package com.parceldelivery.MobileController;

import com.parceldelivery.Model.Driver;
import com.parceldelivery.Services.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class MobileDriverController {

    @Autowired
    DriverService DService;

    @RequestMapping("/mobile/login-driver")
    public String loginDriver(@RequestBody Driver driver) {
        String result = "";
        System.out.println(driver);
        Driver driver1 = DService.findByEmailAndPassword(driver.getEmail(), driver.getPassword());
        System.out.println(driver1);
        //  String lastPage = (String) request.getSession().getAttribute("lastPage");
        if (driver1 != null) {//  request.getSession().setAttribute("userSession", user.getEmail());
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

    @GetMapping("/mobile/getAllDrivers")
    public List<Driver> getAllDrivers(){
        return DService.showAllDriver();
    }

    @PostMapping(path="/mobile/addDriver")
    public boolean addDriver(@RequestBody Driver driver){
        DService.saveDriver(driver);
        return true;
    }

    //a

    @PutMapping("/mobile/updateDriver/{emailID}")
    public Driver updateDriver(@PathVariable String emailID, @RequestBody Driver user) {
        return DService.updateDriver(emailID, user);
    }

    @DeleteMapping("/mobile/Driver/{email}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteDriver(@PathVariable("email") Driver email){
        DService.deleteDriver(email);
    }

    }

