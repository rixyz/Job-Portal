/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Credentials;

import com.jobportal.project.Credentials.dao.CompanyLoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author RIX
 */
@WebServlet(name = "CompanyLogin", urlPatterns = {"/CompanyLogin"})
public class CompanyLogin extends HttpServlet {

    public CompanyLogin() {
        super();

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("\nServlet Called: Addjob");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        HttpSession session = request.getSession(false);
        session.setAttribute("username", email);

        CompanyLoginDao dao = new CompanyLoginDao();
        session.setAttribute("status", false);
        System.out.println("Dao.validate called");
        if (dao.validate(email, pass, session)) {
            String ID = (String) session.getAttribute("ID");
            String username = (String) session.getAttribute("username");
            String type = (String) session.getAttribute("Type");
            System.out.println("ID: " + ID + "\nUsername: " + username + "\nType: " + type);
            request.getRequestDispatcher("Home").forward(request, response);
        } else {
            out.println("<script>alert('Login fail.')</script>");
            response.setHeader("Refresh", "1;CompanyLogin.jsp");
        }
        out.close();
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
