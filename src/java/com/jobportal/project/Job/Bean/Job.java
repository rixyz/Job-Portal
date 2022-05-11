/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jobportal.project.Job.Bean;

/**
 *
 * @author RIX
 */
public class Job {

    private String Location;
    private int Vacancy;
    private String Iplace;
    private String deadline;
    private String salary;
    private String skills;
    private String company;
    private int Cid;
    private int Jid;
    
    public int getJid() {
        return Jid;
    }

    public void setJid(int jid) {
        Jid = jid;
    }
    
    public int getCid() {
        return Cid;
    }

    public void setCid(int cid) {
        Cid = cid;
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

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

}
