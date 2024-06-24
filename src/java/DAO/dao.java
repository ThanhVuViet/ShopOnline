/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class dao extends MyDAO {

    public Account login(String user, String pass) {
        String query = "SELECT * FROM Account WHERE [email] = ? AND [pass] = ?";

        try {

            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                // Assuming that 'Account' class has a constructor that takes the necessary parameters
                return new Account(rs.getInt("uID"), rs.getString("username"),
                        rs.getString("pass"), rs.getBoolean("isAdmin"),
                        rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately in your application
        }

        return null;
    }

    public Account checkAccoutExist(String user) {
        String query = "SELECT * FROM Account\n"
                + "WHERE [username] = ?\n"; // Assuming 'user' corresponds to 'username'

        try {

            ps = con.prepareStatement(query);
            ps.setString(1, user);

            rs = ps.executeQuery();

            if (rs.next()) {
                // Assuming that 'Account' class has a constructor that takes the necessary parameters
                return new Account(rs.getInt("uID"), rs.getString("username"),
                        rs.getString("pass"), rs.getBoolean("isAdmin"),
                        rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately in your application
        }

        return null;
    }

    public void signup(String user, String pass, String email) {
        String query = "INSERT INTO Account(username, pass, isAdmin, email) VALUES (?, ?, 0, ?)";
        try {

            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, email);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately in your application
        }

    }

    public List<Account> getAllAccounts() {
        List<Account> accounts = new ArrayList<>();
        String query = "SELECT * FROM Account";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                // Assuming that 'Account' class has a constructor that takes the necessary parameters
                Account account = new Account(
                        rs.getInt("uID"),
                        rs.getString("username"),
                        rs.getString("pass"),
                        rs.getBoolean("isAdmin"),
                        rs.getString("email"));

                accounts.add(account);
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately in your application
        }

        return accounts;
    }

    public static void main(String[] args) {
        // Assuming you have an instance of your DatabaseHandler class

        // Assuming there is a method to establish a connection
        dao dao = new dao();

        // Assuming the method getProductByIndex is implemented in DatabaseHandler
        int indexPage = 1; // Replace with the desired page index
        List<Product> products = dao.getProductByIndex(indexPage);

        // Display the results
        if (products.isEmpty()) {
            System.out.println("No products found for page " + indexPage);
        } else {
            System.out.println("Products for page " + indexPage + ":");
            for (Product product : products) {
                System.out.println(product);
            }
        }

        // Assuming there is a method to close the connection
    }

    public void insertAccount(String user, String pass, String isSell,
            String isAdmin, String email) {
        String query = "insert Account([user], pass,isAdmin, email)\r\n"
                + "values(?,?,?,?,?)";
        try {

            ps = con.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setString(3, isAdmin);
            ps.setString(4, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Category> getCategory() {
        List<Category> categories = new ArrayList<>();
        xSql = "SELECT * FROM Category"; // Assuming "Category" is the table name
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            int cID;
            String cName;
            String img;  // Add the attribute for image URL
            Category category;
            while (rs.next()) {
                cID = rs.getInt("cateID");
                cName = rs.getString("cname");  // Corrected column name for category name
                img = rs.getString("cImg");  // Assuming there is a column named "img" for the image URL
                // Retrieve additional attributes for a Category if necessary

                category = new Category(cID, cName, img); // Create a new Category object
                // Set additional attributes of the Category object if necessary

                categories.add(category); // Add the Category object to the list
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE cateID = ?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }

        return list;
    }

    public List<Product> getTop8ProductsByHighestPrice() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 8 * FROM Product ORDER BY price DESC;";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getAllProducts() {
        List<Product> productList = new ArrayList<>();
        String query = "SELECT * FROM Product";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                productList.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }

        return productList;
    }

    public Product getProductById(int productId) {
        Product product = null;
        String query = "SELECT * FROM Product WHERE pID = ?";

        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, productId);
            rs = ps.executeQuery();

            if (rs.next()) {
                product = new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                );
            }
        } catch (Exception e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }

        return product;
    }

    public List<Product> getProductByName(String productName) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE pName LIKE ?";

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + productName + "%");  // Use LIKE to find partial matches
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }

        return list;
    }

    public int countAllProduct() {
        String query = "select count(*) from Product";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<Product> getProductByIndex(int indexPage) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product \r\n"
                + "order by [pID]\r\n"
                + "offset ? rows\r\n"
                + "fetch next 9 rows only";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, (indexPage - 1) * 9);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> searchPriceUnder100() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
                + "where price =395";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchPrice100to200() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
                + "WHERE price >= 100 AND price <= 200";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchPrice200to300() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
                + "WHERE price >= 200 AND price <= 300";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchPrice300to400() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
                + "WHERE price >= 300 AND price <= 400";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchPriceAbove400() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\r\n"
                + "WHERE price >= 400";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchXanhColor() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT *\n"
                + "FROM Product\n"
                + "WHERE color LIKE '%xanh%";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchTrangColor() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE color LIKE N'%Trắng%'";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchDenColor() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE color LIKE N'%Đen%'";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchXamColor() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE color LIKE N'%Xám%'";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchBeColor() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE color LIKE N'%Be%'";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchNauColor() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Product WHERE color LIKE N'%Nâu%'";
        try {

            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pID"),
                        rs.getString("pName"),
                        rs.getString("pImage"),
                        rs.getDouble("price"),
                        rs.getString("pDescription"),
                        rs.getString("cateID"),
                        rs.getString("size"),
                        rs.getString("color"),
                        rs.getString("pImage2"),
                        rs.getString("pImage3"),
                        rs.getString("pImage4")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Review getNewReview(int accountID, int productID) {
        String query = "SELECT TOP 1 review_id, product_id, user_id, rating, comment, review_date FROM reviews "
                + "WHERE user_id = ? AND product_id = ? "
                + "ORDER BY review_id DESC";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Review(
                        rs.getInt("review_id"),
                        rs.getInt("product_id"),
                        rs.getInt("user_id"),
                        rs.getInt("rating"),
                        rs.getString("comment"),
                        rs.getDate("review_date")
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertReview(int product_id, int user_id, String comment, Date review_Date) {
        String query = "INSERT INTO reviews (product_id, user_id, comment, review_date) VALUES (?, ?, ?, ?)";

        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, product_id);  // Corrected from product_id to productID
            ps.setInt(2, user_id);
            ps.setString(3, comment);
            ps.setDate(4, (java.sql.Date) review_Date);
            ps.executeUpdate();

            // Optionally, you may want to handle the generated keys here
        } catch (Exception e) {
            e.printStackTrace();  // Handle the exception appropriately
        }
    }

    public List<Invoice> getAllInvoices() {
        List<Invoice> invoiceList = new ArrayList<>();
        String query = "SELECT * FROM Invoice";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                invoiceList.add(new Invoice(
                        rs.getInt("iID"),
                        rs.getInt("uID"),
                        rs.getDouble("totalPrice"),
                        new Date(rs.getDate("sellDate").getTime())
                ));
            }
        } catch (Exception e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }
        return invoiceList;
    }

    public List<TotalSell> getTotalSpentList() {
        List<TotalSell> totalSellList = new ArrayList<>();
        String query = "SELECT * FROM TongChiTieuMuaHang ORDER BY totalSpent DES";

        try {
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                totalSellList.add(new TotalSell(
                        rs.getInt("uID"),
                        rs.getDouble("totalSpent")
                ));
            }
        } catch (Exception e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }
        return totalSellList;
    }

    public void addProduct(Product p) {
        xSql = "INSERT INTO Product (pName,pImage,price,pDescription,cateID,size,color,pImage2,pImage3,pImage4) values (?,?,?,?,?,?,?,?,?,?)";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, p.getpName());
            ps.setString(2, p.getpImage());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getpDescription());
            ps.setInt(5, Integer.parseInt(p.getCateID()));
            ps.setString(6, p.getSize());
            ps.setString(7, p.getColor());
            ps.setString(8, p.getpImage2());
            ps.setString(9, p.getpImage3());
            ps.setString(10, p.getpImage4());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product p) {
        xSql = "UPDATE Product SET pName=?, pImage=?, price=?, pDescription=?, cateID=?, size=?, color=?, pImage2=?, pImage3=?, pImage4=? where pID=?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setString(1, p.getpName());
            ps.setString(2, p.getpImage());
            ps.setDouble(3, p.getPrice());
            ps.setString(4, p.getpDescription());
            ps.setInt(5, Integer.parseInt(p.getCateID()));
            ps.setString(6, p.getSize());
            ps.setString(7, p.getColor());
            ps.setString(8, p.getpImage2());
            ps.setString(9, p.getpImage3());
            ps.setString(10, p.getpImage4());
            ps.setInt(11, p.getpID());
            ps.executeUpdate();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Review> getAllReviewByProductID(String productId) {
        List<Review> list = new ArrayList<>();
        String query = "select * from reviews\r\n"
                + "where [product_ID] =?";
        try {

            ps = con.prepareStatement(query);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(
                        rs.getInt("review_id"),
                        rs.getInt("product_id"),
                        rs.getInt("user_id"),
                        rs.getInt("rating"),
                        rs.getString("comment"),
                        rs.getDate("review_date")
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Cart checkCartExist(int accountID, int productID) {
        String query = "SELECT uID, pID, quantity FROM Cart WHERE uID = ? AND pID = ?";

        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            rs = ps.executeQuery();

            while (rs.next()) {
                return new Cart(
                        rs.getInt("uID"),
                        rs.getInt("pID"),
                        rs.getInt("quantity")
                );
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ
        }
        return null;
    }

    public void editAmountAndSizeCart(int uID, int pID, int quantity) {
        String query = "update Cart set [amount]=?,\r\n"
                + "[size]=?\r\n"
                + "where [accountID]=? and [productID]=?";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, uID);
            ps.setInt(2, pID);
            ps.setInt(3, quantity);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertCart(int accountID, int productID, int amount) {
        String query = "INSERT INTO Cart(uID, pID, quantity) VALUES (?, ?, ?)";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setInt(3, amount);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
      public void insertCart1(int accountID, int productID) {
        String query = "INSERT INTO Cart(uID, pID, quantity) VALUES (?, ?, 2)";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Cart> getCartByAccountID(int accountID) {
        List<Cart> list = new ArrayList<>();
        String query = "SELECT * FROM Cart WHERE uID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(
                        rs.getInt("uID"),
                        rs.getInt("pID"),
                        rs.getInt("quantity")
                ));
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ
        }
        return list;
    }

    public void editAmountCart(int accountID, int productID, int amount) {
        String query = "update Cart set [quantity]=?\r\n"
                + "where [uID]=? and [pID]=?";
        try {

            ps = con.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCart(int productID) {
        String query = "delete from Cart where pID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getCartCountWithUID(int uID) {
        int count = 0;
        String query = "SELECT COUNT(pID) AS count FROM Cart WHERE Cart.[uID] = ? GROUP BY [uID]";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, uID);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (Exception e) {
        }
        return count;
    }

    private void addInvoiceItems(List<Cart> cart) {
        for (Cart item : cart) {
            String query = "INSERT INTO InvoiceItems VALUES ((SELECT MAX(iID) FROM Invoice WHERE uID = ? GROUP BY uID), ?,?)";
            try {
                ps = con.prepareStatement(query);
                ps.setInt(1, item.getuID());
                ps.setInt(2, item.getpID());
                ps.setInt(3, item.getQuantity());
                ps.executeUpdate();
            } catch (Exception e) {
            }
        }
    }
    
    private void deleteCartOfAccount(int uID) {
        String query = "DELETE FROM Cart WHERE uID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, uID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void addInvoice(int uID, List<Cart> cart, java.sql.Date sellDate) {
        String query = "INSERT INTO Invoice([uID], sellDate) VALUES (?, ?)";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, uID);
            ps.setDate(2, sellDate);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        this.addInvoiceItems(cart);
        this.deleteCartOfAccount(uID);
    }

    public Invoice getInvoice(int iID) {
        Invoice invoice = null;
        String query = "SELECT * FROM Invoice WHERE iID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, iID);
            rs = ps.executeQuery();
            if (rs.next()) {
                invoice = new Invoice(
                        rs.getInt("iID"),
                        rs.getInt("uID"),
                        (double)rs.getFloat("totalPrice"),
                        new Date(rs.getDate("sellDate").getTime())
                );
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ
        }
        return invoice;
    }
    
    public List<InvoiceItems> getInvoiceItems(int iID) {
        List<InvoiceItems> list = new ArrayList<>();
        String query = "SELECT * FROM InvoiceItems WHERE iID = ?";
        try {
            ps = con.prepareStatement(query);
            ps.setInt(1, iID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new InvoiceItems(
                        rs.getInt("iID"),
                        rs.getInt("pID"),
                        rs.getInt("quantity")
                ));
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ
        }
        return list;
    }
    
}
