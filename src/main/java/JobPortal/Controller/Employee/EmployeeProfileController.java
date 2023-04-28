package JobPortal.Controller.Employee;

import JobPortal.Hashing.HashingPassword;
import JobPortal.Model.Employee;
import JobPortal.Service.EmployeeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Employee: Profile", value = "/employee/profile/*")
public class EmployeeProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("Type") != "Employee") {
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");
            return;
        }
        response.setContentType("text/html;charset=UTF-8");
        String[] pathInfo = request.getPathInfo() == null ? new String[0] : request.getPathInfo().toLowerCase().split("/");
        String page = pathInfo.length < 2 ? "" : pathInfo[1];
        System.out.println("Goto:" + page + " " + request.getPathInfo());
        String EmpID = (String) session.getAttribute("ID");
        PrintWriter out = response.getWriter();
        switch (page) {
            case "delete": {
                EmployeeService dao = new EmployeeService();
                String eid = pathInfo[2];
                if (dao.deleteEmployee(eid) == 1) {
                    out.println("<script>alert('Delete Successfully.')</script>");
                } else {
                    out.println("<script>alert('Delete failed')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/home");

            }
            case "update": {
                Employee employee = new Employee();
                employee.setUemail(request.getParameter("email"));
                employee.setUfname(request.getParameter("firstName"));
                employee.setUlname(request.getParameter("lastName"));
                employee.setUserName(request.getParameter("userName"));
                employee.setPassword(HashingPassword.hashPassword(request.getParameter("password")));
                employee.setAbout(request.getParameter("about"));
                employee.setNumber(request.getParameter("phone"));
                employee.setID(EmpID);
                int status = EmployeeService.update(employee);
                if (status > 0) {
                    out.println("<script>alert('Profile Updated Successfully.')</script>");
                } else {
                    out.println("<script>alert('Sorry! unable to update Deatils')</script>");
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/employee/profile");
                break;
            }
            default:
                request.getRequestDispatcher("/pages/Employee/UserProfile.jsp").forward(request, response);
                break;
        }
    }
}
