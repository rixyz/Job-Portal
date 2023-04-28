package JobPortal.Controller.Admin;

import JobPortal.Model.ReportData;
import JobPortal.Service.AdminService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Admin", value = "/admin/*")
public class AdminController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Type") != "Admin") {
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        String[] pathInfo = request.getPathInfo() == null ? new String[0] : request.getPathInfo().toLowerCase().split("/");
        String page = pathInfo.length < 2 ? "" : pathInfo[1];
        System.out.println("Goto:" + page + " " + request.getPathInfo());
        if (page.equals("data")) {
            ReportData d = AdminService.getAnnualReports();
            request.setAttribute("reportData", d);
            request.getRequestDispatcher("/pages/Admin/AdminData.jsp").forward(request, response);

        } else {
            response.getWriter().println("<script>alert('Invalid Action: " + page + "')</script>");
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
        }
    }
}
