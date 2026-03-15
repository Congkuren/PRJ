package models;

import java.sql.Date;

public class Student {

    private int userId;
    private String name;
    private Date dob;
    private String phone;
    private String email;

    public Student() {
    }

    public Student(int userId, String name, Date dob, String phone, String email) {
        this.userId = userId;
        this.name = name;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}