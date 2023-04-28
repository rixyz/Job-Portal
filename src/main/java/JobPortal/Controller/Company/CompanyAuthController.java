package JobPortal.Controller.Company;

import JobPortal.Hashing.HashingPassword;
import JobPortal.Model.Company;
import JobPortal.Service.CompanyService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Company: Auth", value = "/company/auth/*")
public class CompanyAuthController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] pathInfo = request.getPathInfo() == null ? new String[0] : request.getPathInfo().toLowerCase().split("/");
        String page = pathInfo.length < 2 ? "" : pathInfo[1];
        System.out.println("Goto:" + page + " " + request.getPathInfo());
        CompanyService companyService = new CompanyService();
        PrintWriter out = response.getWriter();

        switch (page) {
            case "register": {
                Company c = new Company();
                c.setUserName(request.getParameter("username"));
                c.setPassword(HashingPassword.hashPassword(request.getParameter("password")));
                c.setName(request.getParameter("cname"));
                c.setEmail(request.getParameter("email"));
                c.setAbout(request.getParameter("about"));
                //Call save()
                if (companyService.register(c) == 1) {
                    out.println("<script>alert('Registration Successful.')</script>");
                } else {
                    out.println("<script>alert('Registration failed.')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/company/auth");
                break;

            }
            case "login": {
                HttpSession session = request.getSession();
                String email = request.getParameter("email");
                String pass = HashingPassword.hashPassword(request.getParameter("password"));
                if (!companyService.login(email, pass, session)) {
                    session.invalidate();
                    out.println("<script>alert('Login fail.')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
                break;

            }
            case "logout": {
                HttpSession session = request.getSession();
                session.invalidate();
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
                break;

            }
            case "delete": {
                String ComID = pathInfo[1];
                //Call deleteCompany()
                if (companyService.deleteCompany(ComID) == 1) {
                    out.println("<script>alert('Delete Successfully.')</script>");
                } else {
                    out.println("<script>alert('Delete failed')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
                break;

            }
            default:
                request.getRequestDispatcher("/pages/Company/CompanyLogin.jsp").forward(request, response);
        }
    }
}


