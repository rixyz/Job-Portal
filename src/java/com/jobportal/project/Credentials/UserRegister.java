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
 * @author RIX
 */
@WebServlet(name = "UserRegister", urlPatterns = {"/UserRegister"})
public class UserRegister extends HttpServlet {

    public UserRegister() {
        super();

    }

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
        System.out.println("\nServlet Called: Addjob");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String Uemail = request.getParameter("email");
        String Ufname = request.getParameter("firstName");
        String Ulname = request.getParameter("lastName");
        String UserName = request.getParameter("userName");
        String Password = request.getParameter("passwd");
        String gen = request.getParameter("gender");
        String exp = request.getParameter("exp_in_years");
        String skill = request.getParameter("keySkills");
        String phone = request.getParameter("phone");

        EmployeeDao dao = new EmployeeDao();
        System.out.println(Uemail + " " + Ufname + " " + Ulname + " " + UserName + " " + Password + " " + gen + " " + exp + " " + skill + " " + phone);

        System.out.println("Dao.save called");
        if (dao.save(Uemail, Ufname, Ulname, UserName, Password, gen, exp, skill, phone) == 1) {
            out.println("<script>alert('User Registered  Successfully.')</script>");
            response.setHeader("Refresh", "1;index.jsp");
        } else {
            out.println("<script>alert('Registration failed!! Try Again')</script>");
            response.setHeader("Refresh", "1;UserRegister.jsp");

        }
        out.close();
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
