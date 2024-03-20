/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

import com.finlogic.service.loginService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dell
 */
public class loginServlet extends HttpServlet {

    loginService loginService = new loginService();

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
        try {
            HttpSession session = request.getSession();
            String process = request.getParameter("process");

            if (process.equals("verifyOtp")) {

                String email = request.getParameter("emailInput");

                ResultSet rs = loginService.checkEmail(email);

                if (rs.next()) {
                    session.setAttribute("userExists", "user");
                    session.setAttribute("name", rs.getString("first_name"));
                    out.print(session.getAttribute("name"));

                    request.setAttribute("result", rs);
                    request.setAttribute("process", process);

                    RequestDispatcher view = request.getRequestDispatcher("loginAjax.jsp");
                    view.forward(request, response);
                } else {
                    session.setAttribute("emailSession", email);
                    out.print(session.getAttribute("emailSession"));
                }

            } else if (process.equals("insertProfileData")) {

                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String username = request.getParameter("username");
                String uemail = request.getParameter("email");
                String mobile = request.getParameter("mobile");
                String address = request.getParameter("address");
                String state = request.getParameter("state");
                String city = request.getParameter("city");
                String pincode = request.getParameter("pincode");

                int result = loginService.insertProfileData(fname, lname, username, uemail, mobile, address, state, city, pincode);

                session.setAttribute("userLoggedin", "1");
                session.setAttribute("userEmail", uemail);
                session.setAttribute("fname", fname);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("loginAjax.jsp");
                view.forward(request, response);
            } else if (process.equals("getUserData")) {
                String email = request.getParameter("email");

                out.print(email);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            out.print("exception : " + ex.getMessage());
        } finally {

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
