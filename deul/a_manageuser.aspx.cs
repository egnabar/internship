using System;
using System.Data;
using System.Data.Odbc;

 namespace deul
    {
        public partial class WebForm10 : System.Web.UI.Page
        {
            private string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";

            protected void Page_Load(object sender, EventArgs e)
            {
                
                
                    LoadUserData();
                
            }

        private void LoadUserData()
        {
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {

                    connection.Open();

                    string query = "select userid,uname,utname from users,utype where users.utid=utype.utid";
                    Console.WriteLine("Query: " + query);

                    using (OdbcCommand command = new OdbcCommand(query, connection))
                    {
                        using (OdbcDataAdapter adapter = new OdbcDataAdapter(command))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            Console.WriteLine("Rows fetched: " + dataTable.Rows.Count);

                            if (dataTable.Rows.Count > 0)
                            {
                                GridView1.Visible = true;
                                GridView1.DataSource = dataTable;
                                GridView1.DataBind();
                            }
                            else
                            {
                                GridView1.Visible = false;
                                Response.Write("<script>alert('No data found.');</script>");
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


        protected void AddUser(object sender, EventArgs e)
            {
                string uname = txtAddUserName.Text;
            string utname = ddlUserType.SelectedItem.Value;
            string password = txtAddPassword.Text;
            string utid = string.Empty;
            string uid = string.Empty ;
            
            
            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();
            using (OdbcCommand comm2 = new OdbcCommand("SELECT MAX(userid)as uid FROM users", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        uid = Convert.ToString(d2["uid"]);
                        if (uid == "")
                        {
                            uid = "0";
                        }
                        uid = Convert.ToString(int.Parse(uid) + 1);

                    }
                    else
                    {
                        uid = "1";
                        Response.Write("<script>alert('mid? !');</script>");
                        string script = "window.open('resistration.aspx','_self');";
                        ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);
                    }
                    
                }

            }
            using (OdbcCommand comm2 = new OdbcCommand("SELECT utid FROM utype WHERE utname='" + utname + "'", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        utid = Convert.ToString(d2["utid"]);
                        
                    }
                    
                }

            }

           string query = "INSERT INTO users(userid,uname,utid,pass,sid) VALUES('" + uid + "','" + uname + "','" + utid + "','" + password + "','a')";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('saved !');</script>");
                    string script = "window.open('a_manageuser.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }
        }

            protected void DeleteUser(object sender, EventArgs e)
            {
                string uname = txtDeleteUserName.Text;
                OdbcConnection con2 = new OdbcConnection(connectionString);
                con2.Open();

                string query = "DELETE FROM users WHERE uname = '" + uname + "'";

                using (OdbcCommand command = new OdbcCommand(query, con2))
                {
                    // Response.Write("<script>alert('opened 2 !');</script>");
                    using (OdbcDataReader d = command.ExecuteReader())
                    {
                        Response.Write("<script>alert('deleted !');</script>");
                        string script = "window.open('a_manageuser.aspx','_self');";
                        ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                    }

                }

        }
        
            protected void ModifyUserType(object sender, EventArgs e)
            {
                string uname = txtModifyUserName.Text;
                string utname = ddlModifyUserType.SelectedItem.Value;
                string utid = string.Empty;

                OdbcConnection con2 = new OdbcConnection(connectionString);
                con2.Open();

                using (OdbcCommand comm2 = new OdbcCommand("SELECT utid FROM utype WHERE utname='" + utname + "'", con2))
                {
                    using (OdbcDataReader d2 = comm2.ExecuteReader())
                    {
                        if (d2.Read())
                        {
                            utid = Convert.ToString(d2["utid"]);

                        }

                    }

                }
            string query = "UPDATE users SET utid = '"+utid+"' WHERE uname = '"+uname+"'";

                using (OdbcCommand command = new OdbcCommand(query, con2))
                {
                // Response.Write("<script>alert('opened 2 !');</script>");
                    using (OdbcDataReader d = command.ExecuteReader())
                    {
                        Response.Write("<script>alert('updated !');</script>");
                        string script = "window.open('a_manageuser.aspx','_self');";
                        ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                    }

                }
            
        }
        

}
    }

    