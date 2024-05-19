/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.finlogic.service;

import com.finlogic.repository.homeRepository;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author dell
 */
public class homeService {

    homeRepository homeRepository = new homeRepository();

    public ResultSet trendingNow() throws ClassNotFoundException, SQLException {
        return homeRepository.trendingNow();
    }

    public ResultSet topDeals() throws ClassNotFoundException, SQLException {
        return homeRepository.topDeals();
    }

    public ResultSet topBrands() throws ClassNotFoundException, SQLException {
        return homeRepository.topBrands();
    }
}
