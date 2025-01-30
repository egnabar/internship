using System;
using System.Data;
using System.Data.Odbc;

namespace deul
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string kid = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadKuldaivatData();
            }
        }

        protected void ADD_Click(object sender, EventArgs e)
        {
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            string kuldaivatName = kname.Text.Trim();
            if (!string.IsNullOrEmpty(kuldaivatName))
            {
                using (OdbcConnection connection = new OdbcConnection(connectionString))
                {
                    try
                    {

                        connection.Open();
                        using (OdbcCommand comm2 = new OdbcCommand("SELECT MAX(kid) as kid FROM kuldaivat", connection))
                        {
                            using (OdbcDataReader d2 = comm2.ExecuteReader())
                            {
                                if (d2.Read())
                                {
                                    kid = Convert.ToString(d2["kid"]);
                                    if (kid == "")
                                    {
                                        kid = "0";
                                    }
                                    kid = Convert.ToString(int.Parse(kid) + 1);

                                }
                                else
                                {
                                    kid = "1";
                                    Response.Write("<script>alert('kid? !');</script>");
                                    
                                }
                                
                            }

                            string query = "INSERT INTO kuldaivat(kid,kname) VALUES('" + kid + "','" + kname.Text.Trim() + "')";

                            using (OdbcCommand command = new OdbcCommand(query, connection))
                            {
                                Response.Write("<script>alert('opened 2 !');</script>");
                                using (OdbcDataReader d = command.ExecuteReader())
                                {
                                    Response.Write("<script>alert('saved !');</script>");
                                    string script = "window.open('a_addkuldaivat.aspx','_self');";
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
                Response.Write("<script>alert('Please enter a kuldaivat name');</script>");
            }
        }

        private void LoadKuldaivatData()
        {
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";

            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string query = "SELECT kid, kname FROM kuldaivat";

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