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
 * @author RIX
 */
@WebServlet(name = "SubmitJob", urlPatterns = {"/SubmitJob"})
public class SubmitJob extends HttpServlet {

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
        System.out.println("\nServlet Called: SubmitJob");
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);
        JobDao d = new JobDao();

        String Uid = (String) session.getAttribute("ID");
        String Jid = request.getParameter("id");

        int state = d.applyToJob(Jid, Uid);
        
            System.out.println("UID"+Uid);
        switch (state) {
            case 1:
                out.println("<script>alert('Applied To Job  Successfully.')</script>");
                response.setHeader("Refresh", "1;Jobs");
                break;
            case 2:
                out.println("<script>alert('You have already applied')</script>");
                response.setHeader("Refresh", "1;Jobs");
                break;
            default:
                out.println("<script>alert('Failed to Apply!! Try Again..')</script>");
                response.setHeader("Refresh", "1;Jobs");
                break;
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
