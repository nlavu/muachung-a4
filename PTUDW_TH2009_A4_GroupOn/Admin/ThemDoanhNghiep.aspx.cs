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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonThemDC_Click(object sender, EventArgs e)
        {
            DiaChiDoanhNghiepDTO dc = new DiaChiDoanhNghiepDTO();
            dc.MADC1 = int.Parse(txtMadc.Text);
            dc.DC11 = txtDC1.Text;
            dc.DC21 = txtDC2.Text;
            dc.DC31 = txtDC3.Text;
            DiaChiDoanhNghiepDAO dcDAO = new DiaChiDoanhNghiepDAO();
            dcDAO.InsertDiaChiDoanhNghiep(dc);
            txtMadc.Text = "";
            txtDC1.Text = "";
            txtDC2.Text = "";
            txtDC3.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TaiKhoanDoanhNghiepDTO tk = new TaiKhoanDoanhNghiepDTO();
            tk.MADN1 = int.Parse(txtMadn.Text);
            tk.TENDN1 = txtTenDN.Text;
            tk.SDTDN1 = txtSDT.Text;
            tk.GIOITHIEU1 = txtIntro.Text;
            tk.WEBSITE1 = txtWeb.Text;
            tk.EMAIL1 = txtEmail.Text;
            tk.KINHDO1 = txtKinhdo.Text;
            tk.VIDO1 = txtViDo.Text;
            tk.MADIACHIDN1 = int.Parse(txtMadc2.Text);
            TaiKhoanDoanhNghiepDAO tkDAO = new TaiKhoanDoanhNghiepDAO();
            tkDAO.InsertTaiKhoanDoanhNghiep(tk);
            txtMadn.Text = "";
            txtTenDN.Text = "";
            txtSDT.Text = "";
            txtIntro.Text = "";
            txtWeb.Text = "";
            txtEmail.Text = "";
            txtKinhdo.Text = "";
            txtViDo.Text = "";
            txtMadc2.Text = "";
        }
    }
}