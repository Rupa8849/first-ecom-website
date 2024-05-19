/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.userEventRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class userEventService {

    userEventRepository userEventRepository = new userEventRepository();

    public int addAddress(int userid, String address, String state, String city, int pincode) throws SQLException, ClassNotFoundException {
        return userEventRepository.addAddress(userid, address, state, city, pincode);
    }

    public ResultSet viewAddress(int userid) throws ClassNotFoundException, SQLException {
        return userEventRepository.viewAddress(userid);
    }

    public int updateOrder(int addressId, int userid) throws ClassNotFoundException, SQLException {
        return userEventRepository.updateOrder(addressId, userid);
    }

    public ResultSet viewUserOrders(int userid) throws ClassNotFoundException, SQLException {
        return userEventRepository.viewUserOrders(userid);
    }

    public ResultSet viewUserProfile(int userid) throws ClassNotFoundException, SQLException {
        return userEventRepository.viewUserProfile(userid);
    }

    public ResultSet viewUserAddress(int userid) throws ClassNotFoundException, SQLException {
        return userEventRepository.viewUserAddress(userid);
    }

    public int updateProfile(String fname, String lname, String email, String mobile, int userid) throws ClassNotFoundException, SQLException {
        return userEventRepository.updateProfile(fname, lname, email, mobile, userid);
    }

    public ResultSet showSuggestion(String pname) throws ClassNotFoundException, SQLException {
        return userEventRepository.showSuggestion(pname);
    }

    public ResultSet showUpdateAddressForm(int addressId) throws ClassNotFoundException, SQLException {
        return userEventRepository.showUpdateAddressForm(addressId);
    }

    public int updateAddress(String address, String state, String city, int pincode, int addressId) throws ClassNotFoundException, SQLException {
        return userEventRepository.updateAddress(address, state, city, pincode, addressId);
    }

    public int removeAddress(int addressId) throws ClassNotFoundException, SQLException {
        return userEventRepository.removeAddress(addressId);
    }
}
