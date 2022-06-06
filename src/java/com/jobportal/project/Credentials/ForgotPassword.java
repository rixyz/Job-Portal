/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Credentials;

import com.jobportal.project.Employee.dao.EmployeeDao;
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
@WebServlet(name = "ForgotPassword", urlPatterns = {"/ForgotPassword"})
public class ForgotPassword extends HttpServlet {

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
        System.out.println("\nServlet Called: Addjob");
        response.setContentType("text/html;charset=UTF-8");

        try ( PrintWriter out = response.getWriter()) {
            EmployeeDao dao = new EmployeeDao();

            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String pass = request.getParameter("password");

            System.out.println("Dao.forget called");
            //Call forgetPass and return value in status
            int status = dao.forgetPass(email, phone, pass);
            //Check status code
            if (status > 0) {
                out.println("<script>alert('Password changed successfully.')</script>");
                response.setHeader("Refresh", "1;UserLogin.jsp");
            } else {
                out.println("<script>alert('Failed to change Password. Check and resubmit')</script>");
                response.setHeader("Refresh", "1;index.jsp");
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
