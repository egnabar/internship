using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Odbc;

namespace deul
{
    public partial class WebForm16 : System.Web.UI.Page
    {
        public string username
        {
            get
            {
                return Uname.Text;
            }
            set
            {
                Uname.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username2"] != null)
                {
                    username = Session["Username2"].ToString();
                }
            }

            LoadUserDetails();

        }
        int mid = 0;
        string fullname = string.Empty ;
        private void LoadUserDetails()
        {
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";

            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {
                    connection.Open();


                    string query = "SELECT mahajan2.mid as id, fname, mahajan2.mname, lname, phoneno, email FROM mahajan2 WHERE muname='"+username+"'";

                    using (OdbcCommand command = new OdbcCommand(query, connection))
                    {
                        

                        using (OdbcDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                fullname = reader["fname"].ToString() + " " + reader["mname"].ToString() + " " + reader["lname"].ToString();
                                name.Text = fullname;

                                phoneno.Text = reader["phoneno"] != DBNull.Value ? reader["phoneno"].ToString() : string.Empty;
                                
                                email.Text = reader["email"] != DBNull.Value ? reader["email"].ToString() : string.Empty;
                                mahajanid.Text = reader["id"].ToString();
                                
                            }
                            else
                            {
                                Response.Write("<script>alert('Not logged in');</script>");
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
        }
    }
}