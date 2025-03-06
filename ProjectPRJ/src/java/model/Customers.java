/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author HA DUC
 */
public class Customers {
//     customer_id INT PRIMARY KEY IDENTITY(1,1),
//    name VARCHAR(255) NOT NULL,
//    email VARCHAR(255) UNIQUE NOT NULL,
//    password_hash VARCHAR(255) NOT NULL,
//    phone VARCHAR(20),
//    address TEXT,
//    created_at DATETIME DEFAULT GETDATE()
    private int cid;
    private String cname;
    private String email;
    private String password;
    private String phone;
    private String address;
    private Date date;

    public Customers() {
    }

    public Customers(int cid, String cname, String email, String password, String phone, String address, Date date) {
        this.cid = cid;
        this.cname = cname;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.date = date;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
