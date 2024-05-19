/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.repository;

import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;


/**
 *
 * @author dell
 */
public class contactDetailRepository {

    String url = "jdbc:mysql://localhost:3306/college_db";
    String username = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

    public int insertContactusData(String fname, String lname, String email, String subject, String message, Date msgDate) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("insert into contact (sender_fname, sender_lname, sender_email, subject, message, msg_date) values (?, ?, ?, ?, ?, ?);");

        stmt.setString(1, fname);
        stmt.setString(2, lname);
        stmt.setString(3, email);
        stmt.setString(4, subject);
        stmt.setString(5, message);
        
        Date currentDate = new Date();
        Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
        
        stmt.setTimestamp(6,currentTimestamp);

        return stmt.executeUpdate();

    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        contactDetailRepository contactDetailRepository1 = new contactDetailRepository();

        Date currentDate = new Date();
        Timestamp currentTimestamp = new Timestamp(currentDate.getTime());

        int data = contactDetailRepository1.insertContactusData("ram", "singh", "ramsingh889@gmail.com", "to know about product price for outside india", "hello, I'm ram.", new java.sql.Date(currentTimestamp.getTime()));

        if (data > 0) {
            System.out.println("Inserted");
        } else {
            System.out.println("error");
        }
    }

}
