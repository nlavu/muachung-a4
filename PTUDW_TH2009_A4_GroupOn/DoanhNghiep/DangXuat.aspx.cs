using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PTUDW_TH2009_A4_GroupOn.DoanhNghiep
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // trạng thái đăng nhập
            Session["IsLogin"] = 0;
            // mã tài khoản
            Session["MaDN"] = -1;
            // tên tài khoản
            Session["Username"] = "Guest";
            Response.Redirect("TrangChuDoanhNghiep.aspx");
        }
    }
}