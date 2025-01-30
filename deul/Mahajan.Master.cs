using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace deul
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        string username = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username2"] == null)
            {
                ProfileOrLoginLink.Text = "Login";
                ProfileOrLoginLink.NavigateUrl = "mahajanlogin.aspx";
            }
            else
            {
                ProfileOrLoginLink.Text = "Profile";
                ProfileOrLoginLink.NavigateUrl = "m_Profile.aspx";
            }

        }
        
    }
}