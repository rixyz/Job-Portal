/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Company;

import com.jobportal.project.Job.dao.JobDao;
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
@WebServlet(name = "UpdateApplication", urlPatterns = {"/UpdateApplication"})
public class UpdateApplications extends HttpServlet {

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
        JobDao d = new JobDao();

        String jid = request.getParameter("jid");
        String eid = request.getParameter("eid");
        String approve = request.getParameter("approve");;
        System.out.println("Dao.updateApprove called");
        if (d.updateApprove(jid, eid, approve) == 1) {
            response.setHeader("Refresh", "1;CompanyApplicationList");
        } else {
            out.println("<script>alert('Approve failed')</script>");
            response.setHeader("Refresh", "1;CompanyApplicationList");
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
