using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;

namespace deul
{
    public partial class registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cuni.Text = "null";
        }

        protected void mname_TextChanged(object sender, EventArgs e)
        {

        }

        protected void submit_TextChanged(object sender, EventArgs e)
        {

            string constring = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            OdbcConnection con = new OdbcConnection(constring);
            con.Open();
            OdbcCommand comm = new OdbcCommand("SELECT * FROM mahajan2 WHERE muname='" + username.Text.Trim() + "'", con);
            while (true)
            {
                using (OdbcDataReader nrows = comm.ExecuteReader())
                {
                    if (nrows.HasRows)
                    {
                        cuni.Text = "false";
                        Console.Write("<script>alert('this username already exists !');</script>");
                        break;
                        
                    }
                    else
                    {
                        cuni.Text = "true";
                        break;
                    }
                }       

        }
            
        }
        void saveit()
        {
            string kid = string.Empty;
            string gid = string.Empty;
            string muttid = string.Empty;
            string mid2 = string.Empty;
            string constring2 = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            OdbcConnection con3 = new OdbcConnection(constring2);
            con3.Open();

            using (OdbcCommand kcomm = new OdbcCommand("SELECT kid FROM kuldaivat WHERE kname='" + kuldaivat.Text + "'", con3))
            {
                using (OdbcDataReader k = kcomm.ExecuteReader())
                {
                    if (k.HasRows)
                    {
                        while (k.Read())
                        {
                            kid = Convert.ToString(k["kid"]);
                            Console.Write(kid);
                        }
                    }
                }
            }
            using (OdbcCommand kcomm = new OdbcCommand("SELECT gid FROM gotra WHERE gname='" + gotra.Text + "'", con3))
            {
                using (OdbcDataReader k = kcomm.ExecuteReader())
                {
                    if (k.HasRows)
                    {
                        while (k.Read())
                        {
                            gid = Convert.ToString(k["gid"]);
                            Console.Write(kid);
                        }
                    }
                }
            }
            using (OdbcCommand kcomm = new OdbcCommand("SELECT mid FROM mutt WHERE mname='" + mutt.Text + "'", con3))
            {
                using (OdbcDataReader k = kcomm.ExecuteReader())
                {
                    if (k.HasRows)
                    {
                        while (k.Read())
                        {
                            muttid = Convert.ToString(k["mid"]);
                            Console.Write(kid);
                        }
                    }
                }
            }



            
            con3.Close();
            OdbcConnection con2 = new OdbcConnection(constring2);
            con2.Open();
            using (OdbcCommand comm2 = new OdbcCommand("SELECT MAX(mid) as mid FROM mahajan2", con2))
            {
                using (OdbcDataReader d2 = comm2.ExecuteReader())
                {
                    if (d2.Read())
                    {
                        mid2 = Convert.ToString(d2["mid"]);
                        if (mid2 == "")
                        {
                            mid2 = "0";
                        }
                        mid2 = Convert.ToString(int.Parse(mid2) + 1);

                    }
                    else
                    {
                        mid2 = "1";
                        Response.Write("<script>alert('mid? !');</script>");
                    }
                    
                }

            }
            using (OdbcCommand comm2 = new OdbcCommand("INSERT INTO mahajan2(mid,fname,mname,lname,phoneno,add1,add2,add3,add4,dob,panno,adharno,kid,gid,muttid,muname,mpass,email) VALUES ('" + mid2 + "','" + fname.Text + "','" + mname.Text + "','" + lname.Text + "','" + phoneno.Text + "','" + add1.Text + "','" + add2.Text.Trim() + "','" + add3.Text + "','" + add4.Text + "','" + DateTime.Parse(dob.Text).ToString("yyyy-MM-dd") + "','" + panno.Text + "','" + adharno.Text.Trim() + "','" + kid + "','" + gid + "','" + muttid + "','" + username.Text + "','" + password.Text + "','" + email.Text + "')", con2))
            {
                using (OdbcDataReader d = comm2.ExecuteReader())
                {
                    panpic.SaveAs(Request.PhysicalApplicationPath + "/documents/" + mid2.ToString() + "p.jpg");
                    adharpic.SaveAs(Request.PhysicalApplicationPath + "/documents/" + mid2.ToString() + "a.jpg");
                    Response.Write("<script>alert('saved !');</script>");
                    string script = "window.open('mahajanlogin.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);
                    
                }

            }
        }
        protected void username_TextChanged(object sender, EventArgs e)
        {

        }

        protected void unamecheck_TextChanged(object sender, EventArgs e)
        {

        }

        protected void submit1_TextChanged(object sender, EventArgs e)
        {
            saveit();
        }
    }
}
