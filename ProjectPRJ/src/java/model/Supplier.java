/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HA DUC
 */
public class Supplier {
//     supplier_id INT PRIMARY KEY IDENTITY(1,1),
//    name VARCHAR(255) NOT NULL,
//    contact_person VARCHAR(255),
//    phone VARCHAR(20),
//    email VARCHAR(255),
//    address TEXT
    private String sid;
    private String sname;
    private String contact_person;
    private String phone;
    private String email;
    private String address;

    public Supplier() {
    }

    public Supplier(String sid, String sname, String contact_person, String phone, String email, String address) {
        this.sid = sid;
        this.sname = sname;
        this.contact_person = contact_person;
        this.phone = phone;
        this.email = email;
        this.address = address;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getContact_person() {
        return contact_person;
    }

    public void setContact_person(String contact_person) {
        this.contact_person = contact_person;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}
