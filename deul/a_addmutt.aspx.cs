using System;
using System.Data;
using System.Data.Odbc;

namespace deul
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string mid = string.Empty;
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
            string muttName = mname.Text.Trim();
            if (!string.IsNullOrEmpty(muttName))
            {
                using (OdbcConnection connection = new OdbcConnection(connectionString))
                {
                    try
                    {

                        connection.Open();
                        using (OdbcCommand comm2 = new OdbcCommand("SELECT MAX(mid) as mid FROM mutt", connection))
                        {
                            using (OdbcDataReader d2 = comm2.ExecuteReader())
                            {
                                if (d2.Read())
                                {
                                    mid = Convert.ToString(d2["mid"]);
                                    if (mid == "")
                                    {
                                        mid = "0";
                                    }
                                    mid = Convert.ToString(int.Parse(mid) + 1);

                                }
                                else
                                {
                                    mid = "1";
                                    Response.Write("<script>alert('mid? !');</script>");
                                    
                                }
                                
                            }

                            string query = "INSERT INTO mutt(mid,mname) VALUES('" + mid + "','" + mname.Text.Trim() + "')";

                            using (OdbcCommand command = new OdbcCommand(query, connection))
                            {
                                //Response.Write("<script>alert('opened 2 !');</script>");
                                using (OdbcDataReader d = command.ExecuteReader())
                                {
                                    Response.Write("<script>alert('saved !');</script>");
                                    string script = "window.open('a_addmutt.aspx','_self');";
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
                Response.Write("<script>alert('Please enter a mutt name');</script>");
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

                    string query = "SELECT mid, mname FROM mutt";

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