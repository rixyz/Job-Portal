package JobPortal.Controller.Company;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Company", value = "/company/*")
public class CompanyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Type") != "Company") {
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        String[] pathInfo = request.getPathInfo().split("/");
        String page = pathInfo[1];
        response.getWriter().println("<script>alert('Invalid Action: " + page + "')</script>");
        response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
    }
}



