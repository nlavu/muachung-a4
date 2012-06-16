using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PTUDW_TH2009_A4_GroupOn.Admin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Visible = false;
        }

        protected void ButtonDangNhap_Click(object sender, EventArgs e)
        {
            if (txtPass.Text == "admin" && txtUser.Text == "admin")
            {
                Session["IsLogin"] = 1;
                Session["Username"] = "admin";
                Response.Redirect("TrangChuAdmin.aspx");
            }
            else
            {
                Label3.Text = "Đăng nhập không thành công. Vui lòng thử lại!";
                Label3.Visible = true;
            }
        }
    }
}