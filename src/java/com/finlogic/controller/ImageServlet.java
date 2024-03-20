/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

//import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author dell
 */
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)
public class ImageServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;

        try {
            int p_id = Integer.parseInt(request.getParameter("pid"));
            String name = request.getParameter("pname");
            String brand = request.getParameter("brand");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity_stock = Integer.parseInt(request.getParameter("quantity"));
            int c_id = Integer.parseInt(request.getParameter("cid"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            int shade_id = Integer.parseInt(request.getParameter("sid"));
            double final_price = Math.round(price - ((price * discount) / 100));
            InputStream inputStream = null;

            Part filePart = request.getPart("image");
            if (filePart != null) {
                inputStream = filePart.getInputStream();
            }
            //database connection
            String url = "jdbc:mysql://localhost:3306/college_db";
            String user = "root";
            String password = "ruPa2000@";
            String message = "";
            try {
                DriverManager.registerDriver(new com.mysql.jdbc.Driver());
                conn = DriverManager.getConnection(url, user, password);
//                out.print("connection done");

                // constructs SQL statement
                String sql = "insert into products values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setInt(1, p_id);
                statement.setString(2, name);
                statement.setString(3, brand);
                statement.setString(4, description);
                statement.setDouble(5, price);
                statement.setInt(6, quantity_stock);

                if (inputStream != null) {
                    statement.setBlob(7, inputStream);
                }

                statement.setInt(8, c_id);
                statement.setInt(9, discount);
                statement.setInt(10, shade_id);
                statement.setDouble(11, final_price);

                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "data uploaded and saved into database";
                }
            } catch (SQLException ex) {
                message = "ERROR: " + ex.getMessage();
            }
            // sets the message in request scope
            request.setAttribute("Message", message);

            // forwards to the message page
            getServletContext().getRequestDispatcher("/success.jsp").forward(request, response);

        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
