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

@WebServlet(name = "Company: Profile", value = "/company/profile/*")
public class CompanyProfileController extends HttpServlet {
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
        String[] pathInfo = request.getPathInfo() == null ? new String[0] : request.getPathInfo().toLowerCase().split("/");
        String page = pathInfo.length < 2 ? "" : pathInfo[1];
        System.out.println("Goto:" + page + " " + request.getPathInfo());
        String ComID = (String) session.getAttribute("ID");
        CompanyService companyService = new CompanyService();
        PrintWriter out = response.getWriter();

        switch (page) {
            case "delete": {
                String cid = pathInfo[1];
                //Call deleteCompany()
                if (companyService.deleteCompany(cid) == 1) {
                    out.println("<script>alert('Delete Successfully.')</script>");
                } else {
                    out.println("<script>alert('Delete failed')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
                break;

            }
            case "update": {
                {
                    Company c = new Company();
                    c.setUserName(request.getParameter("userName"));
                    c.setPassword(HashingPassword.hashPassword(request.getParameter("password")));
                    c.setName(request.getParameter("cname"));
                    c.setEmail(request.getParameter("email"));
                    c.setAbout(request.getParameter("about"));
                    c.setID(ComID);
                    //Call save()
                    if (companyService.update(c) == 1) {
                        out.println("<script>alert('Update Successful.')</script>");
                    } else {
                        out.println("<script>alert('Update failed.')</script>");
                    }
                    response.setHeader("Refresh", "1;" + request.getContextPath() + "/company/profile");
                    break;

                }
            }
            default:
                request.getRequestDispatcher("/pages/Company/CompanyProfile.jsp").forward(request, response);
        }
    }
}


