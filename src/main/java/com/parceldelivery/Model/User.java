package com.parceldelivery.Model;


import lombok.*;

import javax.persistence.*;
@ToString
//@Getter
//@Setter
@Entity
@Table(name = "users")
public class User {

    @Id
    private String email;

    private String firstname;

    private String lastname;

    private String password;

    private String type;

    private String batch;



    public User() {
    }



    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }
}

