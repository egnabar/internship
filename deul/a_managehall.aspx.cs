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
    public partial class WebForm22 : System.Web.UI.Page
    {
        private string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadhallData();
        }
        private void LoadhallData()
        {
           // string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {

                    connection.Open();

                    string query = "select * from halllist";
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

        protected void AddHall(object sender, EventArgs e)
        {
            string hname = hallname.Text;
            string htname = halltype.SelectedItem.Value;
            string charge = charges.Text;
            string hid = string.Empty;


            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();
            using (OdbcCommand comm2 = new OdbcCommand("SELECT MAX(hid) hid FROM halllist", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        hid = Convert.ToString(d2["hid"]);
                        if (hid == "")
                        {
                            hid = "0";
                        }
                        hid = Convert.ToString(int.Parse(hid) + 1);

                    }
                    else
                    {
                        hid = "1";
                        Response.Write("<script>alert('hid? !');</script>");
                       
                    }

                }

            }
            

            string query = "INSERT INTO halllist(hid,hname,charges,htype) VALUES('" + hid + "','" + hname + "','" + charge + "','" + htname + "')";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('saved !');</script>");
                    string script = "window.open('a_managehall.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }
        }

        protected void DeleteHall(object sender, EventArgs e)
        {
            string hname = deletename.Text;
            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();

            string query = "DELETE FROM halllist WHERE hname = '" + hname + "'";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('deleted !');</script>");
                    string script = "window.open('a_managehall.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }

        }

        protected void ModifyHallType(object sender, EventArgs e)
        {
            string hname = updatename.Text;
            string halltype = updatehalltype.SelectedItem.Value;
            string charge2 = charges2.Text;

            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();

            
            string query = "UPDATE halllist SET htype = '" + halltype + "', charges = '"+ charge2 +"' WHERE hname = '" + hname + "'";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('updated !');</script>");
                    string script = "window.open('a_managehall.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }

        }
    }
}