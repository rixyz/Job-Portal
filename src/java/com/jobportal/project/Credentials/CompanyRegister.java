/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Credentials;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobportal.project.Company.dao.CompanyDao;

@WebServlet("/CompanyRegister")
public class CompanyRegister extends HttpServlet {

    public CompanyRegister() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("\nServlet Called: CompanyRegister");
        response.setContentType("text/html;charset=UTF-8");
        CompanyDao dao = new CompanyDao();
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String pass = request.getParameter("password");
            String cname = request.getParameter("cname");
            String email = request.getParameter("email");
            //Check if any variable is null
            if (username != null && pass != null && cname != null && email != null) {
                //Call save()
                if (dao.save(username, pass, cname, email) == 1) {
                    System.out.println("Dao.save called");
                    out.println("<script>alert('Registration Successfull.')</script>");
                    response.setHeader("Refresh", "1;CompanyLogin.jsp");
                } else {
                    out.println("<script>alert('Registration failed.')</script>");
                    response.setHeader("Refresh", "1;CompanyRegister.jsp");
                }
            }
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
