/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.adminLoginRepository;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class adminLoginService {

    adminLoginRepository adminLoginRepository = new adminLoginRepository();

    public int checkLoginDetails(String user, String pass) throws SQLException, ClassNotFoundException {
        return adminLoginRepository.checkLoginDetails(user, pass);
    }

    public int insertProduct(String name, InputStream image) throws SQLException, ClassNotFoundException {
        return adminLoginRepository.insertProduct(name, image);
    }

}
