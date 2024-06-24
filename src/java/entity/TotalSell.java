/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author MyPC
 */
public class TotalSell {
    private int uID;
    private double totalSpent;

    public TotalSell(int uID, double totalSpent) {
        this.uID = uID;
        this.totalSpent = totalSpent;
    }

    public int getuID() {
        return uID;
    }

    public double getTotalSpent() {
        return totalSpent;
    }
    
    
}
