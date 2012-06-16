using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn.DoanhNghiep
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DiaChiDoanhNghiepDAO dnDAO = new DiaChiDoanhNghiepDAO();
            List<DiaChiDoanhNghiepDTO> lstDN = new List<DiaChiDoanhNghiepDTO>();
            lstDN = dnDAO.SelectAllDCDoanhNghiep();
            ddlDN.DataSource = lstDN;
            ddlDN.DataTextField = "DC11";
            ddlDN.DataValueField = "MADC1";
            ddlDN.DataBind();
        }

        protected void ButtonPassUpdate_Click(object sender, EventArgs e)
        {
            TaiKhoanDAO tkDAO = new TaiKhoanDAO();
            TaiKhoanDTO tkDTO = new TaiKhoanDTO();

            tkDTO.PASSWORD1 = txtPass.Text;
            tkDTO.USERNAME1 = Session["Username"].ToString();
            tkDAO.UpdateTaiKhoan_Pass(tkDTO);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TaiKhoanDoanhNghiepDAO tkDAO = new TaiKhoanDoanhNghiepDAO();
            TaiKhoanDoanhNghiepDTO tkDTO = new TaiKhoanDoanhNghiepDTO();

            tkDTO.MADN1 = int.Parse(Session["MaDN"].ToString());
            tkDTO.TENDN1 = txtTenDN.Text;
            tkDTO.SDTDN1 = txtSDT.Text;
            tkDTO.GIOITHIEU1 = txtIntro.Text;
            tkDTO.WEBSITE1 = txtWeb.Text;
            tkDTO.EMAIL1 = txtEmail.Text;
            tkDTO.MADIACHIDN1 = int.Parse(ddlDN.SelectedValue);

            tkDAO.UpdateTaiKhoanDoanhNghiep_info(tkDTO);

            txtTenDN.Text = "";
            txtSDT.Text = "";
            txtIntro.Text = "";
            txtWeb.Text = "";
            txtEmail.Text = "";
        }
    }
}