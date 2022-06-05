/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Job;

import com.jobportal.project.Job.dao.JobDao;
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
@WebServlet(name = "RemoveJob", urlPatterns = {"/RemoveJob"})
public class RemoveJob extends HttpServlet {

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
        System.out.println("\nServlet Called: RemoveJob");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(false);
        try ( PrintWriter out = response.getWriter()) {
            JobDao d = new JobDao();
            String jid = request.getParameter("jid");
            String type = (String) session.getAttribute("Type");

            if (d.deleteJob(jid) == 1) {
                out.println("<script>alert('Delete  Successfully.')</script>");
            } else {
                out.println("<script>alert('Delete failed')</script>");
            }
            //Check type of account and redirect to the Page
            if (type.equals("Admin")) {
                request.getRequestDispatcher("AdminJobs").forward(request, response);
            } else if (type.equals("Company")) {
                request.getRequestDispatcher("CompanyRemoveJob").forward(request, response);
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
