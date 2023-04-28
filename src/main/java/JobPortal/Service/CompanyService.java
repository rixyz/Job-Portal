package JobPortal.Service;

import JobPortal.Model.Company;
import JobPortal.Model.Employee;
import JobPortal.DBConnection.SqlConnection;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CompanyService {

    /**
     * Returns a list of all companies in the database.
     *
     * @return List of Company objects
     */
    public static List<Company> getCompanyList(){
        List<Company> company = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM companies")) {
            while (rs.next()) {
                Company c = new Company();
                c.setUserName(rs.getString("Username"));
                c.setPassword(rs.getString("Password"));
                c.setName(rs.getString("Name"));
                c.setEmail(rs.getString("Email"));
                c.setCredit(rs.getInt("Credit"));
                c.setID(rs.getString("ID"));
                c.setAbout(rs.getString("About"));
                company.add(c);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return company;
    }

    /**
     * Retrieves details of the company with the given ID.
     *
     * @param ComID ID of the company to retrieve
     * @return Company object representing the company with the given ID
     */
    public static Company getCompanyById(String ComID) {
        Company c = new Company();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT * FROM companies WHERE ID=?")) {
            st.setString(1, ComID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                c.setUserName(rs.getString("Username"));
                c.setPassword(rs.getString("Password"));
                c.setName(rs.getString("Name"));
                c.setEmail(rs.getString("Email"));
                c.setCredit(rs.getInt("Credit"));
                c.setID(rs.getString("ID"));
                c.setAbout(rs.getString("About"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return c;
    }

    /**
     * Returns the total number of companies in the database.
     *
     * @return The number of companies
     */
    public static int getCompanyCount() {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT COUNT(*) AS Count FROM companies");
             ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("Count");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Returns a list of employees who work for the company with the given ID.
     *
     * @param ComID ID of the company whose employees to retrieve
     * @return List of Employee objects representing the employees who work for the given company
     */
    public static List<Employee> getCompanyEmployees(String ComID) {
        List<Employee> employees = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT * FROM employee WHERE ComID=?")) {
            st.setString(1, ComID);
            ResultSet rs = st.executeQuery();
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
     * Retrieves details of the company with the given email address.
     *
     * @param email Email address of the company to retrieve
     * @return Company object representing the company with the given email address
     */
    public static Company getCompanyByEmail(String email) {
        Company c = new Company();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT * FROM companies WHERE Email=?")) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                c.setUserName(rs.getString("Username"));
                c.setPassword(rs.getString("Password"));
                c.setName(rs.getString("Name"));
                c.setEmail(rs.getString("Email"));
                c.setCredit(rs.getInt("Credit"));
                c.setID(rs.getString("ID"));
                c.setAbout(rs.getString("About"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return c;
    }

    /**
     * Returns a list of employees who work for the company with the given ID.
     *
     * @param ComID ID of the company whose employees to retrieve
     * @return List of Employee objects representing the employees who work for the given company
     */
    public static List<Employee> getEmployee(String ComID) {
        List<Employee> employees = new ArrayList<>();
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT ID, FirstName, LastName, Email,About, Number,ComID FROM employee WHERE ComID = ?")) {
            st.setString(1, ComID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Employee e = new Employee();
                e.setID(rs.getString("ID"));
                e.setUemail(rs.getString("Email"));
                e.setUfname(rs.getString("FirstName"));
                e.setUlname(rs.getString("LastName"));
                e.setAbout(rs.getString("About"));
                e.setCompanyID(rs.getString("ComID"));
                e.setNumber(rs.getString("Number"));
                employees.add(e);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return employees;
    }

    /**
     * Checks if a company with the given email address and password exists in the database and logs in the user if
     * they do.
     *
     * @param email   Email address of the company to log in
     * @param pass    Password of the company to log in
     * @param session HttpSession object used to maintain the user's session
     * @return true if the login was successful, false otherwise
     */
    public boolean login(String email, String pass, HttpSession session) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("SELECT Email, Password FROM companies WHERE Email=? AND Password=?")) {
            st.setString(1, email);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Company c = CompanyService.getCompanyByEmail(email);
                session.setAttribute("ID", c.getID());
                session.setAttribute("Name", c.getName());
                session.setAttribute("Type", "Company");
                AdminService.setSession(c.getID(), "Company");
                System.out.println("========================");
                System.out.println("Logged in Company: " + c.getID());
                return true;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return false;
    }

    /**
     * Update Company
     *
     * @param c The Company object containing the updated information.
     * @return The status code indicating the success or failure of the update operation.
     */
    public int update(Company c) {
        //Prepare Query
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("UPDATE companies SET Username= ?, Name=?, About=?, Email=?, Password=? WHERE ID=?")) {
            st.setString(1, c.getUserName());
            st.setString(2, c.getName());
            st.setString(3, c.getAbout());
            st.setString(4, c.getEmail());
            st.setString(5, c.getPassword());
            st.setString(6, c.getID());
            //Execute Statement
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Register New Company
     *
     * @param c The Company object containing the information of the new company to be registered.
     * @return The status code indicating the success or failure of the registration operation.
     */
    public int register(Company c) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("INSERT INTO companies(Username, Name, About, Email, Password, Credit) VALUES (?,?,?,?,?,0)")) {
            st.setString(1, c.getUserName());
            st.setString(2, c.getName());
            st.setString(3, c.getAbout());
            st.setString(4, c.getEmail());
            st.setString(5, c.getPassword());
            //Execute Statement
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;

    }

    /**
     * This method adds a new employee to the specified company.
     *
     * @param ComID The company to which the employee will be added.
     * @param EmpID The employee to add to the company.
     * @return The status code indicating the success or failure of the employee addition operation.
     */
    public int addEmployee(String EmpID, String ComID) {
        //Prepare Query
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("UPDATE employee SET ComID = ? WHERE ID =? ")) {
            st.setString(1, ComID);
            st.setString(2, EmpID);
            //Execute Statement
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * This method removes an employee from a company.
     *
     * @param EmpID The ID of the employee to be removed.
     * @return The status code indicating the success or failure of the employee removal operation.
     */
    public int removeEmployee(String EmpID) {
        //Prepare Query
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("UPDATE employee SET ComID = NULL WHERE ID =? ")) {
            st.setString(1, EmpID);
            //Execute Statement
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Delete a Company
     *
     * @param ComID The ID of the company to be deleted.
     * @return The status code indicating the success
     */
    public int deleteCompany(String ComID) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("DELETE FROM companies WHERE ID=? ")) {
            st.setString(1, ComID);
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    /**
     * Add credit to a company's account.
     *
     * @param ComID The ID of the company to add credit to.
     * @return The status code indicating the success
     */
    public int addCredit(String ComID) {
        try (Connection con = SqlConnection.dbConnector();
             PreparedStatement st = con.prepareStatement("UPDATE companies SET Credit = 100 WHERE ID =? ")) {
            st.setString(1, ComID);
            //Execute Statement
            return st.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return 0;
    }
}
