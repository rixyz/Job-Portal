package JobPortal.Model;

/**
 * @author Dell
 */
public class Employee {

    private String Uemail, Ufname, Ulname, UserName, Password, About, id, Number, CompanyID;

    public String getNumber() {
        return Number;
    }

    public void setNumber(String number) {
        Number = number;
    }

    public String getUemail() {
        return Uemail;
    }

    public void setUemail(String uemail) {
        Uemail = uemail;
    }

    public String getUfname() {
        return Ufname;
    }

    public void setUfname(String ufname) {
        Ufname = ufname;
    }

    public String getUlname() {
        return Ulname;
    }

    public void setUlname(String ulname) {
        Ulname = ulname;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getAbout() {
        return About;
    }

    public void setAbout(String about) {
        this.About = about;
    }

    public void setID(String id) {
        this.id = id;
    }

    public String getID() {
        return id;
    }

    public String getCompanyID() {
        return CompanyID;
    }

    public void setCompanyID(String companyID) {
        CompanyID = companyID;
    }

    public String getFullname() {
        return Ufname + " " + Ulname;
    }


}
