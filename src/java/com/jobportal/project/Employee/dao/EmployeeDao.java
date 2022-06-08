package com.jobportal.project.Employee.dao;

import java.sql.*;
import com.jobportal.project.sql.SqlConnection;
import com.jobportal.project.Employee.Bean.Employee;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import org.apache.tomcat.util.http.fileupload.IOUtils;

/**
 *
 * @author Dell
 */
public class EmployeeDao {

    static Connection con = null;

    //
    /**
     * Register new employee
     *
     * @param Uemail
     * @param Ufname
     * @param Ulname
     * @param UserName
     * @param Password
     * @param gen
     * @param exp
     * @param skill
     * @param phone
     * @return status code
     */
    public int save(String Uemail, String Ufname, String Ulname, String UserName, String Password, String gen,
            String exp, String skill, String phone) {
        System.out.println("save Started");
        String query = "insert into employee values(?,?,?,?,?,?,?,?,?,null)";
        try {
            con = SqlConnection.dbConnector();
            PreparedStatement st = con.prepareStatement(query);

            st.setString(1, Uemail);
            st.setString(2, Ufname);
            st.setString(3, Ulname);
            st.setString(4, UserName);
            st.setString(5, Password);
            st.setString(6, gen);
            st.setString(7, exp);
            st.setString(8, skill);
            st.setString(9, phone);
            int i = st.executeUpdate();
            return i;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    /**
     * Update employee Detail
     *
     * @param e
     * @param Umail
     * @param eid
     * @return status code
     */
    public static int update(Employee e, String Umail, String eid) {
        int status = 0;

        try {
            System.out.println("mail from DAO" + Umail + eid);

            con = SqlConnection.dbConnector();
            PreparedStatement st = con.prepareStatement(
                    "UPDATE employee SET FirstName= ?, LastName=?, UserName=?, Password=?, Gender= ?, Experience= ?, keySkills =?,  email =?, Number =? WHERE eid=? ");
            st.setString(1, e.getUfname());
            st.setString(2, e.getUlname());
            st.setString(3, e.getUserName());
            st.setString(4, e.getPassword());
            st.setString(5, e.getGen());
            st.setString(6, e.getExp());
            st.setString(7, e.getSkill());
            st.setString(8, Umail);
            st.setString(9, e.getNumber());
            st.setString(10, eid);
            status = st.executeUpdate();
            if (status > 0) {
                System.out.println("updated success");
            }
            return status;
        } catch (SQLException er) {
            System.out.println(er);
        }
        return 0;
    }

    /**
     * List employee
     *
     * @return employee list
     * @throws SQLException
     */
    public static List<Employee> list() throws SQLException {

        List<Employee> employees = new ArrayList<>();
        try {
            con = SqlConnection.dbConnector();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM employee");
            while (rs.next()) {
                Employee e = new Employee();
                e.setUemail(rs.getString((1)));
                e.setUfname(rs.getString(2));
                e.setUlname(rs.getString(3));
                e.setUserName(rs.getString(4));
                e.setPassword(rs.getString(5));
                e.setGen(rs.getString(6));
                e.setExp(rs.getString(7));
                e.setSkill(rs.getString(8));
                e.setNumber(rs.getString(9));
                e.setID(rs.getString(10));
                employees.add(e);
            }
            return employees;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    /**
     * Get employee by id
     *
     * @param eid
     * @return employee object
     */
    public static Employee getEmployeeById(String eid) {
        Employee e = new Employee();

        try {
            con = SqlConnection.dbConnector();
            PreparedStatement ps = con.prepareStatement("select * from employee where  eid=?");
            ps.setString(1, eid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                e.setUemail(rs.getString((1)));
                e.setUfname(rs.getString(2));
                e.setUlname(rs.getString(3));
                e.setUserName(rs.getString(4));
                e.setPassword(rs.getString(5));
                e.setGen(rs.getString(6));
                e.setExp(rs.getString(7));
                e.setSkill(rs.getString(8));
                e.setNumber(rs.getString(9));
                e.setID(rs.getString(10));
                System.out.println("Get emp by id" + e);

            }
        } catch (SQLException er) {
            System.out.println(er);
        }
        return e;
    }

    /**
     * Reset employee Password
     *
     * @param email
     * @param phone
     * @param pass
     * @return status code
     */
    public int forgetPass(String email, String phone, String pass) {
        int status = 0;
        try {
            con = SqlConnection.dbConnector();
            PreparedStatement ps = con.prepareStatement(
                    "UPDATE employee SET Password= ? WHERE email=? AND Number=?");
            ps.setString(1, pass);
            ps.setString(2, email);
            ps.setString(3, phone);
            status = ps.executeUpdate();
            if (status > 0) {
                System.out.println("updated success");
            }
            return status;
        } catch (SQLException er) {
            System.out.println(er);
        }
        return 0;
    }

    /**
     * Delete employee
     *
     * @param eid
     * @return status code
     */
    public int deleteEmployee(String eid) {
        try {
            System.out.println("Delete Employee");
            con = SqlConnection.dbConnector();
            String Query = "DELETE FROM employee WHERE eid=? ";
            PreparedStatement st = con.prepareStatement(Query);
            st.setString(1, eid);
            int i = st.executeUpdate();
            return i;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public int uploadImage(String id, InputStream resume) {
        try {
            if (id == null) {
                return 2;
            }
            String PATH = "D:\\Projects\\UProj\\Job Portal Website\\Job_Portal\\web\\assets\\img\\user\\" + id;
            String fileName = "\\profilepic.jpeg";
            File directory = new File(PATH);
            if (!directory.exists()) {
                directory.mkdir();
            }
            File file = new File(PATH + fileName);
            try ( OutputStream outputStream = new FileOutputStream(file)) {
                IOUtils.copy(resume, outputStream);
            } catch (FileNotFoundException e) {
                System.out.println("File not Found\n" + e);
            } catch (IOException e) {
                System.out.println("IOE\n" + e);
            }
            return 1;
        } catch (Exception e) {
            System.out.println(e);
        }
        return 0;
    }
}
