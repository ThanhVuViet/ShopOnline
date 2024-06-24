/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Cart {
    int uID;
    int pID;
    int quantity;

    public Cart() {
    }

    public Cart(int uID, int pID, int quantity) {
        this.uID = uID;
        this.pID = pID;
        this.quantity = quantity;
    }

    public int getuID() {
        return uID;
    }

    public int getpID() {
        return pID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
}
