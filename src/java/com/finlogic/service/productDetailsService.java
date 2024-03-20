/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.productDetailsRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class productDetailsService {

    productDetailsRepository productDetailsRepository = new productDetailsRepository();

    public ResultSet getProductDetails(int id) throws SQLException, ClassNotFoundException {
        return productDetailsRepository.getProductDetails(id);
    }

    public ResultSet getBrandProducts(String brand) throws SQLException, ClassNotFoundException {
        return productDetailsRepository.getBrandProducts(brand);
    }

    public static void main(String[] args) throws ClassNotFoundException {
        productDetailsService productDetailsService = new productDetailsService();
        int id = 1023;
        try {
            ResultSet rs = productDetailsService.getProductDetails(id);
            while (rs.next()) {
                System.out.println("name = " + rs.getString("shade_name"));
            }
        } catch (SQLException ex) {
            System.out.println("Exception" + ex);
        }
    }
}
