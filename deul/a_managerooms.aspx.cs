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
    public partial class WebForm12 : System.Web.UI.Page
    {
        private string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadroomData();
        }

        private void LoadroomData()
        {
            
            string connectionString = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            using (OdbcConnection connection = new OdbcConnection(connectionString))
            {
                try
                {
                    
                    connection.Open();

                    string query = "select rid as room_no, rfloor as floor, aname as agrashala,  agrashala.loc as location, bcharges as b_charges, ucharges as ex_charges from rooms,rtypes,agrashala where rtypes.rtid = rooms.rtype and rooms.asid = agrashala.asid";
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

        protected void AddRoom_Click(object sender, EventArgs e)
        {
            string aname = AgrashalaType.SelectedItem.Value;
            string rtname = RoomType.SelectedItem.Value;
            string rfloor = FloorLocation.SelectedItem.Value;
            string rid = string.Empty;
            string rtid = string.Empty;
            string aid = string.Empty;


            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();
            using (OdbcCommand comm2 = new OdbcCommand("SELECT MAX(rid) rid FROM rooms", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        rid = Convert.ToString(d2["rid"]);
                        if (rid == "")
                        {
                            rid = "0";
                        }
                        rid = Convert.ToString(int.Parse(rid) + 1);

                    }
                    else
                    {
                        rid = "1";
                        Response.Write("<script>alert('rid? !');</script>");

                    }

                }

            }
            using (OdbcCommand comm2 = new OdbcCommand("SELECT rtid FROM rtypes WHERE rtname='" + rtname + "'", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        rtid = Convert.ToString(d2["rtid"]);

                    }

                }

            }
            using (OdbcCommand comm2 = new OdbcCommand("SELECT asid FROM agrashala WHERE aname='" + aname + "'", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        aid = Convert.ToString(d2["asid"]);
                        //Response.Write("<script>alert('"+aid+"');</script>");

                    }

                }

            }

            string query = "INSERT INTO rooms(rid,rfloor,asid,rtype) VALUES('" + rid + "','" + rfloor + "','" + aid + "','" + rtid + "')";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('saved !');</script>");
                    string script = "window.open('a_managerooms.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }
        }

        protected void DeleteRoom_Click(object sender, EventArgs e)
        {
            string deleterid = DeleteRoomID.Text;
            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();

            string query = "DELETE FROM rooms WHERE rid = '" + deleterid + "'";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('deleted !');</script>");
                    string script = "window.open('a_managerooms.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }

        }

        protected void ModifyRoomType_Click(object sender, EventArgs e)
        {
            string modrid = ModifyRoomID.Text;
            string modrtype = NewRoomType.SelectedItem.Value;
            string modrtid = string.Empty;
            //string charge2 = charges2.Text;

            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();

            /*using (OdbcCommand comm2 = new OdbcCommand("SELECT utid FROM utype WHERE utname='" + utname + "'", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        utid = Convert.ToString(d2["utid"]);

                    }

                }

            }*/
            using (OdbcCommand comm2 = new OdbcCommand("SELECT rtid FROM rtypes WHERE rtname='" + modrtype + "'", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        modrtid = Convert.ToString(d2["rtid"]);

                    }

                }

            }
            string query = "UPDATE rooms SET rtype = '" + modrtid + "' WHERE rid = '" + modrid + "'";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('updated !');</script>");
                    string script = "window.open('a_managerooms.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }

        }

        protected void UpdateRoomType_Click(object sender, EventArgs e)
        {
            string bcharges = BasicCharges.Text;
            string urtype = updateRoomType.SelectedItem.Value;
            string ucharges = ExtensionCharges.Text;
            string urtid = string.Empty;

            OdbcConnection con2 = new OdbcConnection(connectionString);
            con2.Open();

            
            using (OdbcCommand comm2 = new OdbcCommand("SELECT rtid FROM rtypes WHERE rtname='" + urtype + "'", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        urtid = Convert.ToString(d2["rtid"]);

                    }

                }

            }
            string query = "UPDATE rtypes SET bcharges = '" + bcharges + "', ucharges = '" + ucharges + "' WHERE rtid = '" + urtid + "'";

            using (OdbcCommand command = new OdbcCommand(query, con2))
            {
                // Response.Write("<script>alert('opened 2 !');</script>");
                using (OdbcDataReader d = command.ExecuteReader())
                {
                    Response.Write("<script>alert('updated !');</script>");
                    string script = "window.open('a_managerooms.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }

            }

        }
    }
}