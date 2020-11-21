package com.parceldelivery.Model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "all_time_table")
public class AllTimeTable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "session_number") // match wid db
    private int sessionNumber;

    @Column(name = "batch_number")
    private String batchNumber;

    @Column(name = "day")
    private String day;

    @Column(name = "time")
    private String time;

    @Column(name = "subject")
    private String subject;

    @Column(name = "lecturer")
    private String lecturer;

    @Column(name = "classroom")
    private String classroom;


    public AllTimeTable() {
    }

    public AllTimeTable(String batchNumber, String day, String time, String subject, String lecturer, String classroom,String sdate,String edate) {
        this.batchNumber = batchNumber;
        this.day = day;
        this.time = time;
        this.subject = subject;
        this.lecturer = lecturer;
        this.classroom = classroom;

    }

    public int getSessionNumber() {
        return sessionNumber;
    }

    public void setSessionNumber(int sessionNumber) {
        this.sessionNumber = sessionNumber;
    }

    public String getBatchNumber() {
        return batchNumber;
    }

    public void setBatchNumber(String batchNumber) {
        this.batchNumber = batchNumber;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getLecturer() {
        return lecturer;
    }

    public void setLecturer(String lecturer) {
        this.lecturer = lecturer;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }


}
