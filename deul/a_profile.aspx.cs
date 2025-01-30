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
    public partial class WebForm25 : System.Web.UI.Page
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
                // Retrieve the username from the session variable
                if (Session["Username"] != null)
                {
                    username = Session["Username"].ToString();
                }
            }

            LoadUserDetails();
        }
        int mid = 0;
        string username2 = string.Empty;
        private void LoadUserDetails()
        {
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";

            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {
                    connection.Open();


                    string query = "SELECT userid as id, uname, utname FROM users,utype WHERE users.utid = utype.utid and uname='" + username + "'";

                    using (OdbcCommand command = new OdbcCommand(query, connection))
                    {


                        using (OdbcDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                

                                utype.Text = reader["utname"] != DBNull.Value ? reader["utname"].ToString() : string.Empty;

                                
                                userid.Text = reader["id"].ToString();

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