/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;


import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ManojKasun
 */
public class SmsUtilitiesModel {
  // Find your Account Sid and Token at twilio.com/user/account
  public static final String ACCOUNT_SID = "AC5d38b6a824cc3d1c872055eeef4f45b0";
  public static final String AUTH_TOKEN = "3f566d4bd1ecf59ddcfbdcd0937103e1";
  String content;
  HttpServletResponse response;
  
    public SmsUtilitiesModel(String content,String phone) throws IOException {
        try{
           this.content = content;
         Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                new com.twilio.type.PhoneNumber(phone),
                new com.twilio.type.PhoneNumber("+14136761055"),
                content)
            .create();

        }catch (Exception e){
            System.out.println(e);
        }
        finally{
            System.out.println("in the sms utilities class  "+phone);
            //response.sendRedirect("./customer/dashboard.jsp");
        }
          
    }


  
  
}
