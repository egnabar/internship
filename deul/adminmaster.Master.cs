using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace deul
{
    public partial class adminmaster : System.Web.UI.MasterPage
    {
        public string username
        {
            get
            {
                return Label2.Text;
            }
            set
            {
                Label2.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string utype = string.Empty;
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    username = Session["Username"].ToString();
                }
            }
            string constring = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            OdbcConnection con = new OdbcConnection(constring);
            con.Open();
            OdbcCommand comm = new OdbcCommand("select utname from users, utype where users.utid = utype.utid and uname = '" + username + "'", con);
            OdbcDataReader nrows = comm.ExecuteReader();
            if (nrows.HasRows)
            {
                nrows.Read();
                Session["utype"] = Convert.ToString(nrows["utname"]);
                utype = Session["utype"].ToString();
            }
            con.Close();

            if (utype == "admin" || utype == "superadmin")
            {
                string script = @"
                <script type='text/javascript'>
                    window.onload = function() {
                        var links = document.getElementsByClassName('nav-link');
                        for (var i = 0; i < links.length; i++) {
                            if (links[i].classList.contains('disabled')) {
                                links[i].classList.remove('disabled');
                            } 
                        }
                    }
                </script>";

                // Register the script to be executed on the client side
                Page.ClientScript.RegisterStartupScript(this.GetType(), "ToggleDisabledClass", script, false);
            }
        }
    }
}
