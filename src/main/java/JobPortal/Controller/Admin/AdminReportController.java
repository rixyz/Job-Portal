package JobPortal.Controller.Admin;

import JobPortal.Model.Job;
import JobPortal.Service.JobService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "Admin: Report", value = "/admin/report")
public class AdminReportController extends HttpServlet {
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
        if (page.equals("delete")) {
            PrintWriter out = response.getWriter();
            String jid = pathInfo[2];
            JobService d = new JobService();
            int status = d.deleteJob(jid);
            if (status == 1) {
                out.println("<script>alert('Delete  Successfully.')</script>");
            } else {
                out.println("<script>alert('Delete failed')</script>");
            }
            response.setHeader("Refresh", "1;" + request.getContextPath() + "/admin/jobs");
        } else {
            try {
                String spageid = Objects.requireNonNullElse(request.getParameter("paging"), "1");
                String search = Objects.requireNonNullElse(request.getParameter("search"), "");
                String sort = Objects.requireNonNullElse(request.getParameter("sort"), "");

                if (sort.equalsIgnoreCase("Name")) sort = "Title";
                else if (sort.equalsIgnoreCase("Salary")) sort = "Salary DESC";
                else if (sort.equalsIgnoreCase("Location")) sort = "Location";
                else sort = "Boosted Desc";

                int pageid = Integer.parseInt(spageid);
                int total = 7;
                if (pageid != 1) {
                    pageid = pageid - 1;
                    pageid = pageid * total + 1;
                }
                List<Job> jobs = JobService.getJobList(pageid, total, search, sort);

                request.setAttribute("JobList", jobs);
                request.getRequestDispatcher("/pages/Admin/AdminJobs.jsp").forward(request, response);
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
