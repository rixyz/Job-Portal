package JobPortal.Controller;

import JobPortal.Service.EmployeeService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.*;

@WebServlet(name = "UploadDownload", value = "/UploadDownload/*")
@MultipartConfig
public class UploadDownloadController extends HttpServlet {

    public static String pathHeader = File.separatorChar == '/' ? "/media/E" : "E:";
    public static int BUFFER_SIZE = 1024 * 100;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = pathHeader + File.separator + "assets" + File.separator;
        String[] pathInfo = request.getPathInfo().split("/");
        String page = pathInfo[1];
        String ID = pathInfo[2];
        String fileName = "";


        if (page.equals("DownloadProfile")) {
            filePath = filePath + "user" + File.separator + ID + File.separator + "profile.png";
            fileName = EmployeeService.getEmployeeById(ID).getFullname() + ".png";
        }
        if (page.equals("DownloadResume")) {
            filePath = filePath + "user" + File.separator + ID + File.separator + "resume.pdf";
            fileName = EmployeeService.getEmployeeById(ID).getFullname() + ".pdf";
        }
        File file = new File(filePath);

        if (file.exists()) {
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", String.format("attachment; filename=\"%s\"", fileName));
            try (OutputStream outStream = response.getOutputStream();
                 InputStream inputStream = new FileInputStream(file)) {
                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }
            } catch (IOException ex) {
                System.out.println("Exception While Performing The I/O Operation?= " + ex.getMessage());
            }
        } else {
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Error 404: File does not exist')</script>");
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String filePath = pathHeader + File.separator + "assets" + File.separator;
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String[] pathInfo = request.getPathInfo().split("/");
        String page = pathInfo[1];
        String ID = (String) session.getAttribute("ID"),
                sendTo = "/", ext = "";
        if (page.equals("EmployeeUploadProfile")) {
            filePath = filePath + "user" + File.separator + ID + File.separator;
            ext = "profile.png";
            sendTo = "/employee/profile";
        }
        if (page.equals("CompanyUploadProfile")) {
            filePath = filePath + "company" + File.separator + ID + File.separator;
            ext = "profile.png";
            sendTo = "/company/profile";
        }
        if (page.equals("UploadResume")) {
            filePath = filePath + "user" + File.separator + ID + File.separator;
            ext = "resume.pdf";
            sendTo = "/employee/profile";
        }
        File fileUploadDirectory = new File(filePath);

        if (!fileUploadDirectory.exists()) {
            System.out.println(filePath + " : Directory doesn't exist");
            if (fileUploadDirectory.mkdirs()) System.out.println(filePath + " : Directory created");

        }

        Part part = request.getPart("filename");
        try {
            part.write(filePath + ext);
            out.println("<script>alert('Upload Successful')</script>");
        } catch (IOException ioObj) {
            ioObj.printStackTrace();
            out.println("<script>alert('Upload Failed')</script>");
        }

        response.setHeader("Refresh", "1;" + request.getContextPath() + sendTo);
    }
}
