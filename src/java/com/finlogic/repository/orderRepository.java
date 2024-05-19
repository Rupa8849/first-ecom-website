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
import java.util.UUID;

/**
 *
 * @author dell
 */
public class orderRepository {

    String url = "jdbc:mysql://localhost:3306/college_db";
    String username = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

    public int insertIntoOrder(int userid, int totalQuantity, Double totalPrice) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);

        // Execute summation query to calculate total quantity and total price
        PreparedStatement checkStmt = con.prepareStatement("SELECT c.product_id, c.user_id, \n"
                + " a.address_id as 'address_id', a.address, a.state, a.city, a.pincode \n"
                + " from cart c join users u on c.user_id = u.user_id \n"
                + " join address a on u.user_id = a.user_id where u.user_id = ?");
        checkStmt.setInt(1, userid);
        ResultSet rs = checkStmt.executeQuery();

        int address_id = 0;

        while (rs.next()) {
            address_id = rs.getInt("address_id");
        }

// Prepare and execute insertion query
        PreparedStatement stmt = con.prepareStatement("INSERT INTO orders \n"
                + "(order_id, user_id, total_quantity, total_price, order_date) \n"
                + "VALUES (?, ?, ?, ?, ?)");

// Generate order ID
        UUID uuid = UUID.randomUUID();
        int orderId = uuid.hashCode();
        orderId = Math.abs(orderId);

// Set parameters for the insertion query
        stmt.setInt(1, orderId);
        stmt.setInt(2, userid);
        stmt.setInt(3, totalQuantity);
        stmt.setDouble(4, totalPrice);

        Date currentDate = new Date();
        Timestamp currentTimestamp = new Timestamp(currentDate.getTime());

        stmt.setTimestamp(5, currentTimestamp);

// Execute insertion query
        int status = stmt.executeUpdate();

// Close resources
        rs.close();

        stmt.close();

        con.close();

        return status;

    }

    public int insertIntoOrderDetails(int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement checkStmt = con.prepareStatement("select c.product_id, c.user_id, c.item_quantity, c.total_cart_price, o.order_id from \n"
                + "cart c join orders o on c.user_id = o.user_id where c.user_id = ?");
        checkStmt.setInt(1, userid);

        ResultSet rs = checkStmt.executeQuery();

        PreparedStatement stmt = con.prepareStatement("INSERT INTO orderDetails \n"
                + "(order_id, product_id, qntty, total_price) VALUES (?, ?, ?, ?)");

        int status = 0;

        while (rs.next()) {

            int orderId = rs.getInt("order_id");
            int productId = rs.getInt("product_id");
            int total_qntt = rs.getInt("item_quantity");
            double total_price = rs.getDouble("total_cart_price");

            stmt.setInt(1, orderId);
            stmt.setInt(2, productId);
            stmt.setInt(3, total_qntt);
            stmt.setDouble(4, total_price);

            status = stmt.executeUpdate();
        }
        return status;
    }

    public ResultSet getOrderItems(int userid) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement stmt = con.prepareStatement("select od.orderDetail_id, od.order_id, od.product_id, od.qntty as 'odqntt', \n"
                + "o.user_id, o.total_price, o.order_status, o.total_quantity, \n"
                + "p.product_name, p.image, p.final_price from orderDetails od join orders o on od.order_id = o.order_id \n"
                + "join products p on od.product_id = p.product_id \n"
                + "where o.user_id = ? AND o.order_status = 'pending';");

        stmt.setInt(1, userid);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        orderRepository orderRepository1 = new orderRepository();

        Date currentDate = new Date();
//        Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
//        int status = orderRepository1.insertIntoOrderDetails(2);
//        System.out.println("Status : " + status);

        ResultSet rs = orderRepository1.getOrderItems(4);

        while (rs.next()) {
//            System.out.println("name is : " + rs.getString("product_name"));
            System.out.println("od id : " + rs.getInt("orderDetail_id"));
            System.out.println("od.orderid : " + rs.getInt("order_id"));
            System.out.println("od product id : " + rs.getInt("product_id"));
            System.out.println("p. product name : " + rs.getString("product_name"));
            System.out.println("od product price : " + rs.getDouble("final_price"));
            System.out.println("o. user_id : " + rs.getDouble("user_id"));
//            System.out.println("total : " + rs.getDouble("total_price"));
            System.out.println("status : " + rs.getString("order_status"));
//
        }
    }
}
