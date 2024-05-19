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
public class loginRepository {

    String url = "jdbc:mysql://localhost:3306/college_db";
    String user = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

//    public int checkEmail(String email) throws SQLException, ClassNotFoundException {
//        Class.forName(dbDriver);
//        
//        Connection con = DriverManager.getConnection(url, user, password);
//        PreparedStatement stmt = con.prepareStatement("select user_id from users where email = ? ");
//        
//        int status = 0;
//        try{
//            
//            stmt.setString(1, email);
//            ResultSet rs = stmt.executeQuery();
//            
//            if(rs.next()){
//                status = rs.getInt(1);
//            }
//        } catch(Exception ex){
//            System.out.println("Exception : " + ex.getMessage());
//        }
//        
//        return status;
//    }
    public ResultSet checkEmail(String email) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("select * from users where email = ? ");
        ResultSet rs = null;
        try {
            stmt.setString(1, email);
            rs = stmt.executeQuery();

        } catch (SQLException ex) {
            System.out.println("Exception : " + ex.getMessage());
            con.close();
        }

        return rs;
    }

    public int insertProfileData(String fname,String lname, String email,String mobile) throws SQLException, ClassNotFoundException {

        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("insert into users "
                + "(first_name, last_name, email, mobile_no) values(?, ?, ?, ?)");

        stmt.setString(1, fname);
        stmt.setString(2, lname);
        stmt.setString(3, email);
        stmt.setString(4, mobile);
        
        int status = 0;
        try {
            status = stmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Exception" + e.getMessage());
            con.close();
        }
        return status;
    }

    public ResultSet viewUserData(String email) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        PreparedStatement stmt = con.prepareStatement("select * from users where email = ?");

        stmt.setString(1, email);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }

   
//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        loginRepository loginRepository1 = new loginRepository();
//        ResultSet rs = loginRepository1.showSuggestion("rit");
////        System.out.println(rs);
//        while (rs.next()) {
//            System.out.println("user Name = " + rs.getString("username"));
//
//        }
//    }
}
