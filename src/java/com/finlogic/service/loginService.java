/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.loginRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class loginService {

    loginRepository loginRepository = new loginRepository();

    public ResultSet checkEmail(String email) throws SQLException, ClassNotFoundException {
        return loginRepository.checkEmail(email);
    }

    public int insertProfileData(
            String fname,
            String lname,
            String username,
            String email,
            String mobile,
            String address,
            String state,
            String city,
            String pincode
            ) throws SQLException, ClassNotFoundException {
        
        return loginRepository.insertProfileData(fname, lname, username, email, mobile, address, state, city, pincode);
    }
    
    public ResultSet viewUserData(String email) throws SQLException, ClassNotFoundException{
        return loginRepository.viewUserData(email);
    }
    
//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        loginService loginService = new loginService();
//        int result = loginService.checkEmail("rupachauhan8849@gmail.com");
//        System.out.println(result);
//    }
}
