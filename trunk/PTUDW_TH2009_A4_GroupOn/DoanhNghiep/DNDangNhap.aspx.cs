using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            TaiKhoanDAO tkDao = new TaiKhoanDAO();
            List<TaiKhoanDTO> tk = tkDao.SelectTaiKhoan_Username(TextBoxUsername.Text);
            if (tk[0].PASSWORD1 == TextBoxPassword.Text)
            {
                Session["IsLogin"] = 1;
                Session["Username"] = tk[0].USERNAME1;
                Session["MaDN"] = tk[0].MADN1;
                Response.Redirect("TrangChuDoanhNghiep.aspx");
            }
            else
            {
                Label1.Text = "Đăng nhập không thành công. Vui lòng thử lại!";
                Label1.Visible = true;
            }
        }
    }
}