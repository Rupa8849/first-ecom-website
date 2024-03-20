/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.contactDetailRepository;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author dell
 */
public class contactDetailService {

    contactDetailRepository contactDetailRepository = new contactDetailRepository();

    public int insertContactusData(String fname, String lname, String email, 
                                    String subject, String message, Date msgDate) 
                                    throws SQLException, ClassNotFoundException {
        return contactDetailRepository.insertContactusData(fname, lname, email, subject, message, msgDate);
        
    }

}
