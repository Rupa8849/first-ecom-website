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
public class productDetailsRepository {

    String url = "jdbc:mysql://localhost:3306/college_db";
    String user = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

    public ResultSet getProductDetails(int id) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        String query = "select p.product_id, p.product_name, p.image, p.price, p.final_price, \n"
                + "p.discount_in_pct, p.description, s.shade_id, s.shade_name as 'shade_name' from products p join shades s \n"
                + "on p.shade_id = s.shade_id where p.product_id = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        return rs;
    }
    
    public ResultSet getBrandProducts(String brand) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        String query = "select p.product_id, p.product_name, p.image, p.price, p.final_price, \n"
                + "p.discount_in_pct, p.description, s.shade_id, s.shade_name as 'shade_name' from products p join shades s \n"
                + "on p.shade_id = s.shade_id where p.brand = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setString(1, brand);
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        productDetailsRepository productDetailsRepository = new productDetailsRepository();
        int id = 1420;
        try {
            ResultSet rs = productDetailsRepository.getBrandProducts("lakme");
            while (rs.next()) {
                System.out.println("product name = " + rs.getString("product_name"));
            }
        } catch (SQLException ex) {
            System.out.println("Exception" + ex);
        }
    }
}

       