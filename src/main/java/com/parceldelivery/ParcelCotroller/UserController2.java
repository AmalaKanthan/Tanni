package com.parceldelivery.ParcelCotroller;
import com.parceldelivery.Model.Parcel;
import com.parceldelivery.Model.User;
import com.parceldelivery.Services.ParcelService;
import com.parceldelivery.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController2 {

    @Autowired
    UserService userService;

    @PostMapping("/login-userr")
    public String loginUser(User user, HttpServletRequest request) {
        String result="";
        User user1=userService.findByEmailAndPassword(user.getEmail(), user.getPassword());
        if ( user1== null) {
            request.setAttribute("error","User not Found");
             result="redirect:/login";

        } else {
            System.out.println(user.getEmail());
            System.out.println(user.getPassword());
            if(user1.getType().equals("admin"))
            {
                System.out.println(user1.getType());
                request.getSession().setAttribute("userSession", user.getEmail());
                request.setAttribute("success", "Successfully Logged in");
                result="redirect:/admin";
            }
            else if(user1.getType().equals("customer")) {
                request.getSession().setAttribute("userSession", user.getEmail());
                request.setAttribute("success", "Successfully Logged in");
                result = "redirect:/test";
            }
            else {
                request.getSession().setAttribute("userSession", user.getEmail());
                request.setAttribute("success", "Successfully Logged in");
                result = "redirect:/test";
            }
        }
    return result;
    }


    @GetMapping("/getUser")
    public List<User> showAllUser() {

        return userService.showAllUsers();
    }

    @GetMapping("/user/{userID}")
    public String deleteUser(@PathVariable("userID")User  userID)
    {
        userService.deleteUser(userID);
        return "redirect:/admin";
    }

    @PostMapping("/user/addUser")
    public String addUser( User user){
        System.out.println(user);
        userService.saveMyUser(user);
        System.out.println(user);
        return "redirect:/login";
    }


    @PutMapping("/updateUser/{userID}")
    public String updateUser(@PathVariable String userID, @RequestBody User user) {
        userService.updateUser(userID, user);
        return "Updated";
    }

}


