/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Credentials;

import com.jobportal.project.Credentials.dao.UserLoginDao;
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
@WebServlet(name = "LogIn", urlPatterns = {
    "/LogIn"
})
public class UserLogIn extends HttpServlet {

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
        System.out.println("\nServlet Called: LogIn");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        UserLoginDao dao = new UserLoginDao();
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        if (dao.validate(email, pass, session)) {
            String ID = (String) session.getAttribute("ID");
            String type = (String) session.getAttribute("Type");

            if (email.equals("admin@jobportal.com")) {
                System.out.println("ID: " + ID + "\nType: " + type);
                session.setAttribute("Type", "Admin");
            } else {
                System.out.println("ID: " + ID + "\nType: " + type);
                session.setAttribute("Type", "Employee");
            }
            request.getRequestDispatcher("Home").forward(request, response);

        } else {
            out.println("<script>alert('Login fail.')</script>");
            response.setHeader("Refresh", "1;index.jsp");
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
