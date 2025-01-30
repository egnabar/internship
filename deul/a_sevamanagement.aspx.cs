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
    public partial class WebForm21 : System.Web.UI.Page
    {
        private string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadsevaData();
        }
        private void LoadsevaData()
        {
            
            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {

                    connection.Open();

                    string query = "select * from sevalist";
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

        protected void AddSeva_Click(object sender, EventArgs e)
        {
            string sname = AddSevaName.Text;
            string charge = AddSevaCharges.Text;
            string sid = string.Empty;


            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();
            using (OdbcCommand comm2 = new OdbcCommand("SELECT MAX(sevaid) sid FROM sevalist", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        sid = Convert.ToString(d2["sid"]);
                        if (sid == "")
                        {
                            sid = "0";
                        }
                        sid = Convert.ToString(int.Parse(sid) + 1);

                    }
                    else
                    {
                        sid = "1";
                        Response.Write("<script>alert('sid? !');</script>");

                    }

                }

            }
            

            string query = "INSERT INTO sevalist(sevaid,sevaname,charges) VALUES('" + sid + "','" + sname + "','" + charge + "')";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('saved !');</script>");
                    string script = "window.open('a_sevamanagement.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }
        }

        protected void DeleteSeva_Click(object sender, EventArgs e)
        {
            string dsid = DeleteSevaID.Text;
            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();

            string query = "DELETE FROM sevalist WHERE sevaid = '" + dsid + "'";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('deleted !');</script>");
                    string script = "window.open('a_sevamanagement.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }

        }

        protected void UpdateSeva_Click(object sender, EventArgs e)
        {
            string usid = UpdateSevaID.Text;
            string charge2 = UpdateSevaCharges.Text;

            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();

            
            string query = "UPDATE sevalist SET charges = '" + charge2 + "' WHERE sevaid = '" + usid + "'";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('updated !');</script>");
                    string script = "window.open('a_sevamanagement.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }

        }
    }
}