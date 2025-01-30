using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace deul
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('button clicked');</script>");
            string constring = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            OdbcConnection con = new OdbcConnection(constring);
            con.Open();
            OdbcCommand comm = new OdbcCommand("SELECT * FROM users WHERE uname='" + username.Text.Trim() + "'AND pass='" + password.Text + "'", con);
            OdbcDataReader nrows = comm.ExecuteReader();
            if (nrows.HasRows)
            {
                Session["Username"] = username.Text.Trim();
                Response.Write("<script>alert('login successful!!');</script>");
                //Session["adminuser"] = username.Text.Trim();
                string script = "window.open('a_homepage.aspx','_self');";
                ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

            }
            else
            {
                Response.Write("<script>alert('invalid credentials');</script>");
            }
            con.Close();

        }

        protected void username_TextChanged(object sender, EventArgs e)
        {

        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
