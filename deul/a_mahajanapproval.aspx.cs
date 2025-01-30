

using System;
using System.Data.Odbc;

namespace deul
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
        public string id = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            
          
               id= LoadUserDetails();
                
            
        }
        private string LoadUserDetails()
        {
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";

            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {
                    connection.Open();


                    string query = "SELECT mahajan2.mid as id, fname, mahajan2.mname, lname, phoneno, add1, add2, add3, add4, dob, kname, mutt.mname as muttname, gname, adharno,panno, email FROM mahajan2,gotra,mutt,kuldaivat WHERE mahajan2.gid = gotra.gid AND mahajan2.muttid = mutt.mid AND mahajan2.kid = kuldaivat.kid AND  mstatus IS NULL";

                    using (OdbcCommand command = new OdbcCommand(query, connection))
                    {
                        

                        using (OdbcDataReader reader = command.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                id = reader["id"].ToString();
                                fname.Text = reader["fname"] != DBNull.Value ? reader["fname"].ToString() : string.Empty;
                                mname.Text = reader["mname"] != DBNull.Value ? reader["mname"].ToString() : string.Empty;
                                lname.Text = reader["lname"] != DBNull.Value ? reader["lname"].ToString() : string.Empty;
                                phoneno.Text = reader["phoneno"] != DBNull.Value ? reader["phoneno"].ToString() : string.Empty;
                                add1.Text = reader["add1"] != DBNull.Value ? reader["add1"].ToString() : string.Empty;
                                add2.Text = reader["add2"] != DBNull.Value ? reader["add2"].ToString() : string.Empty;

                                dob.Text = reader["dob"] != DBNull.Value ? Convert.ToDateTime(reader["dob"]).ToString("yyyy-MM-dd") : string.Empty;
                                kuldaivat.Text = reader["kname"] != DBNull.Value ? reader["kname"].ToString() : string.Empty;
                                mutt.Text = reader["muttname"] != DBNull.Value ? reader["muttname"].ToString() : string.Empty;
                                gotra.Text = reader["gname"] != DBNull.Value ? reader["gname"].ToString() : string.Empty;
                                panno.Text = reader["panno"] != DBNull.Value ? reader["panno"].ToString() : string.Empty;
                                adharno.Text = reader["adharno"] != DBNull.Value ? reader["adharno"].ToString() : string.Empty;
                                email.Text = reader["email"] != DBNull.Value ? reader["email"].ToString() : string.Empty;
                                
                                panpicLink.NavigateUrl = $"~/documents/{id}p.jpg";
                                panpicLink.Target = "_blank"; 

                                adharpicLink.NavigateUrl = $"~/documents/{id}a.jpg";
                                adharpicLink.Target = "_blank"; 
                            }
                            else
                            {
                                Response.Write("<script>alert('No user details found');</script>");
                                string script = "window.open('a_homepage.aspx','_self');";
                                ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                }
            }
            return id;
        }
        protected void ChangeStatus(string action)
        {
            string mahajanType = mahajanDropdown.SelectedItem.Value; // Dropdown value
            string mid = id;

            using (OdbcConnection con = new OdbcConnection(connectionString))
            {
                con.Open();
                switch (action.ToLower())
                {
                    case "accept":
                        UpdateStatus(con, mid, "a", mahajanType);
                        Response.Write("<script>alert('new user accepted !!');</script>");
                        break;

                    case "hold":
                        UpdateStatus(con, mid, "ne", mahajanType);
                        Response.Write("<script>alert('new user on hold !!');</script>");
                        break;

                    case "reject":
                        DeleteUser(con, mid);
                        break;
                }

                con.Close();
            }

            // Redirect to the homepage after operation
            
        }

        private void UpdateStatus(OdbcConnection con, string mid, string status, string mahajanType)
        {
            string mtype = mahajanType == "mahajan" ? "m" : "n";

            string query = "UPDATE mahajan2 SET mstatus = '"+status+"', mtype = '"+mtype+"' WHERE mid = '"+mid+"'";

            using (OdbcCommand cmd = new OdbcCommand(query, con))
            {             
                cmd.ExecuteNonQuery();
            }
        }

        private void DeleteUser(OdbcConnection con, string mid)
        {
            string query = "DELETE FROM mahajan2 WHERE mid = ?";

            using (OdbcCommand cmd = new OdbcCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@mid", mid);

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('rejected');</script>");
            }
        }

        protected void AcceptButton_Click(object sender, EventArgs e)
        {
            ChangeStatus("accept");
           
            string script = "window.open('a_mahajanapproval.aspx','_self');";
            ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);
        }

        protected void RejectButton_Click(object sender, EventArgs e)
        {
            ChangeStatus("reject");
            string script = "window.open('a_mahajanapproval.aspx','_self');";
            ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);
        }

        protected void HoldButton_Click(object sender, EventArgs e)
        {
            ChangeStatus("hold");
            string script = "window.open('a_mahajanapproval.aspx','_self');";
            ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);
        }
    }
}
