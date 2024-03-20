/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.repository;

import com.mysql.cj.jdbc.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class adminEventsService {

    adminEventsRepository adminRepository = new adminEventsRepository();

    public ResultSet viewProducts() throws ClassNotFoundException, SQLException {
        return adminRepository.viewProducts();
    }

    public int deleteItem(int pid) throws ClassNotFoundException, SQLException {
        return adminRepository.deleteItem(pid);
    }

    public ResultSet editItemForm(int pid) throws ClassNotFoundException, SQLException {
        return adminRepository.editItemForm(pid);
    }

    public ResultSet getAdminData(int id) throws ClassNotFoundException, SQLException {
        return adminRepository.getAdminData(id);
    }

//        public int addProducts(int pid, String pname, String brand, String description, Double price, int quantity,
//            Blob image, int cid, double discount, int sid, double final_price) {
//            return adminRepository.addProducts(pid, pname, brand, description, price,
//                                    quantity, image, cid, discount, sid, final_price);
//        }
    }
