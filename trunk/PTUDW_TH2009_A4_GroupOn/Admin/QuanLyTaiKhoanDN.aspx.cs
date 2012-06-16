using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PTUDW_TH2009_A4_GroupOn.Admin
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"].ToString() != "admin")
            {
                Response.Redirect("../Default.aspx");
            }
        }
    }
}