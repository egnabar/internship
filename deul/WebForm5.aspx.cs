using System;
using System.Collections.Generic;

using System.Threading.Tasks;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace deul
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        

        protected async void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected async void CountryList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlStates_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlCities_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }

    public class Country
    {
        public string country_name { get; set; }
    }

    public class State
    {
        public string state_name { get; set; }
    }
}
