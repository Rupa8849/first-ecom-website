/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.repository;

//import com.mysql.cj.jdbc.Blob;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class adminEventsRepository {

    String url = "jdbc:mysql://localhost:3306/college_db";
    String user = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";
    Connection con;
    PreparedStatement stmt;

    public ResultSet viewProducts() {
        ResultSet rs = null;

        try {
            Class.forName(dbDriver);

            con = DriverManager.getConnection(url, user, password);
            String query = "select * from products";

            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Exception : " + ex.getMessage());
        }
        return rs;
    }

    public int addProducts(int pid, String pname, String brand, String description,
            Double price, int quantity, InputStream pimage, int cid, int discount,
            int sid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        con = DriverManager.getConnection(url, user, password);
        String query = "insert into products values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        stmt = con.prepareStatement(query);

        stmt.setInt(1, pid);
        stmt.setString(2, pname);
        stmt.setString(3, brand);
        stmt.setString(4, description);
        stmt.setDouble(5, price);
        stmt.setInt(6, quantity);
        stmt.setBlob(7, pimage);
        stmt.setInt(8, cid);
        stmt.setInt(9, discount);
        stmt.setInt(10, sid);

        double final_price = Math.round(price - ((price * discount) / 100));

        stmt.setDouble(11, final_price);

        return stmt.executeUpdate();
    }

    public int deleteItem(int pid) throws ClassNotFoundException, SQLException {
        int status = 0;
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "delete from products where product_id = ?";
            stmt = con.prepareStatement(query);

            stmt.setInt(1, pid);

            status = stmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Exception : " + ex.getMessage());
            con.close();
        }

        return status;
    }

    public ResultSet editItemForm(int pid) throws ClassNotFoundException, SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select * from products where product_id = ?";
            stmt = con.prepareStatement(query);

            stmt.setInt(1, pid);

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Exception : " + ex.getMessage());
            con.close();
        }
        return stmt.executeQuery();
    }

    public int updateProducts(String pname, String brand, String description,
            Double price, int quantity, InputStream pimage, int cid, int discount,
            int sid, int pid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        con = DriverManager.getConnection(url, user, password);
        String query = "update products set product_name = ?, brand = ?, description = ?, price = ?, quantity_in_stock = ?,\n"
                + "image = ?, category_id = ?, discount_in_pct = ?, shade_id = ?, final_price = ? where product_id = ?";

        stmt = con.prepareStatement(query);

        stmt.setString(1, pname);
        stmt.setString(2, brand);
        stmt.setString(3, description);
        stmt.setDouble(4, price);
        stmt.setInt(5, quantity);
        stmt.setBlob(6, pimage);
        stmt.setInt(7, cid);
        stmt.setInt(8, discount);
        stmt.setInt(9, sid);

        double final_price = Math.round(price - ((price * discount) / 100));

        stmt.setDouble(10, final_price);
        stmt.setInt(11, pid);

        return stmt.executeUpdate();
    }

    public ResultSet getAdminData(int id) throws ClassNotFoundException, SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select * from admin where admin_id = ?";
            stmt = con.prepareStatement(query);

            stmt.setInt(1, id);

        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Exception : " + ex.getMessage());
            con.close();
        }
        return stmt.executeQuery();
    }

    public ResultSet getAllOrderDetail() throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select distinct o.*, u.first_name, u.last_name from orders o join users u on o.user_id = u.user_id";

            stmt = con.prepareStatement(query);

        } catch (ClassNotFoundException | SQLException ex) {
//            con.close();
        }
        return stmt.executeQuery();
    }

    public ResultSet getPendingOrders() throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select distinct o.*, u.first_name, u.last_name from orders o join users u on o.user_id = u.user_id where order_status = 'pending';";

            stmt = con.prepareStatement(query);

        } catch (ClassNotFoundException | SQLException ex) {
            con.close();
        }
        return stmt.executeQuery();
    }

    public ResultSet getConfirmedOrders() throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select distinct o.*, u.first_name, u.last_name from orders o join users u on o.user_id = u.user_id where order_status = 'confirmed';";

            stmt = con.prepareStatement(query);

        } catch (ClassNotFoundException | SQLException ex) {
            con.close();
        }
        return stmt.executeQuery();
    }

    public ResultSet getTotalProduct() throws SQLException {
        ResultSet rs = null;
        int count = 0;
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select count(*) as 'total_products' from products";

            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();

            if (rs.next()) {
                count = rs.getInt("total_products");
                System.out.println("Total number of products: " + count);
            }
        } catch (ClassNotFoundException | SQLException ex) {
//            con.close();
        }
        return rs;
    }

    public ResultSet getUserList() throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select * from users";

            stmt = con.prepareStatement(query);

        } catch (ClassNotFoundException | SQLException ex) {
//            con.close();
        }
        return stmt.executeQuery();
    }

    public ResultSet getCategoryList() throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select * from categories";

            stmt = con.prepareStatement(query);

        } catch (ClassNotFoundException | SQLException ex) {
//            con.close();
        }
        return stmt.executeQuery();
    }

    public ResultSet editCategoryForm(int cid) throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select * from categories where category_id = ?";

            stmt = con.prepareStatement(query);
            stmt.setInt(1, cid);

        } catch (ClassNotFoundException | SQLException ex) {
//            con.close();
        }
        return stmt.executeQuery();
    }

    public int removeCategory(int cid) throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "delete from categories where category_id = ?";

            stmt = con.prepareStatement(query);
            stmt.setInt(1, cid);

        } catch (ClassNotFoundException | SQLException ex) {
            con.close();
        }
        return stmt.executeUpdate();
    }

    public int updateCategory(String cname, int cid) throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "update categories set category_name = ? where category_id = ?";

            stmt = con.prepareStatement(query);
            stmt.setString(1, cname);
            stmt.setInt(2, cid);

        } catch (ClassNotFoundException | SQLException ex) {
            con.close();
        }
        return stmt.executeUpdate();
    }

    public ResultSet getInquiryList() throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select * from contact";

            stmt = con.prepareStatement(query);

        } catch (ClassNotFoundException | SQLException ex) {
            con.close();
        }
        return stmt.executeQuery();
    }

    public ResultSet adminProfile(int adminid) throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "select * from admin where admin_id = ?";

            stmt = con.prepareStatement(query);
            stmt.setInt(1, adminid);

        } catch (ClassNotFoundException | SQLException ex) {
            con.close();
        }
        return stmt.executeQuery();
    }

    public int updateAdmin(String username, String pass, String fname, String lname, String email, String mobile, int adminid) throws SQLException {
        try {
            Class.forName(dbDriver);
            con = DriverManager.getConnection(url, user, password);
            String query = "update admin set username = ?, password = ?, first_name = ?, last_name = ?, email = ?, mobile_no = ? where admin_id = ?";

            stmt = con.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, pass);
            stmt.setString(3, fname);
            stmt.setString(4, lname);
            stmt.setString(5, email);
            stmt.setString(6, mobile);
            stmt.setInt(7, adminid);

        } catch (ClassNotFoundException | SQLException ex) {
            con.close();
        }
        return stmt.executeUpdate();
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        adminEventsRepository adminEventsRepository1 = new adminEventsRepository();

        int rs = adminEventsRepository1.updateAdmin("rupach", "rupa2000","rupa","chauhan","rupachauhan8849@gmail.com", "8954785696",1);
        System.out.println(rs);
//        while (rs.next()) {
//            System.out.println("total count : " + rs.getString("first_name"));
//            System.out.println("order id : " + rs.getInt("order_id"));
////            System.out.println("product name : " + rs.getString("first_name"));
////            System.out.println("user name : " + rs.getString("first_name"));
//
//        }
    }
}
