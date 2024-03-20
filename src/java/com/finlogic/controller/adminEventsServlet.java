/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

import com.finlogic.repository.adminEventsService;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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
                
                int id = Integer.parseInt(request.getParameter("admin_id"));
                
                ResultSet rs = adminService.getAdminData(id);
//                out.println(rs);

                request.setAttribute("result", rs);
                request.setAttribute("process", process);
                
                RequestDispatcher view = request.getRequestDispatcher("adminDashboard.jsp");
                view.forward(request, response);
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
