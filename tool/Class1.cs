using Mailjet.Client;
using Mailjet.Client.Resources;
using Newtonsoft.Json.Linq;
using RestSharp;
using RestSharp.Authenticators;
using System;
namespace tool
{
    public class Class1
    {
        public void forgotPassAdmin(string mail, string newpass,string confirmationCode)
        {

            string body = @"<!DOCTYPE html>
                                <body style=""width:100%; height:100%; margin:0; padding:32px; font: normal normal normal 14px/21px Arial,sans-serif; color:#333; background-color:#f1f1f1; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%;"">
                                    <table class=""email-wrapper"" style=""width:100%; height:100%; margin:auto; padding:0; text-align:center; vertical-align:middle; border-spacing:0; border-collapse:collapse;""><tr><td>
    
                                    <table class=""email-layout"" style=""width:450px; height:300px; margin:auto; padding:0; vertical-align:middle; border-spacing:0; border-collapse:collapse;"">
        
                                        <tbody class=""email-body""><tr><td style=""text-align:left;"">     
                                            <div style=""padding:21px 32px; background-color:#fff; border-bottom:2px solid #e1e1e1; border-radius:3px;"">
                                                <h1 style=""font-size:21px; line-height:30px; font-weight:bold;"">Mật khẩu mới của bạn là {{pass}}</h1>
                                                <p>
                                                    Email này để xác nhận bạn đã quên mật khẩu vui lòng bấm vào link dưới để đặt mật khảu mới cho bạn<br>Nếu không phải bạn chỉ cần bỏ qua email này 1 cách an toàn
                                                </p>
                                                <p style=""padding:11px 0; text-align:left;"">
                                                    <a href=""{{link}}"" target=""_blank"" style=""padding:11px 21px; text-decoration:none; color:#fff !important; background-color:#42af5b; border:1px solid #358d49; border-radius:3px;"">Đặt lại mật khẩu</a>
                                                </p>
                                                <p>
                                                    Cheers,<br>
                                                    The Seven Bridges Team
                                                </p>
                                            </div>
                                        </td></tr></tbody>
        
                                        <tfoot class=""email-footer"" style=""text-align:center; font-weight:normal;""><tr><td style=""padding-top:32px;"">
                                            <div style=""color:#999;"">
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Get in touch</a> |
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Knowledge Center</a> |
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Log in</a>
                                            </div>
                                            <small style=""font-size:12px; color:#999;"">© 2016 Seven Bridges, Inc. 1 Broadway, 14th Floor, Cambridge, MA 02142<small>
                                        </td></tr></tfoot>
                                    </table>
        
                                    </td></tr></table>
                                </body>
                                </html>
                                <!-- partial -->
  
                                </body>
                                </html>";
            body = body.Replace("{{pass}}", newpass);
            body = body.Replace("{{link}}", "https://admin.tk16food.com/Admin/ComfimforgetPass?confirmationCode=" + confirmationCode + "&&newPass="+newpass);
           sendmail(mail, body, "Đặt lại mật khẩu của bạn");
        }
        public void confirmOrder(string mail,string madonhang)
        {
            string body = @"<!DOCTYPE html>
                                <body style=""width:100%; height:100%; margin:0; padding:32px; font: normal normal normal 14px/21px Arial,sans-serif; color:#333; background-color:#f1f1f1; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%;"">
                                    <table class=""email-wrapper"" style=""width:100%; height:100%; margin:auto; padding:0; text-align:center; vertical-align:middle; border-spacing:0; border-collapse:collapse;""><tr><td>
    
                                    <table class=""email-layout"" style=""width:450px; height:300px; margin:auto; padding:0; vertical-align:middle; border-spacing:0; border-collapse:collapse;"">
        
                                        <tbody class=""email-body""><tr><td style=""text-align:left;"">     
                                            <div style=""padding:21px 32px; background-color:#fff; border-bottom:2px solid #e1e1e1; border-radius:3px;"">
                                                <h1 style=""font-size:21px; line-height:30px; font-weight:bold;"">Almost there! Just confirm your email</h1>
                                                <p>
                                                    Please confirm your email to start searching and experimenting on Seven Bridges platform.
                                                </p>
                                                <p style=""padding:11px 0; text-align:left;"">
                                                    <a href=""{{link}}"" target=""_blank"" style=""padding:11px 21px; text-decoration:none; color:#fff !important; background-color:#42af5b; border:1px solid #358d49; border-radius:3px;"">Confirm email</a>
                                                </p>
                                                <p>
                                                    Cheers,<br>
                                                    The Seven Bridges Team
                                                </p>
                                            </div>
                                        </td></tr></tbody>
        
                                        <tfoot class=""email-footer"" style=""text-align:center; font-weight:normal;""><tr><td style=""padding-top:32px;"">
                                            <div style=""color:#999;"">
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Get in touch</a> |
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Knowledge Center</a> |
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Log in</a>
                                            </div>
                                            <small style=""font-size:12px; color:#999;"">© 2016 Seven Bridges, Inc. 1 Broadway, 14th Floor, Cambridge, MA 02142<small>
                                        </td></tr></tfoot>
                                    </table>
        
                                    </td></tr></table>
                                </body>
                                </html>
                                <!-- partial -->
  
                                </body>
                                </html>";
            body = body.Replace("{{link}}", "https://tk16food.com/guestEvent/confirmOrder?madonhang=" + madonhang);
            sendmail(mail, body,"Vui lòng xác nhận đơn hàng của bạn");
        }
        public  void confirm(string mail, string code)
        {
            string body = @"<!DOCTYPE html>
                                <body style=""width:100%; height:100%; margin:0; padding:32px; font: normal normal normal 14px/21px Arial,sans-serif; color:#333; background-color:#f1f1f1; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%;"">
                                    <table class=""email-wrapper"" style=""width:100%; height:100%; margin:auto; padding:0; text-align:center; vertical-align:middle; border-spacing:0; border-collapse:collapse;""><tr><td>
    
                                    <table class=""email-layout"" style=""width:450px; height:300px; margin:auto; padding:0; vertical-align:middle; border-spacing:0; border-collapse:collapse;"">
        
                                        <tbody class=""email-body""><tr><td style=""text-align:left;"">     
                                            <div style=""padding:21px 32px; background-color:#fff; border-bottom:2px solid #e1e1e1; border-radius:3px;"">
                                                <h1 style=""font-size:21px; line-height:30px; font-weight:bold;"">Almost there! Just confirm your email</h1>
                                                <p>
                                                    Please confirm your email to start searching and experimenting on Seven Bridges platform.
                                                </p>
                                                <p style=""padding:11px 0; text-align:left;"">
                                                    <a href=""{{link}}"" target=""_blank"" style=""padding:11px 21px; text-decoration:none; color:#fff !important; background-color:#42af5b; border:1px solid #358d49; border-radius:3px;"">Confirm email</a>
                                                </p>
                                                <p>
                                                    Cheers,<br>
                                                    The Seven Bridges Team
                                                </p>
                                            </div>
                                        </td></tr></tbody>
        
                                        <tfoot class=""email-footer"" style=""text-align:center; font-weight:normal;""><tr><td style=""padding-top:32px;"">
                                            <div style=""color:#999;"">
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Get in touch</a> |
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Knowledge Center</a> |
                                                <a href="""" target=""_blank"" style=""text-decoration:none; color:#446cb3 !important;"">Log in</a>
                                            </div>
                                            <small style=""font-size:12px; color:#999;"">© 2016 Seven Bridges, Inc. 1 Broadway, 14th Floor, Cambridge, MA 02142<small>
                                        </td></tr></tfoot>
                                    </table>
        
                                    </td></tr></table>
                                </body>
                                </html>
                                <!-- partial -->
  
                                </body>
                                </html>";
            body = body.Replace("{{link}}", "https://tk16food.com/Account/Active?code=" + code);
            sendmail(mail, body, "Vui lòng xác nhận mail của bạn");
        }
        public IRestResponse sendmail(string mail, string body,string tieude)
        {
          
            RestClient client = new RestClient();
            client.BaseUrl = new Uri("https://api.mailgun.net/v3");
            client.Authenticator =
                new HttpBasicAuthenticator("api",
                    "140382be91ae3beab3c7b1969d670b07-360a0b2c-7cf8abe2");
            RestRequest request = new RestRequest();
            request.AddParameter("domain", "tk16food.com", ParameterType.UrlSegment);
            request.Resource = "tk16food.com/messages";
            request.AddParameter("from", "Thực Phẩm sạch Freshfood@tk16food.com");
            request.AddParameter("to", mail);
            request.AddParameter("subject", tieude);
            request.AddParameter("html", body);
            request.Method = Method.POST;
            return client.Execute(request);
        }
    }
   
}

