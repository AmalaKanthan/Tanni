package com.parceldelivery.Services;


import com.parceldelivery.Repository.UserRepository;
import com.parceldelivery.Model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.transaction.Transactional;
import java.util.*;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;


    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void saveMyUser(User user){
        userRepository.save(user);
    }

    public List<User> showAllUsers(){
        List<User> users = new ArrayList<User>();
        for (User user:userRepository.findAll() ){
            users.add(user);
        }
        return users;
    }

    public void deleteUser(User user){
        userRepository.delete(user);
    }

    public User findUser(String email) {
        return userRepository.findByEmail(email);
    }

    public User findByEmailAndPassword(String email,String password){
        return userRepository.findByEmailAndPassword(email,password);
    }

    public List<User> findAllByType(String type){
        return userRepository.findAllByType(type);
    }

    public User updateUser(String email, User newUser)
    {
        if(userRepository.existsById(email)) {

            User user1 = userRepository.findById(email).get();
            user1.setFirstname(newUser.getFirstname());
            user1.setLastname(newUser.getLastname());
            user1.setPassword(newUser.getPassword());
            user1.setType(newUser.getType());
            user1.setBatch(newUser.getBatch());
            userRepository.save(user1);
            return  user1;
        }else
        {
            return null;
        }
    }


}
