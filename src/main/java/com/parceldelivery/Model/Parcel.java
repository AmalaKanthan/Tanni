package com.parceldelivery.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "parcel")
public class Parcel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int parcelID;

    private String weight;

    private String parcelType;

    private String size;

    private String note;



    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "category_id", referencedColumnName = "categoryID")
    private Category categorii;

    @OneToOne(mappedBy = "parcel")
    private Delivery delivery;

    public int getParcelID() {
        return parcelID;
    }

    public void setParcelID(int parcelID) {
        this.parcelID = parcelID;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getParcelType() {
        return parcelType;
    }

    public void setParcelType(String parcelType) {
        this.parcelType = parcelType;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Category getCategorii() {
        return categorii;
    }

    public void setCategorii(Category categorii) {
        this.categorii = categorii;
    }
}
