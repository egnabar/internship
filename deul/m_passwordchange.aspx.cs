using System;
using System.Web.UI;
using System.Data.Odbc;

namespace deul
{
    public partial class WebForm23 : Page
    {
        
        public string username
        {
            get
            {
                return lblMessage.Text;
            }
            set
            {
                lblMessage.Text = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username2"] != null)
                {
                    username = Session["Username2"].ToString();
                }
            }
            

        }
        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            string oldPassword = txtOldPassword.Text;
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;
            string correctOldPassword = string.Empty;

            string constring = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            OdbcConnection con = new OdbcConnection(constring);
            con.Open();
            using (OdbcCommand comm = new OdbcCommand("SELECT * FROM mahajan2 WHERE muname='" + username + "'", con))
            {
                using (OdbcDataReader nrows = comm.ExecuteReader())
                {
                    if (nrows.Read())
                    {
                        correctOldPassword = nrows["mpass"] != DBNull.Value ? nrows["mpass"].ToString() : string.Empty;
                    }


                    else
                    {
                        Response.Write("<script>alert('error has occured');</script>");
                    }
                }
            }



                con.Close();

                        
            if (oldPassword != correctOldPassword)
            {
                lblMessage.Text = "Old password is incorrect.'"+ correctOldPassword + "'";
                lblSuccess.Text = string.Empty;
                return;
            }

            if (newPassword != confirmPassword)
            {
                lblMessage.Text = "New passwords do not match.";
                lblSuccess.Text = string.Empty;
                return;
            }

            if (newPassword.Length < 6)
            {
                lblMessage.Text = "New password must be at least 6 characters.";
                lblSuccess.Text = string.Empty;
                return;
            }

            bool isUpdated = UpdatePasswordInDatabase(newPassword); 

            if (isUpdated)
            {
                lblMessage.Text = string.Empty;
                lblSuccess.Text = "Password changed successfully.";
            }
            else
            {
                lblMessage.Text = "An error occurred while updating the password.";
                lblSuccess.Text = string.Empty;
            }
        }

        private bool UpdatePasswordInDatabase(string newPassword)
        {
            string constring = "Driver={SQL Server};Server=1TASTIC\\SQLEXPRESS;Database=project;Uid=sa;Pwd=a;";
            OdbcConnection con = new OdbcConnection(constring);
            con.Open();
            using (OdbcCommand comm = new OdbcCommand("UPDATE mahajan2 SET mpass ='" + newPassword + "' WHERE muname='" + username + "' ", con))
            {
                using (OdbcDataReader nrows = comm.ExecuteReader())
                {
                    Response.Write("<script>alert('password changed successfully');</script>");
                    string script = "window.open('m_Profile.aspx','_self');";
                    ClientScript.RegisterStartupScript(this.GetType(), "openNewForm", script, true);

                }
            }


                con.Close();
            return true; 
        }
    }
}
