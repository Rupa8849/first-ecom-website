/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author dell
 */
public class cartRepository {
    
    String url = "jdbc:mysql://localhost:3306/college_db";
    String username = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";
    
    public int insertCartData(int userid, int productid, int item_quantity, Date added_at) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);
        
        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement checkStmt = con.prepareStatement("SELECT * FROM cart WHERE user_id = ? AND product_id = ?");
        checkStmt.setInt(1, userid);
        checkStmt.setInt(2, productid);
        ResultSet rs = checkStmt.executeQuery();
        
        if (rs.next()) {
            // If the product exists in the cart, update its quantity and total price
            int currentQuantity = rs.getInt("item_quantity");
            int newQuantity = currentQuantity + item_quantity;
            
            Date currentDate = new Date();
            Timestamp currentTimestamp = new Timestamp(currentDate.getTime());

            // Calculate total price with updated quantity
            PreparedStatement priceStmt = con.prepareStatement("SELECT final_price FROM products WHERE product_id = ?");
            priceStmt.setInt(1, productid);
            
            ResultSet priceRs = priceStmt.executeQuery();
            
            double totalPrice = 0;
            
            if (priceRs.next()) {
                double price = priceRs.getDouble("final_price");
                totalPrice = price * newQuantity;
                System.out.println("total price : " + totalPrice);
            }
            
            PreparedStatement updateStmt = con.prepareStatement("UPDATE cart SET item_quantity = ?, added_at = ?, total_cart_price = ? WHERE user_id = ? AND product_id = ?");
            updateStmt.setInt(1, newQuantity);
            updateStmt.setTimestamp(2, currentTimestamp);
            updateStmt.setDouble(3, totalPrice);
            updateStmt.setInt(4, userid);
            updateStmt.setInt(5, productid);
            return updateStmt.executeUpdate();
            
        } else {
            // If the product doesn't exist in the cart, insert a new row
            // Calculate total price
            PreparedStatement priceStmt = con.prepareStatement("SELECT final_price FROM products WHERE product_id = ?");
            priceStmt.setInt(1, productid);
            ResultSet priceRs = priceStmt.executeQuery();
            double totalPrice = 0;
            if (priceRs.next()) {
                double price = priceRs.getDouble("final_price");
                totalPrice = price * item_quantity;
            }
            
            PreparedStatement insertStmt = con.prepareStatement("INSERT INTO cart (user_id, product_id, item_quantity, added_at, total_cart_price) VALUES (?, ?, ?, ?, ?)");
            insertStmt.setInt(1, userid);
            insertStmt.setInt(2, productid);
            insertStmt.setInt(3, item_quantity);
            
            Date currentDate = new Date();
            Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
            
            insertStmt.setTimestamp(4, currentTimestamp);
            insertStmt.setDouble(5, totalPrice);
            
            return insertStmt.executeUpdate();
        }
    }
    
    public ResultSet getCartItem(int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);
        
        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select p.product_name as 'product_name', p.image, p.final_price, \n"
                + "p.product_id, p.shade_id, c.item_quantity, sum(c.item_quantity) as 'total_quantity', c.added_at, u.user_id from  cart c join products p \n"
                + "on c.product_id = p.product_id join users u on c.user_id = u.user_id where u.user_id = ? GROUP BY \n" +
"    p.product_id, c.item_quantity;");
        
        stmt.setInt(1, userid);
        ResultSet rs = stmt.executeQuery();
        
        return rs;
    }
    
    public int increaseCartItem(int final_quantity, Date added_at, double final_price, int userid, int productid) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);
        
        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement stmt = con.prepareStatement("UPDATE cart set item_quantity = ? , added_at = ?, total_cart_price = ? WHERE user_id = ? AND product_id = ?");
        
        Date currentDate = new Date();
        Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
        
        stmt.setInt(1, final_quantity);
        stmt.setTimestamp(2, currentTimestamp);
        stmt.setDouble(3, final_price);
        stmt.setInt(4, userid);
        stmt.setInt(5, productid);
        
        return stmt.executeUpdate();
    }
    
    public int decreaseCartItem(int final_quantity, Date added_at, double final_price, int userid, int productid) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);
        
        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement stmt = con.prepareStatement("UPDATE cart set item_quantity = ? , added_at = ?, total_cart_price = ? WHERE user_id = ? AND product_id = ?");
        
        Date currentDate = new Date();
        Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
        
        stmt.setInt(1, final_quantity);
        stmt.setTimestamp(2, currentTimestamp);
        stmt.setDouble(3, final_price);
        stmt.setInt(4, userid);
        stmt.setInt(5, productid);
        
        return stmt.executeUpdate();
    }
    
    public int removeCartItem(int userid, int productid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);
        
        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement stmt = con.prepareStatement("delete from cart where user_id = ? AND product_id = ?");
        
        stmt.setInt(1, userid);
        stmt.setInt(2, productid);
        
        return stmt.executeUpdate();
    }
    
    public int removeAllCartItems(int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);
        
        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement stmt = con.prepareStatement("delete from cart where user_id = ?");
        
        stmt.setInt(1, userid);
        
        return stmt.executeUpdate();
    }
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        cartRepository cartRepository1 = new cartRepository();
        
//        Date currentDate = new Date();
//        Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
//        
//        int status = cartRepository1.removeCartItem(1, 1050);
//        System.out.println(status);
        ResultSet rs = cartRepository1.getCartItem(2);
        while (rs.next()) {
            System.out.println("pid : " + rs.getString("product_name"));
        }
    }
    
}
