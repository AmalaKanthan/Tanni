package com.parceldelivery.Model;


import lombok.*;

import javax.persistence.*;
@ToString
//@Getter
//@Setter
@Entity
@Table(name = "customer")
public class Customer {

    @Id
    private String email;

    private String firstname;

    private String lastname;

    private String password;

    private long contactnumber;



    public Customer() {
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

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password) {

        this.password = password;
    }

    public long getContactnumber() {
        return contactnumber;
    }

    public void setContactnumber(long contactnumber) {

        this.contactnumber = contactnumber;
    }
}

