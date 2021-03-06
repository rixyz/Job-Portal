/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Admin;

import com.jobportal.project.Company.Bean.Company;
import com.jobportal.project.Company.dao.CompanyDao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ListCompanies", urlPatterns = {"/ListCompanies"})
public class ListCompanies extends HttpServlet {

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
        System.out.println("\nServlet Called: ListCompanies");
        response.setContentType("text/html;charset=UTF-8");
        try {
            //Call list() from CompanyDao and return the value in c
            List<Company> c = CompanyDao.list();
            //Store c in request to be passed
            request.setAttribute("CompanyList", c);
            //Redirect the page passing request and response
            request.getRequestDispatcher("AdminCompany.jsp").forward(request, response);
        } catch (SQLException e) {
            System.out.println(e);
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
