﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace deul
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submitBooking_Click(object sender, EventArgs e)
        {
            
            Response.Write("<script>alert('Booking successfully submitted!');</script>");
        }
    }
}