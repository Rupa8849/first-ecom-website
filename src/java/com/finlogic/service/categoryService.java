/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.categoryRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class categoryService {

    categoryRepository categoryRepository = new categoryRepository();

    public ResultSet displaySingleCategory(int cid) throws SQLException, ClassNotFoundException {
        return categoryRepository.displaySingleCategory(cid);
    }
}
