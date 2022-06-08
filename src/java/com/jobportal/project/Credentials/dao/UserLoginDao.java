/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jobportal.project.Credentials.dao;

import com.jobportal.project.Employee.Bean.Employee;
import com.jobportal.project.sql.SqlConnection;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.*;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.IOUtils;

/**
 *
 * @author Dell
 */
public class UserLoginDao {

    String query = "select * from employee where email=? and password=?";
    Connection con = null;

    /**
     * Check employee login
     *
     * @param email
     * @param pass
     * @param session
     * @return
     */
    public boolean validate(String email, String pass, HttpSession session) throws IOException {
        try {
            con = SqlConnection.dbConnector();
            PreparedStatement st = con.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee e = new Employee();
                e.setID(rs.getString(10));
                System.out.println("UserID: " + e.getID());
                session.setAttribute("ID", e.getID());
                session.setAttribute("Name", rs.getString(2) + " " + rs.getString(3));

                String id = e.getID();
                String PATH = "D:\\Projects\\UProj\\Job Portal Website\\Job_Portal\\web\\assets\\img\\user\\";
                String fileName = "\\profilepic.jpeg";
                File file = new File(PATH + id + fileName);
                if (!file.exists()) {
                    FileInputStream fis = null;
                    try {
                        File directory = new File(PATH + id);
                        if (!directory.exists()) {
                            directory.mkdir();
                        }
                        fis = new FileInputStream(PATH + "null" + fileName);

                        try ( OutputStream outputStream = new FileOutputStream(file)) {
                            IOUtils.copy(fis, outputStream);
                        } catch (FileNotFoundException ex) {
                            System.out.println("File not Found\n" + ex);
                        } catch (IOException ex) {
                            System.out.println("IOE\n" + ex);
                        }
                        System.out.println("Made The File");
                    } finally {
                        if (fis != null) {
                            fis.close();
                        }
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;

    }

}
