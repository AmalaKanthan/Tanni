package com.parceldelivery.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "Category")
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="categoryID")
    private int categoryID;

    @Column(name="categoryType")
    private String categoryType;

   @OneToOne(mappedBy = "categorii")
   private Parcel parcell;

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryType() {
        return categoryType;
    }

    public void setCategoryType(String categoryType) {
        this.categoryType = categoryType;
    }

    public Parcel getParcell() {
        return parcell;
    }

    public void setParcell(Parcel parcell) {
        this.parcell = parcell;
    }
}
