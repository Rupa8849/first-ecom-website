/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.finlogic.controller;

import com.finlogic.service.productDetailsService;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author dell
 */
public class productDetails extends HttpServlet {

    productDetailsService productDetailsService = new productDetailsService();

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

            if (process.equals("productDetails") || process.equals("cartDetails")) {
                int id = Integer.parseInt(request.getParameter("id"));

                ResultSet rs = productDetailsService.getProductDetails(id);
                if (rs != null) {
//                    out.println("1");
//                    session.setAttribute("productid", id);
                    request.setAttribute("product", rs);
                    request.setAttribute("process", process);

                    if (process.equals("cartDetails")) {
//                       
                        String[] productNames = (String[]) session.getAttribute("productNames");
                        Double[] prices = (Double[]) session.getAttribute("prices");
                        String[] imageBts = (String[]) session.getAttribute("imageBts");

                        // If the array doesn't exist, create new arrays
                        if (productNames == null || prices == null || imageBts == null) {
                            productNames = new String[1];
                            prices = new Double[1];
                            imageBts = new String[1];

                        } else {
                            // Extend the arrays to accommodate new values
                            String[] newProductNames = new String[productNames.length + 1];
                            Double[] newPrices = new Double[prices.length + 1];
                            String[] newImageBts = new String[imageBts.length + 1];

                            System.arraycopy(productNames, 0, newProductNames, 0, productNames.length);
                            System.arraycopy(prices, 0, newPrices, 0, prices.length);
                            System.arraycopy(imageBts, 0, newImageBts, 0, imageBts.length);

                            productNames = newProductNames;
                            prices = newPrices;
                            imageBts = newImageBts;
                        }

                        // Add the new values to the arrays
                        if (rs.next()) {
                            String pname = rs.getString("product_name");
                            Double price = rs.getDouble("final_price");
                            byte[] content = rs.getBytes("image");
                            String base64Encoded = new String(Base64.encodeBase64(content), "UTF-8");

                            productNames[productNames.length - 1] = pname;
                            prices[prices.length - 1] = price;
                            imageBts[imageBts.length - 1] = base64Encoded;

                            // Store the updated arrays back in the session
                            session.setAttribute("productNames", productNames);
                            session.setAttribute("prices", prices);
                            session.setAttribute("imageBts", imageBts);

                        }

                    } else {
                        RequestDispatcher view = request.getRequestDispatcher("singleProductAjax.jsp");
                        view.forward(request, response);
                    }
                } else {
                    out.println("0");
                }

            } else if (process.equals("brandProductDetail")) {
                String brand = request.getParameter("brand");
                out.println(brand);

                ResultSet rs = productDetailsService.getBrandProducts(brand);
                if (rs != null) {
                    out.println("1");
                    session.setAttribute("brand", brand);
                    out.print(session.getAttribute("brand"));
                    request.setAttribute("product", rs);
                    request.setAttribute("process", process);
                } else {
                    out.println("0");
                }

                RequestDispatcher view = request.getRequestDispatcher("singleProductAjax.jsp");
                view.forward(request, response);

            } else if (process.equals("removeOneItem")) {
                String pid = request.getParameter("pid");

                List<String> productNames = (List<String>) session.getAttribute("productNames");
                List<Double> prices = (List<Double>) session.getAttribute("prices");
                List<String> imageBts = (List<String>) session.getAttribute("imageBts");

                // Find the index of the product to remove
                int indexToRemove = -1;
                for (int i = 0; i < productNames.size(); i++) {
                    if (productNames.get(i).equals(pid)) {
                        indexToRemove = i;
                        break;
                    }
                }

                // Remove the product if found
                if (indexToRemove != -1) {
                    productNames.remove(indexToRemove);
                    prices.remove(indexToRemove);
                    imageBts.remove(indexToRemove);
                }

                // Update the session attribute
                session.setAttribute("productNames", productNames);
                
                // Redirect back to the page where you want to display the updated list
                response.sendRedirect(request.getContextPath() + "/catItems.jsp");

            } else if (process.equals("removeCart")) {
                session.removeAttribute("productNames");
                session.removeAttribute("prices");
                session.removeAttribute("imageBts");

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
