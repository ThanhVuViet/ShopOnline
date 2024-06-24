/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author MyPC
 */
public class Invoice {
    private int iID;
    private int uID;
    private double totalPrice;
    private Date date;

    
    public Invoice(int uID, float totalPrice, Date date) {
        this.uID = uID;
        this.totalPrice = totalPrice;
        this.date = date;
    }

    public Invoice(int iID, int uID, double totalPrice, Date date) {
        this.iID = iID;
        this.uID = uID;
        this.totalPrice = totalPrice;
        this.date = date;
        
    }

    public int getiID() {
        return iID;
    }

    public void setiID(int iID) {
        this.iID = iID;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    
    
}
