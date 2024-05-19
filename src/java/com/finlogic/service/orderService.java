/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.orderRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class orderService {

    orderRepository orderRepository = new orderRepository();

    public int insertIntoOrder(int userid, int totalQuantity, Double totalPrice) throws SQLException, ClassNotFoundException {
        return orderRepository.insertIntoOrder(userid, totalQuantity, totalPrice);
    }

    public int insertIntoOrderDetails(int userid) throws ClassNotFoundException, SQLException {
        return orderRepository.insertIntoOrderDetails(userid);
    }

    public ResultSet getOrderItems(int userid) throws SQLException, ClassNotFoundException {
        return orderRepository.getOrderItems(userid);
    }
}
