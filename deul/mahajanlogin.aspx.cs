using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace deul
{
    public partial class mahajanlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        
        protected void submit_Click(object sender, EventArgs e)
        {
            string constring = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            using (OdbcConnection con = new OdbcConnection(constring))
            {
                try
                {
                    con.Open();

                    string query = "SELECT mstatus FROM mahajan2 WHERE muname = ? AND mpass = ?";
                    using (OdbcCommand comm = new OdbcCommand(query, con))
                    {
                        comm.Parameters.AddWithValue("?", username.Text.Trim());
                        comm.Parameters.AddWithValue("?", password.Text);

                        OdbcDataReader reader = comm.ExecuteReader();

                        if (reader.HasRows)
                        {
                            reader.Read();
                            string mstatus = reader["mstatus"]?.ToString();

                            if (mstatus == "a")
                            {
                                Response.Write("<script>alert('Login successful!');</script>");
                                Session["Username2"] = username.Text.Trim();
                                string script = "window.open('m_homepage.aspx', '_self');";
                                ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);
                            }
                            else
                            {
                                Response.Write("<script>alert('User yet to be approved');</script>");
                                string script = "window.open('m_homepage.aspx', '_self');";
                                ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Invalid credentials');</script>");
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('An error occurred: {ex.Message}');</script>");
                }
            }
        }

        protected void username_TextChanged(object sender, EventArgs e)
        {

        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
