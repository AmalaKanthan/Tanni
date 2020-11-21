package com.parceldelivery.Model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Table(name = "batch_details")
public class Batch {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_batch_details")
    private int idBatchDetails;

    @Column(name = "batch_name")
    private String batchName;

    @Column(name = "lecturer_email")
    private String lecturer_email;

    public int getIdBatchDetails() {
        return idBatchDetails;
    }

    public void setIdBatchDetails(int idBatchDetails) {
        this.idBatchDetails = idBatchDetails;
    }

    public String getBatchName() {
        return batchName;
    }

    public void setBatchName(String batchName) {
        this.batchName = batchName;
    }

    public String getLecturerEmail() {
        return lecturer_email;
    }

    public void setLecturerEmail(String lecturer_email) {
        this.lecturer_email = lecturer_email;
    }
}
