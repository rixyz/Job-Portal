package JobPortal.Controller.Employee;

import JobPortal.Model.Company;
import JobPortal.Model.Review;
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

@WebServlet(name = "Employee: Company", value = "/employee/company/*")
public class EmployeeComanyController extends HttpServlet {
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

        switch (page) {
            case "review": {
                PrintWriter out = response.getWriter();
                String EmpID = (String) session.getAttribute("ID");

                Review review = new Review();
                EmployeeService dao = new EmployeeService();
                review.setEid(EmpID);
                review.setCid(pathInfo[2]);
                review.setRating(Integer.parseInt(request.getParameter("rate")));
                review.setComment(request.getParameter("review"));
                switch (dao.review(review)) {
                    case 1:
                        out.println("<script>alert('Successfully Reviewed.')</script>");
                        break;
                    case 2:
                        out.println("<script>alert('Updated your review.')</script>");
                        break;
                    default:
                        out.println("<script>alert('Failed to review!! Try Again..')</script>");
                        break;
                }
                response.setHeader("Refresh", "1;" + request.getContextPath() + "/employee/company/info/" + review.getCid());
                break;

            }
            case "info": {
                try {
                    String ComID = pathInfo[2];
                    Company c = CompanyService.getCompanyById(ComID);
                    List<Review> review = EmployeeService.getReviewList(ComID);
                    request.setAttribute("Company", c);
                    request.setAttribute("ReviewList", review);
                    request.getRequestDispatcher("/pages/Employee/CompanyInfo.jsp").forward(request, response);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            }
        }
    }
}

