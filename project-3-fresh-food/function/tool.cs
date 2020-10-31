using DTO_Data_Transfer_Object_;
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
namespace project_3_fresh_food.function
{
    public class tool
    {
        const string ClientId = "5c31a53dda3c8e0";

        public string insertavt(getimage model)
        {
            return Upload(model);
        }
        [HttpPost]
        public string Upload(getimage model)
        {


            string link = "";
            List<string> urls = new List<string>();

            foreach (var item in model.anh)
            {
                byte[] file = new byte[item.InputStream.Length];
                item.InputStream.Read(file, 0, file.Length);

                var url = UploadOnImgur(file);

                link = url;

                urls.Add(url);

               
            }
            return link;
           
        }

        public string UploadOnImgur(byte[] file)
        {
            string url = string.Empty;

            using (var w = new WebClient())
            {
                w.Headers.Add("Authorization", "Client-ID " + ClientId);
                var values = new NameValueCollection
                    {
                        { "image", Convert.ToBase64String(file) }
                    };

                byte[] response = w.UploadValues("https://api.imgur.com/3/upload.xml", values);

                var xml = XDocument.Load(new MemoryStream(response));

                url = xml.Root.Element("link").Value;
            }

            return url;
        }
    }
}