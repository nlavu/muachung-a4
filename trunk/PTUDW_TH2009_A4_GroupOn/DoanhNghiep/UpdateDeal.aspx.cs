using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;

namespace PTUDW_TH2009_A4_GroupOn.DoanhNghiep
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCapNhat_Click(object sender, EventArgs e)
        {
            VoucherDTO v = new VoucherDTO();
            v.MAVOUCHER1 = Int32.Parse(TextBoxMaVoucher.Text);
            v.TENVOUCHER1 = TextBoxTenVoucher.Text;
            v.THOIGIANBDKM1 = DateTime.Parse(TextBoxThoiGianBatDau.Text);
            v.THOIGIANKTKM1 = DateTime.Parse(TextBoxThoiGianKetThuc.Text);
            v.NOIDUNG1 = TextBoxNoiDung.Text;
            v.GIAGOC1 = Int32.Parse(TextBoxGiaGoc.Text);
            v.GIAKHUYENMAI1 = Int32.Parse(TextBoxGiaKhuyenMai.Text);
            v.SOLUONGTRONGKHO1 = Int32.Parse(TextBoxSoLuongNhapKho.Text);
            v.SOLUONGDAMUA1 = 0;
            v.THUOCTINHVIP1 = Int32.Parse(DropDownListVIP.SelectedValue);
            v.TONGSOGIOBAN1 = Int32.Parse(TextBoxThoiGianBan.Text);
            v.TRANGTHAIDUYET1 = 0;
            v.MAHINH1 = Int32.Parse(DropDownListHinhAnh.SelectedValue);
            v.MALOAIVOUCHER1 = Int32.Parse(DropDownListLoaiVoucher.SelectedValue);
            v.MAKHUVUC1 = Int32.Parse(DropDownListKhuVuc.SelectedValue);
            v.MADOANHNGHIEP1 = Int32.Parse(TextBoxDN.Text);
            v.ISAVAILABLE1 = 0;
            VoucherDAO vDAO = new VoucherDAO();
            vDAO.UpdateVoucher(v);
        }
    }
}