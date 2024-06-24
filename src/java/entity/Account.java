/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Admin
 */
public class Account {
    /*CREATE TABLE Account (
    [uID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    username NVARCHAR(10) NULL,
    pass NVARCHAR(10) NULL,
    isAdmin BIT NULL,
    email NVARCHAR(50) NULL */
    int id;
    String userName;
    String pass;
    boolean isAdmin;
    String email;

    public Account() {
    }

    public Account(int id, String userName, String pass, boolean isAdmin, String email) {
        this.id = id;
        this.userName = userName;
        this.pass = pass;
        this.isAdmin = isAdmin;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public String getUserName() {
        return userName;
    }

    public String getPass() {
        return pass;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public String getEmail() {
        return email;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    


}
