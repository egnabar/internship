using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace deul
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitDonation_Click(object sender, EventArgs e)
        {
            string donorName = donorname.Text;
            decimal amount;
            if (decimal.TryParse(donationamount.Text, out amount))
            {
                Response.Redirect("ThankYou.aspx");
            }
            else
            {
                // Handle invalid amount
            }
        }
    }
}