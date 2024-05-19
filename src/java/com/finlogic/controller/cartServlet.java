/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

import com.finlogic.service.cartService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
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
public class cartServlet extends HttpServlet {

    cartService cartService = new cartService();

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

            if (process.equals("insertCartItems")) {

                int pid = Integer.parseInt(request.getParameter("pid"));
                int userid = Integer.parseInt(request.getParameter("userid"));
                int item_quantity = Integer.parseInt(request.getParameter("quantity"));

                Date currentDate = new Date();
                Timestamp currentTimestamp = new Timestamp(currentDate.getTime());

                int result = cartService.insertCartData(userid, pid, item_quantity, currentTimestamp);

                request.setAttribute("result", result);
                session.setAttribute("pid", pid);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("cartAjax.jsp");
                view.forward(request, response);

            } else if (process.equals("viewCartItems")) {

                int userid = Integer.parseInt(request.getParameter("userid"));
                ResultSet rs = cartService.getCartItem(userid);
//                out.print(session.getAttribute("pid"));
                int total_qntt = 0;
                while (rs.next()) {
                    total_qntt += rs.getInt("total_quantity"); // Accumulate total quantity
//                    out.print("product_name : " + rs.getString("product_name"));
                }
                session.setAttribute("total_quantity", total_qntt);
                out.print(session.getAttribute("total_quantity"));
                rs.close();
//
                rs = cartService.getCartItem(userid);
//
                request.setAttribute("result", rs);
                request.setAttribute("process", process);
//
                RequestDispatcher view = request.getRequestDispatcher("cartAjax.jsp");
                view.forward(request, response);

            } else if (process.equals("increaseCartItems")) {

                int pid = Integer.parseInt(request.getParameter("pid"));
                int userid = Integer.parseInt(request.getParameter("userid"));
                int final_quantity = Integer.parseInt(request.getParameter("finalQuantity"));
                int final_price = Integer.parseInt(request.getParameter("finalPrice"));

                Date currentDate = new Date();
                Timestamp currentTimestamp = new Timestamp(currentDate.getTime());

                int result = cartService.increaseCartItem(final_quantity, currentTimestamp, final_price, userid, pid);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("cartAjax.jsp");
                view.forward(request, response);

            } else if (process.equals("decreaseCartItems")) {

                int pid = Integer.parseInt(request.getParameter("pid"));
                int userid = Integer.parseInt(request.getParameter("userid"));
                int final_quantity = Integer.parseInt(request.getParameter("finalQuantity"));
                int final_price = Integer.parseInt(request.getParameter("finalPrice"));

                Date currentDate = new Date();
                Timestamp currentTimestamp = new Timestamp(currentDate.getTime());

                int result = cartService.decreaseCartItem(final_quantity, currentTimestamp, final_price, userid, pid);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("cartAjax.jsp");
                view.forward(request, response);

            } else if (process.equals("removeItem")) {

                int pid = Integer.parseInt(request.getParameter("pid"));
                int userid = Integer.parseInt(request.getParameter("userid"));

                int result = cartService.removeCartItem(userid, pid);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("cartAjax.jsp");
                view.forward(request, response);

            } else if (process.equals("removeAllCartItems")) {

                int userid = Integer.parseInt(request.getParameter("userid"));

                int result = cartService.removeAllCartItems(userid);
                
                session.setAttribute("total_quantity", null);

                request.setAttribute("result", result);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("cartAjax.jsp");
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
