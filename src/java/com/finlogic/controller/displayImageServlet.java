/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

import com.finlogic.service.displayImageService;
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
public class displayImageServlet extends HttpServlet {

    displayImageService displayImageService = new displayImageService();

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

            if (process.equals("displayLipstics")
                    || process.equals("displayEyemakeup")
                    || process.equals("displayFacemakeup")
                    || process.equals("displayNailmakeup")
                    || process.equals("displaySkincare")) {
                switch (process) {
                    case "displayLipstics":
                        ResultSet lips = displayImageService.displayLipstics();
                        request.setAttribute("result", lips);
                        break;
                    case "displayEyemakeup":
                        ResultSet eyes = displayImageService.displayEyemakeups();
                        request.setAttribute("result", eyes);
                        break;
                    case "displayFacemakeup":
                        ResultSet face = displayImageService.displayFacemakeups();
                        request.setAttribute("result", face);
                        break;
                    case "displayNailmakeup":
                        ResultSet nail = displayImageService.displayNailmakeups();
                        request.setAttribute("result", nail);
                        break;
                    case "displaySkincare":
                        ResultSet skin = displayImageService.displaySkincare();
                        request.setAttribute("result", skin);
                        break;
                    default:
                        break;
                }
                request.setAttribute("process", process);

                RequestDispatcher view = request.getRequestDispatcher("productsAjax.jsp");
                view.forward(request, response);
//                
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
