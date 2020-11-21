package com.parceldelivery.MobileController;

import com.parceldelivery.Model.Driver;
import com.parceldelivery.Services.DriverService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MobileUserController {

    @Autowired
    DriverService DService;

    @RequestMapping("/mobile/login-user")
    public String loginUser(@RequestBody Driver driver) {
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

}


