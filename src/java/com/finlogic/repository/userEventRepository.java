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

/**
 *
 * @author dell
 */
public class userEventRepository {

    String url = "jdbc:mysql://localhost:3306/college_db";
    String username = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

    public int addAddress(int userid, String address, String state, String city, int pincode) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("insert into address (user_id, address, state, city, pincode) \n"
                + "values (?, ?, ?, ?, ?)");
        stmt.setInt(1, userid);
        stmt.setString(2, address);
        stmt.setString(3, state);
        stmt.setString(4, city);
        stmt.setInt(5, pincode);

        return stmt.executeUpdate();
    }

    public ResultSet viewAddress(int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select u.user_id, u.first_name, u.last_name, u.mobile_no, \n"
                + "a.address_id, a.address, a.state, a.city, a.pincode from users u join address a on \n"
                + "u.user_id = a.user_id where u.user_id = ?");

        stmt.setInt(1, userid);

        return stmt.executeQuery();
    }

    public int updateOrder(int addressId, int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
//        PreparedStatement getStmt = con.prepareStatement("");

        PreparedStatement stmt = con.prepareStatement("update orders SET address_id = ?, order_status = 'confirmed' \n"
                + "where user_id = ?");
        stmt.setInt(1, addressId);
        stmt.setInt(2, userid);

        return stmt.executeUpdate();
    }

    public ResultSet viewUserOrders(int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select od.*, p.*, o.* \n"
                + "from orderDetails od join products p on od.product_id = p.product_id \n"
                + " join orders o on o.order_id = od.order_id where o.user_id = ?");

        stmt.setInt(1, userid);
        return stmt.executeQuery();
    }

    public ResultSet viewUserProfile(int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select * from users where user_id = ?");

        stmt.setInt(1, userid);
        return stmt.executeQuery();

    }

    public ResultSet viewUserAddress(int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select * from address where user_id = ?");

        stmt.setInt(1, userid);
        return stmt.executeQuery();

    }

    public int updateProfile(String fname, String lname, String email, String mobile, int userid) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("update users set first_name = ?, last_name = ?, email = ?, mobile_no = ? where user_id = ?");

        stmt.setString(1, fname);
        stmt.setString(2, lname);
        stmt.setString(3, email);
        stmt.setString(4, mobile);
        stmt.setInt(5, userid);
        return stmt.executeUpdate();
    }

    public ResultSet showSuggestion(String pname) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select product_id, product_name from products where product_name like ? ");

        stmt.setString(1, pname + "%");

        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet searchItemByName(String pname) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select * from products where product_name = ? ");

        stmt.setString(1, pname);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public ResultSet showUpdateAddressForm(int addressId) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select * from address where address_id = ? ");

        stmt.setInt(1, addressId);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public int updateAddress(String address, String state, String city, int pincode, int addressId) throws ClassNotFoundException, SQLException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("update address set address = ?, state = ?, city = ?, pincode = ? where address_id = ?");

        stmt.setString(1, address);
        stmt.setString(2, state);
        stmt.setString(3, city);
        stmt.setInt(4, pincode);
        stmt.setInt(5, addressId);

        return stmt.executeUpdate();
    }
    
    public int removeAddress(int addressId) throws ClassNotFoundException, SQLException{
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
//        PreparedStatement getStmt = con.prepareStatement("");

        PreparedStatement stmt = con.prepareStatement("delete from address where address_id = ?");
        stmt.setInt(1, addressId);

        return stmt.executeUpdate();
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        userEventRepository userEventRepository = new userEventRepository();

//        int status = userEventRepository.updateProfile("rupal","chauhan","rupal4455@gmail.com","8541236589",1);
//        System.out.println("Status : " + status);
        ResultSet rs = userEventRepository.searchItemByName("Nykaa GLAMOReyes Coloured Liquid Eyeliner - 02 Chaotic Calypso");

        while (rs.next()) {

            System.out.println("pname is : " + rs.getString("product_name"));
            System.out.println("id : " + rs.getInt("product_id"));
//            System.out.println("address : " + rs.getString("address"));

        }
    }
}
