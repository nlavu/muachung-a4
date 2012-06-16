using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"].ToString() != "admin")
            {
                Response.Redirect("../Default.aspx");
            }
        }

        protected void ButtonThemKH_Click(object sender, EventArgs e)
        {
            TaiKhoanThuongDTO tk = new TaiKhoanThuongDTO();
            tk.MAKH1 = int.Parse(txtMaKH.Text);
            tk.DIACHI1 = txtDC.Text;
            tk.EMAIL1 = txtEmail.Text;
            tk.SDT1 = txtSDT.Text;

            TaiKhoanThuongDAO tkDAO = new TaiKhoanThuongDAO();
            tkDAO.InsertTaiKhoanThuong(tk);
            txtMaKH.Text = "";
            txtDC.Text = "";
            txtEmail.Text = "";
            txtSDT.Text = "";
        }
    }
}