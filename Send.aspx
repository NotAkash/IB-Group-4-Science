<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Send.aspx.cs" Inherits="Send" %>
<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net.Sockets" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace=" System.Net" %>
<!DOCTYPE html>


<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["OnLineConnectionString"].ToString());
        //string conString = ConfigurationManager.ConnectionStrings["connstrN"].ConnectionString;

        try
        {
            NameValueCollection Nvc = Request.Form;
            StringBuilder bodyMsg = new StringBuilder();
           string msgStr= Nvc["contact"].Trim();
           if (msgStr.ToString() == "Contact")
            {

                bodyMsg.Append("<tr><td></br><span>You have recieved a new enquiry through the contact form on the IB Group 4 website.\n\n</span></td></tr></table></div>");
                bodyMsg.Append("<div><br/><table><tr><td>Name: <span>" + Nvc["Name"].Trim() + "</span></td></tr>");
                bodyMsg.Append("<tr><td>Email: " + Nvc["email"].Trim() + "</td></tr>");
                bodyMsg.Append("<tr><td>Subject: " + Nvc["subject"].Trim() + "</td></tr>");
                bodyMsg.Append("<tr><td>Message: " + Nvc["message"].Trim() + "</td></tr>");
                bodyMsg.Append("<tr><td><span></span></td></tr>");
                bodyMsg.Append("</table></td></tr>");
                bodyMsg.Append("<tr><td><span></span></td></tr>");
                bodyMsg.Append("<tr><td><span><br/><br/></span></td></tr>");
                bodyMsg.Append("<tr><td><span>This is a system generated email. Please do not reply to this email.</span></td></tr></table></div>");
                bodyMsg.Append("<tr><td></td></tr></table></div>");
               
                //bodyMsg.Append("<div><table><tr><td>Dear <span>" + Nvc["Name"].Trim() + ",</span></td></tr>");
                //bodyMsg.Append("<tr><td><br/>" + Nvc["message"].Trim() + "</td></tr>");
                //bodyMsg.Append("<tr><td><span></span></td></tr>");
                //bodyMsg.Append("</table></td></tr>");
                //bodyMsg.Append("<tr><td><span></span></td></tr>");
                //bodyMsg.Append("<tr><td></br><span>Thanks & Regards</span></td></tr></table></div>");
                //bodyMsg.Append("<tr><td><span></span></td></tr>");
                //bodyMsg.Append("<tr><td><span>System generated email, please do not reply to this email.</span></td></tr></table></div>");
                //bodyMsg.Append("<tr><td></td></tr></table></div>");
            }
            else
            {
                bodyMsg.Append("<tr><td></br><span>You have recieved a new entry request through the upload form on the IB Group 4 website.\n\n</span></td></tr></table></div>");
                bodyMsg.Append("<div><br/><table><tr><td>Name: <span>" + Nvc["Name"].Trim() + "</span></td></tr>");
                bodyMsg.Append("<tr><td>Email: " + Nvc["email"].Trim() + "</td></tr>");
                bodyMsg.Append("<tr><td><br/>School Name: " + " " + Nvc["school"].Trim() + "</td></tr>");
                bodyMsg.Append("<tr><td>Group Name: " + " " + Nvc["group"].Trim() + "</td></tr>");
                bodyMsg.Append("<tr><td><br/>Video Link: " + " " + Nvc["link"].Trim() + "</td></tr>");
                bodyMsg.Append("<tr><td><br/>Message: " + Nvc["message"].Trim() + "</td></tr>");
                bodyMsg.Append("<tr><td><span></span></td></tr>");


                bodyMsg.Append("</table></td></tr>");
                bodyMsg.Append("<tr><td><span></span></td></tr>");

                bodyMsg.Append("<tr><td><span><br/><br/></span></td></tr>");
                bodyMsg.Append("<tr><td><span>This is a system generated email. Please do not reply to this email.</span></td></tr></table></div>");
                bodyMsg.Append("<tr><td></td></tr></table></div>");
               
                //bodyMsg.Append("<div><table><tr><td>Dear <span>" + Nvc["Name"].Trim() + ",</span></td></tr>");
                //bodyMsg.Append("<tr><td><br/>School Name:-" +" "+ Nvc["school"].Trim() + "</td></tr>");
                //bodyMsg.Append("<tr><td><br/>Group Name:-" + " " + Nvc["group"].Trim() + "</td></tr>");
                //bodyMsg.Append("<tr><td><br/>link of youtube Vedio:-" + " " + Nvc["link"].Trim() + "</td></tr>");
                //bodyMsg.Append("<tr><td><span></span></td></tr>");


                //bodyMsg.Append("</table></td></tr>");
                //bodyMsg.Append("<tr><td><span></span></td></tr>");

                //bodyMsg.Append("<tr><td></br><span>Thanks & Regards</span></td></tr></table></div>");
                //bodyMsg.Append("<tr><td><span></span></td></tr>");
                
                //bodyMsg.Append("<tr><td></td></tr></table></div>");
            
            }
            
            
            
            
            MailMessage msg = new MailMessage();
            msg.To.Add(new MailAddress("u.singhal@british-school.org"));
            
            
            
            msg.From = new MailAddress(Nvc["email"].Trim());
            if (msgStr.ToString() == "Contact")
            {
                msg.Subject = "IB Group 4 Contact Page - Enquiry";
            }
            else
            {
                msg.Subject = "IB Group 4 Upload Page - New Entry";
            }
           
            msg.IsBodyHtml = true;
            //msg.Body = "\n\n" + "=======================================================" + "\n" + "Dear " + Nvc["Name"].Trim() + "\n\n "+ Nvc["message"].Trim() ;
            msg.Body = bodyMsg.ToString();
            SmtpClient client = new SmtpClient();
            //client.UseDefaultCredentials = true;
            client.EnableSsl = false;
            client.Port = 25;
            client.Host = "mail.british-school.org";
            client.Send(msg);
            Response.Redirect("index.html", false);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        
        }
        
        
        
        
    }
    </script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
