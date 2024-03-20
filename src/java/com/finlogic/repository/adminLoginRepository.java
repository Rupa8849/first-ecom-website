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
public class adminLoginRepository {
    String url = "jdbc:mysql://localhost:3306/college_db";
    String username = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";
    
    public int checkLoginDetails(String user , String pass) throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, username, password);
        PreparedStatement stmt = con.prepareStatement("select admin_id from admin where username=? and password=?;");
        
        stmt.setString(1, user);
        stmt.setString(2, pass);

        int admin_id = 0;
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            admin_id = rs.getInt(1);
        }
        return 1;
    }
    
    public static void main(String []args) throws SQLException, ClassNotFoundException{
        adminLoginRepository ar = new adminLoginRepository();
        
        int result = ar.checkLoginDetails("rupach", "rupa8849");
        
        System.out.println(result);
    }
}
