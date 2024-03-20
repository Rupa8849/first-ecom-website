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
public class displayImageRepository {

    String url = "jdbc:mysql://localhost:3306/college_db";
    String user = "root";
    String password = "ruPa2000@";
    String dbDriver = "com.mysql.cj.jdbc.Driver";

    public ResultSet displayLipstics() throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        String query = "select * from products where category_id = 2001 or category_id = 2005 or category_id = 2006";
        PreparedStatement stmt = con.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }
    
    public ResultSet displayEyemakeups() throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        String query = "select * from products where category_id = 2002 or category_id = 2003 or category_id = 2010 or category_id = 2011";
        PreparedStatement stmt = con.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }
    
    public ResultSet displayFacemakeups() throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        String query = "select * from products where category_id = 2004 or category_id = 2007 or category_id = 2008 or category_id = 2009 or category_id = 2012 or category_id = 2013";
        PreparedStatement stmt = con.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }
    
    public ResultSet displayNailmakeups() throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        String query = "select * from products where category_id = 2014 or category_id = 2015";
        PreparedStatement stmt = con.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }
    
    public ResultSet displaySkincare() throws SQLException, ClassNotFoundException {
        Class.forName(dbDriver);

        Connection con = DriverManager.getConnection(url, user, password);
        String query = "select * from products where category_id = 2016 or category_id = 2017 or category_id = 2018 or category_id = 2019 or category_id = 2020 or category_id = 2021";
        PreparedStatement stmt = con.prepareStatement(query);

        ResultSet rs = stmt.executeQuery();
        return rs;
    }

    public static void main(String[] args) throws ClassNotFoundException {
        displayImageRepository displayImageRepository1 = new displayImageRepository();
        try {
            ResultSet rs = displayImageRepository1.displayFacemakeups();
            while (rs.next()) {
                System.out.println("name = " + rs.getString("product_name"));
            }
        } catch (SQLException ex) {
            System.out.println("Exception" + ex);
        }
    }
}
