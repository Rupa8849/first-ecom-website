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
public class categoryRepository {

    String url = "jdbc:mysql://localhost:3306/college_db";
    String user = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

    public ResultSet displaySingleCategory(int cid) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        String query = "select p.*, c.category_name from products p join categories c \n"
                + "on c.category_id = p.category_id where p.category_id = ?";
        PreparedStatement stmt = con.prepareStatement(query);

        stmt.setInt(1, cid);
        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        categoryRepository categoryRepository1 = new categoryRepository();
        try {
            ResultSet rs = categoryRepository1.displaySingleCategory(2001);
            while (rs.next()) {
                System.out.println("id = " + rs.getInt("product_id"));
                System.out.println("cname = " + rs.getString("category_name"));
            }
        } catch (SQLException ex) {
            System.out.println("Exception" + ex);
        }
    }
}
