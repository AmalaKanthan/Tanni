package com.parceldelivery.ParcelCotroller;


import com.parceldelivery.Model.User;
import com.parceldelivery.Services.BatchService;
import com.parceldelivery.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private BatchService batchService;

    @PostMapping("/add-user-process")
    public String registerUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request){
        userService.saveMyUser(user);
        return "home";
    }

    @RequestMapping(value="/edit-individual-user", method=RequestMethod.GET)
    public String editIndividualUser(@RequestParam (value="userEmail") String email,  HttpServletRequest request){
        request.setAttribute("user",userService.findUser(email));
        request.setAttribute("batches",batchService.showAllBatches());
        return "editIndividualUser";
    }

    @PostMapping("/edit-individual-user-process")
    public String editUser(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request){
        userService.saveMyUser(user);
        return "home";
    }
    @RequestMapping(value="/delete-individual-user", method=RequestMethod.GET)
    public String deleteIndividualUser(@RequestParam (value="userEmail") String email,  HttpServletRequest request){
        userService.deleteUser(userService.findUser(email));
        request.setAttribute("users",userService.showAllUsers());
        return "removeUser";
    }
    @RequestMapping("/login-user")
    public String loginUser(@ModelAttribute User user,HttpServletRequest request) {
        String lastPage = (String) request.getSession().getAttribute("lastPage");
        if (userService.findByEmailAndPassword(user.getEmail(), user.getPassword()) != null) {
            request.getSession().setAttribute("userSession", user.getEmail());
            if(lastPage == null){
                return "redirect:/home";
            }else {
                return "redirect:/" + lastPage;
            }
        } else if (userService.findByEmailAndPassword(user.getEmail(), user.getPassword() + "generated$by$atlantis") != null) {
            request.setAttribute("user", new User());
            request.setAttribute("user1", userService.findUser(user.getEmail()));
            request.getSession().setAttribute("userSession", user.getEmail());
            return "createPassword";
        } else {
            request.setAttribute("login_error", "*** Invalid Username or Password ***");
            return "redirect:/welcome";
        }
    }

    @RequestMapping("/confirmPassword")
    public String confirmPassword(@ModelAttribute User user,HttpServletRequest request){
        User u = userService.findUser((String) request.getSession().getAttribute("userSession"));
        u.setPassword(user.getPassword());
        return "redirect:/home";
    }

    @RequestMapping("/signOut")
    public String sigOut(@ModelAttribute User user, BindingResult bindingResult, HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/welcome";
    }

}
