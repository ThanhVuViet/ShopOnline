/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author
 */
public class Product {

    private int pID;
    private String pName;
    private String pImage;
    private double price;

    private String pDescription;
    private String cateID;
    private String size;
    private String color;
    private String pImage2;
    private String pImage3;
    private String pImage4;

    public Product(int pID, String pName, String pImage, double price, String pDescription, String cateID, String size, String color, String pImage2, String pImage3, String pImage4) {
        this.pID = pID;
        this.pName = pName;
        this.pImage = pImage;
        this.price = price;
        this.pDescription = pDescription;
        this.cateID = cateID;
        this.size = size;
        this.color = color;
        this.pImage2 = pImage2;
        this.pImage3 = pImage3;
        this.pImage4 = pImage4;
    }
    
    public Product(String pName, String pImage, double price, String pDescription, String cateID, String size, String color, String pImage2, String pImage3, String pImage4) {
        this.pName = pName;
        this.pImage = pImage;
        this.price = price;
        this.pDescription = pDescription;
        this.cateID = cateID;
        this.size = size;
        this.color = color;
        this.pImage2 = pImage2;
        this.pImage3 = pImage3;
        this.pImage4 = pImage4;
    }
    
    public int getpID() {
        return pID;
    }

    public String getpName() {
        return pName;
    }

    public String getpImage() {
        return pImage;
    }

    public double getPrice() {
        return price;
    }

    public String getpDescription() {
        return pDescription;
    }

    public String getCateID() {
        return cateID;
    }

    public String getSize() {
        return size;
    }

    public String getColor() {
        return color;
    }

    public String getpImage2() {
        return pImage2;
    }

    public String getpImage3() {
        return pImage3;
    }

    public String getpImage4() {
        return pImage4;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setpDescription(String pDescription) {
        this.pDescription = pDescription;
    }

    public void setCateID(String cateID) {
        this.cateID = cateID;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public void setpImage2(String pImage2) {
        this.pImage2 = pImage2;
    }

    public void setpImage3(String pImage3) {
        this.pImage3 = pImage3;
    }

    public void setpImage4(String pImage4) {
        this.pImage4 = pImage4;
    }

}
