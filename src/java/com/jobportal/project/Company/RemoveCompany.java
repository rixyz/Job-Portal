/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Company;

import com.jobportal.project.Company.dao.CompanyDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(name = "RemoveCompany", urlPatterns = {"/RemoveCompany"})
public class RemoveCompany extends HttpServlet {

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
        System.out.println("\nServlet Called: RemoveCompany");
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            CompanyDao c = new CompanyDao();
            String cid = request.getParameter("cid");
            //Call deleteCompany()
            if (c.deleteCompany(cid) == 1) {
                out.println("<script>alert('Delete Successfully.')</script>");
                response.setHeader("Refresh", "1;ListCompanies");
            } else {
                out.println("<script>alert('Delete failed')</script>");
                response.setHeader("Refresh", "1;ListCompanies");
            }
        }
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
