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
public class homeRepository {
    String url = "jdbc:mysql://localhost:3306/college_db";
    String username = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

    public ResultSet trendingNow() throws ClassNotFoundException, SQLException{
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement stmt = con.prepareStatement("select * from products where brand = 'lakme' AND category_id = 2001 limit 4");

        ResultSet rs = stmt.executeQuery();
        return rs;
    }
    
    public ResultSet topDeals() throws ClassNotFoundException, SQLException{
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement stmt = con.prepareStatement("select * from products where discount_in_pct > 50 AND brand = 'sugar' limit 4");

        ResultSet rs = stmt.executeQuery();
        return rs;
    }
    
    public ResultSet topBrands() throws ClassNotFoundException, SQLException{
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        
        PreparedStatement stmt = con.prepareStatement("select * from products where brand = 'nykaa' limit 4");

        ResultSet rs = stmt.executeQuery();
        return rs;
    }
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        homeRepository homeRepository1 = new homeRepository();
        ResultSet rs = homeRepository1.trendingNow();

        while (rs.next()) {
            System.out.println("name is : " + rs.getString("product_name"));
            System.out.println("od product id : " + rs.getInt("product_id"));
//            System.out.println("p. product name : " + rs.getString("product_name"));
            System.out.println("od product price : " + rs.getDouble("final_price"));
            
//
        }
    }
}
