
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using Mailjet.Client;
using Mailjet.Client.Resources;
using Newtonsoft.Json.Linq;
namespace tool
{
    public class Class1
    {
    public async System.Threading.Tasks.Task RunAsync(string mail, string code)
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
            MailjetClient client = new MailjetClient("api key ", "api key của tên miền ")
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
                  {"Email", "thucphamtk16@gmail.com"},
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
        //chèn ảnh
        public  Image GetImageFromUrl(string url)
        {
            HttpWebRequest httpWebRequest = (HttpWebRequest)HttpWebRequest.Create(url);

            using (HttpWebResponse httpWebReponse = (HttpWebResponse)httpWebRequest.GetResponse())
            {
                using (Stream stream = httpWebReponse.GetResponseStream())
                {
                    return Image.FromStream(stream);
                }
            }
        }
        public byte[] ImageToByteArray(System.Drawing.Image imageIn)
        {
            using (var ms = new MemoryStream())
            {
                imageIn.Save(ms, imageIn.RawFormat);
                return ms.ToArray();
            }
        }

    }
}

