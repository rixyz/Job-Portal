package JobPortal.Service;

import JobPortal.Model.Employee;
import JobPortal.Model.Recommendation;
import JobPortal.Model.Review;
import JobPortal.DBConnection.SqlConnection;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeService {

    /**
     * Updates an employee's details in the employee table.
     *
     * @param e the Employee object to be updated
     * @return an integer value indicating the status of the update operation
     */
    public static int update(Employee e) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("UPDATE employee SET FirstName= ?, LastName=?, UserName=?, Password=?, About=?,  Email =?, Number =? WHERE ID=? ")) {
            st.setString(1, e.getUfname());
            st.setString(2, e.getUlname());
            st.setString(3, e.getUserName());
            st.setString(4, e.getPassword());
            st.setString(5, e.getAbout());
            st.setString(6, e.getUemail());
            st.setString(7, e.getNumber());
            st.setString(8, e.getID());
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Returns a list of all employees from the employee table.
     *
     * @return a list of Employee objects
     */
    public static List<Employee> getEmployeeList() {

        List<Employee> employees = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector(); Statement statement = con.createStatement(); ResultSet rs = statement.executeQuery("SELECT * FROM employee")) {
            while (rs.next()) {
                Employee e = new Employee();
                e.setID(rs.getString("ID"));
                e.setUemail(rs.getString("Email"));
                e.setUfname(rs.getString("FirstName"));
                e.setUlname(rs.getString("LastName"));
                e.setUserName(rs.getString("UserName"));
                e.setPassword(rs.getString("Password"));
                e.setAbout(rs.getString("About"));
                e.setNumber(rs.getString("Number"));
                e.setCompanyID(rs.getString("ComID"));
                employees.add(e);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return employees;
    }

    /**
     * Gets the Employee object for the employee with the specified id.
     *
     * @param eid the id of the employee to retrieve
     * @return the Employee object for the specified id
     */
    public static Employee getEmployeeById(String eid) {
        Employee e = new Employee();
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("SELECT * FROM employee WHERE  ID=?")) {
            st.setString(1, eid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                e.setID(rs.getString("ID"));
                e.setUemail(rs.getString("Email"));
                e.setUfname(rs.getString("FirstName"));
                e.setUlname(rs.getString("LastName"));
                e.setUserName(rs.getString("UserName"));
                e.setPassword(rs.getString("Password"));
                e.setAbout(rs.getString("About"));
                e.setNumber(rs.getString("Number"));
                e.setCompanyID(rs.getString("ComID"));

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return e;
    }

    /**
     * Returns the number of employees in the employee table.
     *
     * @return the number of employees in the employee table
     */
    public static int getEmployeeCount() {
        try (Connection con = SqlConnection.dbConnector(); Statement st = con.createStatement()) {
            ResultSet rs = st.executeQuery("SELECT COUNT(*) AS Count FROM employee;");
            if (rs.next()) {
                return rs.getInt("Count");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Gets the Employee object for the employee with the specified email address.
     *
     * @param email the email address of the employee to retrieve
     * @return the Employee object for the specified email address
     */
    public static Employee getEmployeeByEmail(String email) {
        Employee e = new Employee();
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("SELECT * FROM employee WHERE  Email=?")) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                e.setID(rs.getString("ID"));
                e.setUemail(rs.getString("Email"));
                e.setUfname(rs.getString("FirstName"));
                e.setUlname(rs.getString("LastName"));
                e.setUserName(rs.getString("UserName"));
                e.setPassword(rs.getString("Password"));
                e.setAbout(rs.getString("About"));
                e.setNumber(rs.getString("Number"));
                e.setCompanyID(rs.getString("ComID"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return e;
    }

    /**
     * Returns a list of all recommendations for the employee with the specified email address.
     *
     * @param email the email address of the employee to retrieve recommendations for
     * @return a list of Recommendation objects
     */
    public static List<Recommendation> getRecommendationList(String email) {
        List<Recommendation> recommendations = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("SELECT * FROM recommend WHERE Email=?")) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Recommendation r = new Recommendation();
                r.setJid(rs.getString("JobID"));
                r.setRecID(rs.getString("RecID"));
                r.setEmail(rs.getString("Email"));
                recommendations.add(r);
            }
            return recommendations;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * Returns a list of all reviews for the company with the specified company ID.
     *
     * @param ComID the company ID to retrieve reviews for
     * @return a list of Review objects
     */
    public static List<Review> getReviewList(String ComID) {
        List<Review> reviews = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("SELECT * FROM review WHERE ComID=?")) {
            st.setString(1, ComID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Review r = new Review();
                r.setId(rs.getString("ID"));
                r.setEid(rs.getString("EmpID"));
                r.setCid(rs.getString("ComID"));
                r.setRating(rs.getInt("Rating"));
                r.setComment(rs.getString("Comment"));
                reviews.add(r);
            }
            return reviews;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * Attempt to log in an employee with the given email and password.
     *
     * @param email   the email address to use for logging in
     * @param pass    the password to use for logging in
     * @param session the HttpSession object for the current session
     * @return true if the login was successful, false otherwise
     */
    public boolean login(String email, String pass, HttpSession session) {
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("SELECT FirstName, LastName, ID, role FROM employee WHERE Email=? AND Password=?")) {
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Employee e = new Employee();
                e.setID(rs.getString("ID"));
                session.setAttribute("ID", e.getID());
                session.setAttribute("Name", rs.getString("FirstName") + " " + rs.getString("LastName"));
                System.out.println("========================");
                if (rs.getInt("Role") == 1) {
                    session.setAttribute("Type", "Admin");
                    System.out.println("Logged in Admin: " + e.getID());
                    AdminService.setSession(e.getID(), "Admin");
                } else {
                    session.setAttribute("Type", "Employee");
                    System.out.println("Logged in Seeker: " + e.getID());
                    AdminService.setSession(e.getID(), "Seeker");
                }
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;

    }

    /**
     * Register a new employee with the given information.
     *
     * @param employee the Employee object to save
     * @return the number of rows affected by the insert statement
     */
    public int register(Employee employee) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement(
                     "INSERT INTO employee (Email, FirstName, LastName, UserName, Password,  About, Number) VALUES(?,?,?,?,?,?,?)")) {
            st.setString(1, employee.getUemail());
            st.setString(2, employee.getUfname());
            st.setString(3, employee.getUlname());
            st.setString(4, employee.getUserName());
            st.setString(5, employee.getPassword());
            st.setString(6, employee.getAbout());
            st.setString(7, employee.getNumber());
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Reset the password of an employee with the given email and phone number.
     *
     * @param email the email address of the employee whose password to reset
     * @param phone the phone number of the employee whose password to reset
     * @param pass  the new password to set
     * @return the number of rows affected by the update statement
     */
    public int forgetPass(String email, String phone, String pass) {
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("UPDATE employee SET Password= ? WHERE email=? AND Number=?")) {
            st.setString(1, pass);
            st.setString(2, email);
            st.setString(3, phone);
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Delete an employee with the given ID.
     *
     * @param eid the ID of the employee to delete
     * @return the number of rows affected by the delete statement
     */
    public int deleteEmployee(String eid) {
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("DELETE FROM employee WHERE ID=? ")) {
            st.setString(1, eid);
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Add a recommendation for a job posting.
     *
     * @param jid   the ID of the job posting to recommend
     * @param recId the ID of the employee making the recommendation
     * @param email the email address of the employee being recommended
     * @return the number of rows affected by the insert statement
     */
    public int recommend(String jid, String recId, String email) {
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("INSERT INTO recommend(JobID, RecID, Email) VALUES(?,?,?)")) {
            st.setString(1, jid);
            st.setString(2, recId);
            st.setString(3, email);
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Add or update a review for an employee.
     *
     * @param review the Review object containing the review details
     * @return the number of rows affected by the insert/update statement
     */
    public int review(Review review) {
        try (Connection con = SqlConnection.dbConnector(); PreparedStatement st = con.prepareStatement("INSERT INTO review (EmpID, ComID, Rating, Comment) VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE Rating=?, Comment=?")) {
            st.setString(1, review.getEid());
            st.setString(2, review.getCid());
            st.setInt(3, review.getRating());
            st.setString(4, review.getComment());
            st.setInt(5, review.getRating());
            st.setString(6, review.getComment());
            return st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

}
