package com.jobportal.project.Employee.Bean;

/**
 *
 * @author Dell
 */
public class Employee {

//    @Override
//    public String toString() {
//        return "Employee [Uemail=" + Uemail + ", Ufname=" + Ufname + ", Ulname=" + Ulname + ", UserName=" + UserName
//                + ", Password=" + Password + ", gen=" + gen + ", exp=" + exp + ", skill=" + skill + "]";
//    }
    private String Uemail, Ufname, Ulname, UserName, Password, gen, exp, skill, id, Number;

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

    public String getGen() {
        return gen;
    }

    public void setGen(String gen) {
        this.gen = gen;
    }

    public String getExp() {
        return exp;
    }

    public void setExp(String exp) {
        this.exp = exp;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public void setID(String id) {
        this.id = id;
    }

    public String getID() {
        return id;
    }
}
