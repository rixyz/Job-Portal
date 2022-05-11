/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Job;

import com.jobportal.project.Job.dao.AddJobDao;
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
@WebServlet(name = "AddJob", urlPatterns = {"/AddJob"})
public class AddJob extends HttpServlet {

    public AddJob() {
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("\nServlet Called: Addjob");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        AddJobDao dao = new AddJobDao();

        String location = request.getParameter("loc");
        String vacancy = request.getParameter("vac");
        String iLocation = request.getParameter("ivl");
        String deadline = request.getParameter("deadline");
        String salary = request.getParameter("sal");
        String skill = request.getParameter("skill");
        String id = (String) session.getAttribute("ID");
        //Check if any variable is null
        if (location != null && vacancy != null && iLocation != null && deadline != null && salary != null && skill != null && id != null) {
            System.out.println("Dao.update called");
            //Call update() to add new job
            if (dao.update(location, vacancy, iLocation, deadline, salary, skill, id) == 1) {
                out.println("<script>alert('Job Addedd Successfully.')</script>");
                response.setHeader("Refresh", "1;AddJob.jsp");
            } else {
                out.println("<script>alert('Job Post Failed!! Try Again')</script>");
                response.setHeader("Refresh", "1;AddJob.jsp");
            }
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
