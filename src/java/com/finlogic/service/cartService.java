/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.cartRepository;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 *
 * @author dell
 */
public class cartService {

    cartRepository cartRepository = new cartRepository();

    public int insertCartData(int userid, int productid, int item_quantity, Date added_at) throws SQLException, ClassNotFoundException {
        return cartRepository.insertCartData(userid, productid, item_quantity, added_at);
    }

    public ResultSet getCartItem(int userid) throws ClassNotFoundException, SQLException {
        return cartRepository.getCartItem(userid);
    }

    public int increaseCartItem(int final_quantity, Date added_at, double final_price, int userid, int productid) throws SQLException, ClassNotFoundException {
        return cartRepository.increaseCartItem(final_quantity, added_at, final_price, userid, productid);
    }

    public int decreaseCartItem(int final_quantity, Date added_at, double final_price, int userid, int productid) throws SQLException, ClassNotFoundException {
        return cartRepository.decreaseCartItem(final_quantity, added_at, final_price, userid, productid);
    }

    public int removeCartItem(int userid, int productid) throws ClassNotFoundException, SQLException {
        return cartRepository.removeCartItem(userid, productid);
    }

    public int removeAllCartItems(int userid) throws ClassNotFoundException, SQLException {
        return cartRepository.removeAllCartItems(userid);
    }
}
