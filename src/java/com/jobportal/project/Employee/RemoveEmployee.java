/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Employee;

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
@WebServlet(name = "RemoveEmployee", urlPatterns = {"/RemoveEmployee"})
public class RemoveEmployee extends HttpServlet {

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
        System.out.println("\nServlet Called: RemoveEmployee");
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            EmployeeDao e = new EmployeeDao();
            String eid = request.getParameter("eid");
            
            if (e.deleteEmployee(eid) == 1) {
                out.println("<script>alert('Delete Successfully.')</script>");
                response.setHeader("Refresh", "1;ListEmployees");
            } else {
                out.println("<script>alert('Delete failed')</script>");
                response.setHeader("Refresh", "1;ListEmployees");
            }
        }
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, java.io.IOException {

         throw new ServletException("GET method used with " +
            getClass( ).getName( )+": POST method required.");
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
