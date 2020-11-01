﻿using BLL_Business_Logic_Layer__;
using BLL_Business_Logic_Layer__.ServiceInterface;
using DTO_Data_Transfer_Object_;
using Mailjet.Client;
using Mailjet.Client.Resources;
using Newtonsoft.Json.Linq;
using project_3_fresh_food.function;
using System;
using System.ComponentModel.Design;
using System.Web.Mvc;


namespace project_3_fresh_food.Controllers
{
    
    public class AccountController : Controller
    {
        getimage img = new getimage();
        tool to = new tool();
        IAccountBll acc = new KHACH_HANG_BLL();
        // GET: Account
        // Xử lý các sự kiện liên quan đến tài khoản
        public ActionResult Login()
        {
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult Sent()
        {
            return View();
        }
        public ActionResult Verification()
        {
            return View();
        }
        public ActionResult FillInfo(string tentk,string mk, KHACH_HANG KHACH_HANG)
        {
            if(tentk!=null)
            addinfo(tentk,mk, KHACH_HANG);
            return View();
        }
        public void addinfo(string tentk,string mk, KHACH_HANG KHACH_HANG)
        {
           
            acc.fillinfo(tentk,mk, insertimg(img), KHACH_HANG);
        }
        public void DoRegister(KHACH_HANG KHACH_HANG)
        {


            string code = Guid.NewGuid().ToString();
            acc.DoRegister(KHACH_HANG, code);
            // sendmail(KHACH_HANG.email,code);
            RunAsync(KHACH_HANG.email, code).Wait();


        }
        public ActionResult Active(string code)
        {
            try//nếu khách hàng vào trang active mà k có code xác nhận sẽ điều hướng về trang đăng nhập
            {
                ViewBag.status = acc.active(code); 
                return View();
            }
           catch
            {
                return View("Login");


            }

          

        }
        public int ActiveAcc(string code)
        {
          
            return acc.active(code);
        }    
        static async System.Threading.Tasks.Task RunAsync(string mail, string code)
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
            body = body.Replace("{{link}}", "https://localhost:44389/Account/Active?code=" + code);
            MailjetClient client = new MailjetClient("f18cca5a5d22850f3d2516fa4c870662", "9f0760fcb4f15f7a853921e3eecdb978")
            {
                Version = ApiVersion.V3_1,
            };
            MailjetRequest request = new MailjetRequest
            {
                Resource = Send.Resource,
            }
               .Property(Send.Messages, new JArray {
                new JObject {
                 {"From", new JObject {
                  {"Email", "doremon209a@gmail.com"},
                  {"Name", "Fresh Food"}
                  }},
                 {"To", new JArray {
                  new JObject {
                   {"Email", mail},
                   {"Name", "Khách"}
                   }
                  }},
                 {"Subject", "Vui lòng xác nhận email của bạn !"},
                 {"HTMLPart", body}
                 }
                   });
            MailjetResponse response = await client.PostAsync(request);
          
        }
     
        public (int, string) DoLogin(KHACH_HANG KHACH_HANG)
        {
            return acc.DoLogin(KHACH_HANG);
        }

        public void resendmail(string tk,string mail)
        {
            string code = Guid.NewGuid().ToString();
            acc.resend(tk,mail,code);
            RunAsync(mail, code).Wait();
        }    
     
        public string insertimg(getimage img1 )
        {
            return to.insertavt(img1);
        }    
    }
}