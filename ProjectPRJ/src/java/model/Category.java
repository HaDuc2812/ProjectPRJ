/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HA DUC
 */
public class Category {
    private int cid;
    private String cname;
    private String cdescription;

    public Category() {
    }

    public Category(int cid, String cname, String cdescription) {
        this.cid = cid;
        this.cname = cname;
        this.cdescription = cdescription;
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

    public String getCdescription() {
        return cdescription;
    }

    public void setCdescription(String cdescription) {
        this.cdescription = cdescription;
    }

    @Override
    public String toString() {
        return "Category{" + "cid=" + cid + ", cname=" + cname + ", cdescription=" + cdescription + '}';
    }
    
}
