/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.jobportal.project.Job.Bean;

/**
 *
 * @author RIX
 */
public class TotalApplication {

    private String Jid;
    private String Eid;
    private String Approved;

    
    public String getApproved() {
        return Approved;
    }

    public void setApproved(String approved) {
        Approved = approved;
    }

    public String getJid() {
        return Jid;
    }

    public void setJid(String jid) {
        Jid = jid;
    }

    public String getEid() {
        return Eid;
    }

    public void setEid(String eid) {
        Eid = eid;
    }
}
