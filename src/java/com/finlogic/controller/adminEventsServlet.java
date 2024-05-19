/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

import com.finlogic.service.adminEventsService;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author dell
 */
//@MultipartConfig(maxFileSize = 16177215)
public class adminEventsServlet extends HttpServlet {

    adminEventsService adminService = new adminEventsService();

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

            if (process.equals("viewProducts") || process.equals("editProducts") || process.equals("deleteProducts")) {
                out.println(process);

                ResultSet rs = adminService.viewProducts();

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("deleteItem")) {

                int pid = Integer.parseInt(request.getParameter("pid"));
//                out.println(pid);
                int status = adminService.deleteItem(pid);

                request.setAttribute("status", status);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("InsertItemForm")) {

                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);

            } else if (process.equals("editItemForm")) {

                int pid = Integer.parseInt(request.getParameter("pid"));
                ResultSet rs = adminService.editItemForm(pid);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);

            } else if (process.equals("getAdminData")) {

                int id = Integer.parseInt(request.getParameter("adminid"));

                ResultSet rs = adminService.getAdminData(id);
//                out.println(rs);

                while (rs.next()) {
                    out.print(rs.getString("first_name"));
                }

            } else if (process.equals("getOrderDetails")) {
                ResultSet rs = adminService.getAllOrderDetail();

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);

            } else if (process.equals("getPendingOrders")) {
                ResultSet rs = adminService.getPendingOrders();

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("getConfirmedOrders")) {
                ResultSet rs = adminService.getConfirmedOrders();

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents.jsp");
                view.forward(request, response);

            } else if (process.equals("getUserList")) {
                ResultSet rs = adminService.getUserList();
//                out.println(rs);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);

            } else if (process.equals("getCategoryList")) {
                ResultSet rs = adminService.getCategoryList();

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);
//                out.print(session.getAttribute("cid"));

            } else if (process.equals("editCategoryForm")) {
                int cid = Integer.parseInt(request.getParameter("cid"));
                ResultSet rs = adminService.editCategoryForm(cid);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);

            } else if (process.equals("updateCategory")) {
                int cid = Integer.parseInt(request.getParameter("cid"));
                String cname = request.getParameter("cname");

                int status = adminService.updateCategory(cname, cid);

                out.print(status);

            } else if (process.equals("removeCategory")) {
                int cid = Integer.parseInt(request.getParameter("cid"));

                int status = adminService.removeCategory(cid);

                out.print(status);

            } else if (process.equals("getInquiryList")) {
                ResultSet rs = adminService.getInquiryList();

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);

            } else if (process.equals("adminProfile")) {
                int adminid = Integer.parseInt(request.getParameter("adminid"));

                ResultSet rs = adminService.adminProfile(adminid);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);

            } else if (process.equals("editAdminProfileForm")) {
                int adminid = Integer.parseInt(request.getParameter("adminid"));

                ResultSet rs = adminService.adminProfile(adminid);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("adminEvents2.jsp");
                view.forward(request, response);

            } else if (process.equals("updateAdmin")) {
                int adminid = Integer.parseInt(request.getParameter("adminid"));
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String mobile = request.getParameter("mobile");

                 int status = adminService.updateAdmin(username, password, fname, lname, email, mobile, adminid);

                out.print(status);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            out.print("Exception : " + ex.getMessage());
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
