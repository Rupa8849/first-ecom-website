/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

import com.finlogic.service.orderService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dell
 */
public class orderServlet extends HttpServlet {

    orderService orderService = new orderService();

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
        try ( PrintWriter out = response.getWriter()) {
            String process = request.getParameter("process");

            if (process.equals("checkout")) {
                int userid = Integer.parseInt(request.getParameter("userid"));
                int totalQuantity = Integer.parseInt(request.getParameter("totalQuantity"));
                Double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
                int status = orderService.insertIntoOrder(userid, totalQuantity, totalPrice);
                int result = 0;
                if (status != 0) {
                    out.print("greater than 0");
                    result = orderService.insertIntoOrderDetails(userid);
                }
                request.setAttribute("result", result);
                request.setAttribute("process", process);
//
                RequestDispatcher view = request.getRequestDispatcher("orderAjax.jsp");
                view.forward(request, response);
                
            } else if (process.equals("viewOrderItems")) {
                int userid = Integer.parseInt(request.getParameter("userid"));
                ResultSet rs = orderService.getOrderItems(userid);
//                while(rs.)
//                out.print(rs.getString("product_name"));
                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("orderAjax.jsp");
                view.forward(request, response);

            }
        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Exception : " + ex.getMessage());
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
