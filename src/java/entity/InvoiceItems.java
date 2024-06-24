/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class InvoiceItems {
    int iID;
    int pID;
    int quantity;

    public InvoiceItems() {
    }

    public InvoiceItems(int iID, int pID, int quantity) {
        this.iID = iID;
        this.pID = pID;
        this.quantity = quantity;
    }

    public int getiID() {
        return iID;
    }

    public int getpID() {
        return pID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setiID(int iID) {
        this.iID = iID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
