/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author ManojKasun
 */
public class EmailModel {
    private String host ;
    private String port ;
    private String sender;
    private String pass;

    public EmailModel() {
        this.setHost("smtp.gmail.com");
        this.setPort ("587");
        this.setSender("info.xyz.hotel@gmail.com");
        this.setPass("xyzHotel");
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getPort() {
        return port;
    }

    public void setPort(String port) {
        this.port = port;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass  = pass;
    }
    
    
    
}
