/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author Admin
 */
public class Review {
     private int reviewId;
    private int productId;
    private int userId;
    private int rating;
    private String comment;
    private Date reviewDate;

    public Review(int reviewId, int productId, int userId, int rating, String comment, Date reviewDate) {
        this.reviewId = reviewId;
        this.productId = productId;
        this.userId = userId;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = reviewDate;
    }

    public Review() {
    }

    public int getReviewId() {
        return reviewId;
    }

    public int getProductId() {
        return productId;
    }

    public int getUserId() {
        return userId;
    }

    public int getRating() {
        return rating;
    }

    public String getComment() {
        return comment;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }
    
}
