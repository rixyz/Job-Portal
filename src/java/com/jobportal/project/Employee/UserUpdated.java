/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Employee;

import com.jobportal.project.Employee.Bean.Employee;
import com.jobportal.project.Employee.dao.EmployeeDao;
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
 * @author Dell
 */
@WebServlet(name = "UserUpdated", urlPatterns = {"/UserUpdated"})
public class UserUpdated extends HttpServlet {

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
        System.out.println("\nServlet Called: UserUpdated");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);

        String eid = (String) session.getAttribute("ID");
        String Umail = request.getParameter("email");
        String Ufname = request.getParameter("firstName");
        String Ulname = request.getParameter("lastName");
        String UserName = request.getParameter("userName");
        String Password = request.getParameter("passwd");
        String gen = request.getParameter("gender");
        String exp = request.getParameter("exp_in_years");
        String skill = request.getParameter("keySkills");
        String phone = request.getParameter("phone");

        Employee e = new Employee();
        e.setUemail(Umail);
        e.setUfname(Ufname);
        e.setUlname(Ulname);
        e.setUserName(UserName);
        e.setPassword(Password);
        e.setGen(gen);
        e.setExp(exp);
        e.setSkill(skill);
        e.setNumber(phone);

        System.out.println("Dao.update called");
        int status = EmployeeDao.update(e, Umail, eid);
        if (status > 0) {
            out.println("<script>alert('Profile Updated Successfully.')</script>");
            response.setHeader("Refresh", "1;UserProfile.jsp");
        } else {
            out.println("<script>alert('Sorry! unable to update Deatils')</script>");
            response.setHeader("Refresh", "1;UserProfile.jsp");
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
