/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.jobportal.project.Company;

import com.jobportal.project.Job.Bean.TotalApplication;
import com.jobportal.project.Job.dao.JobDao;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dell
 */
@WebServlet(name = "CompanyApplicationList", urlPatterns = {"/CompanyApplicationList"})
public class CompanyApplicationList extends HttpServlet {

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
        System.out.println("\nServlet Called: CompanyApplicationList");
        //Call list() from ApplicationDao and return the value in applied
        List<TotalApplication> applied = JobDao.userAppliedJobs();
        //Store applied in request to be passed
        request.setAttribute("AppliedList", applied);
        //Redirect the page passing request and response
        request.getRequestDispatcher("CompanyApplicationList.jsp").forward(request, response);
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
