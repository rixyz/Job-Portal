/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package JobPortal.Model;

public class Job {

    private String Location, Iplace, deadline, salary, title, company, ComID, ID, About, Requirement, Type;
    private int Vacancy, boosted;

    public int getBoosted() {
        return boosted;
    }

    public void setBoosted(int boosted) {
        this.boosted = boosted;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getComID() {
        return ComID;
    }

    public void setComID(String comID) {
        this.ComID = comID;
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        Location = location;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public int getVacancy() {
        return Vacancy;
    }

    public void setVacancy(int vacancy) {
        Vacancy = vacancy;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String Deadline) {
        deadline = Deadline;
    }

    public String getIplace() {
        return Iplace;
    }

    public void setIplace(String iplace) {
        Iplace = iplace;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAbout() {
        return About;
    }

    public void setAbout(String about) {
        About = about;
    }

    public String getRequirement() {
        return Requirement;
    }

    public void setRequirement(String requirement) {
        Requirement = requirement;
    }

    public String getType() {
        return Type;
    }

    public void setType(String type) {
        Type = type;
    }
}
