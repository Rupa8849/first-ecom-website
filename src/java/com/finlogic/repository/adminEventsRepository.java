/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.repository;


//import com.mysql.cj.jdbc.Blob;
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
//            try {
//                con.close();
//            } catch (SQLException ex1) {
//                System.out.println("Exception : " + ex.getMessage());
//            }
            System.out.println("Exception : " + ex.getMessage());
        }
        return rs;
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

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        adminEventsRepository adminEventsRepository1 = new adminEventsRepository();
        ResultSet rs = adminEventsRepository1.viewProducts();

        while (rs.next()) {
            System.out.println("name : " + rs.getString("product_name"));
        }
    }
}
