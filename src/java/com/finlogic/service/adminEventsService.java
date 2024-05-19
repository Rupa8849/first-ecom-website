/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.adminEventsRepository;
import com.mysql.cj.jdbc.Blob;
import java.io.InputStream;
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

    public int addProducts(int pid, String pname, String brand, String description,
            Double price, int quantity, InputStream pimage, int cid, int discount,
            int sid) throws ClassNotFoundException, SQLException {

        return adminRepository.addProducts(pid, pname, brand, description, price, quantity, pimage, cid, discount, sid);
    }

    public ResultSet editItemForm(int pid) throws ClassNotFoundException, SQLException {
        return adminRepository.editItemForm(pid);
    }

    public int updateProducts(String pname, String brand, String description,
            Double price, int quantity, InputStream pimage, int cid, int discount,
            int sid, int pid) throws ClassNotFoundException, SQLException {
        return adminRepository.updateProducts(pname, brand, description, price, quantity, pimage, cid, discount, sid, pid);
    }

    public ResultSet getAdminData(int id) throws ClassNotFoundException, SQLException {
        return adminRepository.getAdminData(id);
    }

    public ResultSet getPendingOrders() throws SQLException {
        return adminRepository.getPendingOrders();
    }

    public ResultSet getConfirmedOrders() throws SQLException {
        return adminRepository.getConfirmedOrders();
    }

    public ResultSet getAllOrderDetail() throws SQLException {
        return adminRepository.getAllOrderDetail();
    }

    public ResultSet getTotalProduct() throws SQLException {
        return adminRepository.getTotalProduct();
    }

    public ResultSet getUserList() throws SQLException {
        return adminRepository.getUserList();
    }

    public ResultSet getCategoryList() throws SQLException {
        return adminRepository.getCategoryList();
    }

    public ResultSet editCategoryForm(int cid) throws SQLException {
        return adminRepository.editCategoryForm(cid);
    }

    public int updateCategory(String cname, int cid) throws SQLException {
        return adminRepository.updateCategory(cname, cid);
    }

    public int removeCategory(int cid) throws SQLException {
        return adminRepository.removeCategory(cid);
    }

    public ResultSet getInquiryList() throws SQLException {
        return adminRepository.getInquiryList();
    }

    public ResultSet adminProfile(int adminid) throws SQLException {
        return adminRepository.adminProfile(adminid);
    }

    public int updateAdmin(String username, String pass, String fname, String lname, String email, String mobile, int adminid) throws SQLException {
        return adminRepository.updateAdmin(username, pass, fname, lname, email, mobile, adminid);
    }

//        public int addProducts(int pid, String pname, String brand, String description, Double price, int quantity,
//            Blob image, int cid, double discount, int sid, double final_price) {
//            return adminRepository.addProducts(pid, pname, brand, description, price,
//                                    quantity, image, cid, discount, sid, final_price);
//        }
}
