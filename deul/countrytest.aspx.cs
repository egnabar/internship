using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;

using System.Web.Services;
using Newtonsoft.Json;
using System.Web.Script.Services;

namespace deul
{
    public partial class countrytest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strurltest = String.Format("https://www.universal-tutorial.com/api/countries/");
            HttpWebRequest requestObjGet = (HttpWebRequest)WebRequest.Create(strurltest);
            requestObjGet.Method = "GET";

            requestObjGet.Headers["Authorization"] = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJvbmV0YXN0aWN1bml0eUBnbWFpbC5jb20iLCJhcGlfdG9rZW4iOiJTZ2R6WHZtT3B4bGlrUGEzY2x3dHZ0RnZpYmJIRlNzYkZLN1M3eHpCNWV2ck9WZWdMQThuR3RBX3UzRHBIRHY5dUJBIn0sImV4cCI6MTcyNDU1MTU1OH0.3wi1i0VmCPzuYgCui6lhF5ETe6GFK9nKdorn8y8txGw";
            requestObjGet.Accept = "application/json";
            HttpWebResponse responseObjGet = null;
            responseObjGet = (HttpWebResponse)requestObjGet.GetResponse();
            string strresulttest = null;
            using (Stream stream = responseObjGet.GetResponseStream())
            {
                StreamReader sr = new StreamReader(stream);
                strresulttest = sr.ReadToEnd();
                sr.Close();
                TextBox1.Text = strresulttest;
                Console.Write("<script>alert('" + strresulttest + "');</script>");
            }
        }
        
        
    }
}