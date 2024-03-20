/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.displayImageRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class displayImageService {
    displayImageRepository displayImageRepository = new displayImageRepository();
    
    public ResultSet displayLipstics() throws SQLException, ClassNotFoundException{
        return displayImageRepository.displayLipstics();
    }
    
    public ResultSet displayEyemakeups() throws SQLException, ClassNotFoundException{
        return displayImageRepository.displayEyemakeups();
    }
    
    public ResultSet displayFacemakeups() throws SQLException, ClassNotFoundException{
        return displayImageRepository.displayFacemakeups();
    }
    
    public ResultSet displayNailmakeups() throws SQLException, ClassNotFoundException{
        return displayImageRepository.displayNailmakeups();
    }
    
    public ResultSet displaySkincare() throws SQLException, ClassNotFoundException{
        return displayImageRepository.displaySkincare();
    }
    
    
//    public static void main(String[] args) throws ClassNotFoundException {
//        displayImageService displayImageService = new displayImageService();
//        try {
//            ResultSet rs = displayImageService.displayLipstics();
//            while (rs.next()) {
//                System.out.println("name = " + rs.getString("product_name"));
//            }
//        } catch (SQLException ex) {
//            System.out.println("Exception" + ex);
//        }
//    }

}
