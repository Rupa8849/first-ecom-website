/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

import com.finlogic.service.userEventService;
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
public class userEventServlet extends HttpServlet {

    userEventService userEventService = new userEventService();

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
            HttpSession session = request.getSession();

            if (process.equals("addAddress")) {
                int userid = Integer.parseInt(request.getParameter("userid"));
                String address = request.getParameter("address");
                String state = request.getParameter("state");
                String city = request.getParameter("city");
                int pincode = Integer.parseInt(request.getParameter("pincode"));

                out.print(userid + " " + address);

                int result = userEventService.addAddress(userid, address, state, city, pincode);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("viewAddress")) {
                int userid = Integer.parseInt(request.getParameter("userid"));

                ResultSet result = userEventService.viewAddress(userid);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("updateOrder")) {
                int userid = Integer.parseInt(request.getParameter("userid"));
                int addressId = Integer.parseInt(request.getParameter("addressId"));

                int result = userEventService.updateOrder(addressId, userid);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("myOrders")) {
                int userid = Integer.parseInt(request.getParameter("userid"));
                out.print("hello");
//                ResultSet result = userEventService.viewUserOrders(userid);
//
//                request.setAttribute("result", result);
//                request.setAttribute("process", process);
//
//                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
//                view.forward(request, response);

            } else if (process.equals("userProfile")) {
                int userid = Integer.parseInt(request.getParameter("userid"));
//                out.print("hello profile");

                ResultSet profile = userEventService.viewUserProfile(userid);
                ResultSet address = userEventService.viewUserAddress(userid);

//                if (address.next()) {
//                    session.setAttribute("addressId", address.getInt("address_id"));
//                    address.beforeFirst();
//                }
                request.setAttribute("profile", profile);
                request.setAttribute("address", address);

                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("showUpdateForm")) {
                int userid = Integer.parseInt(request.getParameter("userid"));

                ResultSet rs = userEventService.viewUserProfile(userid);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("showAddressForm")) {

                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("updateProfile")) {
                int userid = Integer.parseInt(request.getParameter("userid"));
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String mobile = request.getParameter("mobile");

                int result = userEventService.updateProfile(fname, lname, email, mobile, userid);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("suggestion")) {
                String pname = request.getParameter("fname");

                ResultSet rs = userEventService.showSuggestion(pname);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("showUpdateAddressForm")) {
                int addressId = Integer.parseInt(request.getParameter("addressid"));

                ResultSet rs = userEventService.showUpdateAddressForm(addressId);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("updateAddress")) {
                int addressId = Integer.parseInt(request.getParameter("addressid"));
                String address = request.getParameter("address");
                String state = request.getParameter("state");
                String city = request.getParameter("city");
                int pincode = Integer.parseInt(request.getParameter("pincode"));

                int status = userEventService.updateAddress(address, state, city, pincode, addressId);

                request.setAttribute("status", status);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("removeAddress")) {
                
                int addressId = Integer.parseInt(request.getParameter("addressid"));
                int status = userEventService.removeAddress(addressId);

                request.setAttribute("status", status);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("userEvents.jsp");
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
