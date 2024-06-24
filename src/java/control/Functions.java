/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package control;

import entity.*;
import java.util.List;

/**
 *
 * @author MyPC
 */
public class Functions {

    public Account getAccountWithID(List<Account> accountList, int uID) {
        for (Account account: accountList) {
            if (account.getId() == uID) {
                return account;
            }
        }
        return null;
    }
    
    public Product getProductWithID(List<Product> productList, int pID) {
        for (Product product: productList) {
            if (product.getpID() == pID) {
                return product;
            }
        }
        return null;
    }
    
    public Category getCategoryWithID(List<Category> categoryList, int cateID) {
        for (Category category: categoryList) {
            if (category.getCateID() == cateID) {
                return category;
            }
        }
        return null;
    }
}
