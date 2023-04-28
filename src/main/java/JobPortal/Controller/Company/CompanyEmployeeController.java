package JobPortal.Controller.Company;

import JobPortal.Model.Employee;
import JobPortal.Service.CompanyService;
import JobPortal.Service.EmployeeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "Company: Employee", value = "/company/employee/*")
public class CompanyEmployeeController extends HttpServlet {
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
        PrintWriter out = response.getWriter();
        String ComID = (String) session.getAttribute("ID");

        switch (page) {
            case "add": {
                String email = request.getParameter("email");
                Employee e = EmployeeService.getEmployeeByEmail(email);
                CompanyService companyService = new CompanyService();
                if (companyService.addEmployee(e.getID(), ComID) == 1)
                    out.println("<script>alert('Employee Added')</script>");
                else out.println("<script>alert('Failed to add! Check email and try again')</script>");
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/company/employee");
                break;
            }
            case "remove": {
                String EmpID = pathInfo[2];
                CompanyService companyService = new CompanyService();
                if (companyService.removeEmployee(EmpID) == 1)
                    out.println("<script>alert('Employee Removed')</script>");
                else out.println("<script>alert('Failed to remove')</script>");
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/company/employee");
                break;

            }
            default: {
//            Call list and return the value
                List<Employee> employeeList = CompanyService.getEmployee(ComID);
//                List<Recommendation> recommendations = EmployeeService.listRecommend();
//                Store variable applied in request to be passed
                request.setAttribute("EmployeeList", employeeList);
//                request.setAttribute("RecommendList", recommendations);
//                Redirect the page passing request and response
                request.getRequestDispatcher("/pages/Company/CompanyEmployee.jsp").forward(request, response);
            }
        }
    }

}


