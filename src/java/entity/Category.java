package entity;

/**
 * Represents a Category entity.
 * 
 * @author Admin
 */
public class Category {
    private int cateID;
    private String cname;
    private String img;  // New attribute for image URL

    public Category() {
    }

    public Category(int cateID, String cname, String img) {
        this.cateID = cateID;
        this.cname = cname;
        this.img = img;
    }

    public int getCateID() {
        return cateID;
    }

    public String getCname() {
        return cname;
    }

    public String getImg() {
        return img;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
