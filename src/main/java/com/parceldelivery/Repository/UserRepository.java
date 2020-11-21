package com.parceldelivery.Repository;

import com.parceldelivery.Model.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends CrudRepository<User, String> {
    public User findByEmailAndPassword(String email, String password);
    public User findByEmail(String email);
    public User deleteByEmail(String email);
    public List<User> findAllByType(String type);
}
