using System;
using System.Data;
using System.Data.Odbc;

namespace deul
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string gid = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGotraData();
            }
        }

        protected void ADD_Click(object sender, EventArgs e)
        {
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            string gotraName = gname.Text.Trim();
            if (!string.IsNullOrEmpty(gotraName))
            {
                using (OdbcConnection connection = new OdbcConnection(connectionString))
                {
                    try
                    {

                        connection.Open();
                        using (OdbcCommand comm2 = new OdbcCommand("SELECT MAX(gid) as gid FROM gotra", connection))
                        {
                            using (OdbcDataReader d2 = comm2.ExecuteReader())
                            {
                                if (d2.Read())
                                {
                                    gid = Convert.ToString(d2["gid"]);
                                    if (gid == "")
                                    {
                                        gid = "0";
                                    }
                                    gid = Convert.ToString(int.Parse(gid) + 1);

                                }
                                else
                                {
                                    gid = "1";
                                    Response.Write("<script>alert('gid? !');</script>");
                                    
                                }
                                
                            }

                            string query = "INSERT INTO gotra(gid,gname) VALUES('" + gid + "','" + gname.Text.Trim() + "')";

                            using (OdbcCommand command = new OdbcCommand(query, connection))
                            {
                               // Response.Write("<script>alert('opened 2 !');</script>");
                                using (OdbcDataReader d = command.ExecuteReader())
                                {
                                    Response.Write("<script>alert('saved !');</script>");
                                    string script = "window.open('a_addgotra.aspx','_self');";
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
            }
            else
            {
                Response.Write("<script>alert('Please enter a gotra name');</script>");
            }
        }

        private void LoadGotraData()
        {
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";

            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Fetch gotra data
                    string query = "SELECT gid, gname FROM gotra";

                    using (OdbcCommand command = new OdbcCommand(query, connection))
                    {
                        using (OdbcDataAdapter adapter = new OdbcDataAdapter(command))
                        {
                            DataTable dataTable = new DataTable();
                            adapter.Fill(dataTable);

                            GridView1.DataSource = dataTable;
                            GridView1.DataBind();
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
