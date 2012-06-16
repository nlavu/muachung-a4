using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.DAO;
using PTUDW_TH2009_A4_GroupOn.BUS;

namespace PTUDW_TH2009_A4_GroupOn.DoanhNghiep
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonNhap_Click(object sender, EventArgs e)
        {
            if (int.Parse(Session["IsLogin"].ToString()) == 1)
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
                v.MADOANHNGHIEP1 = int.Parse(Session["MaDN"].ToString());
                v.ISAVAILABLE1 = 0;
                VoucherDAO vDAO = new VoucherDAO();
                VoucherBUS.InsertVoucher(v);

                TextBoxMaVoucher.Text = "";
                TextBoxTenVoucher.Text = "";
                TextBoxThoiGianBatDau.Text = "";
                TextBoxThoiGianKetThuc.Text = "";
                TextBoxNoiDung.Text = "";
                TextBoxGiaGoc.Text = "";
                TextBoxGiaKhuyenMai.Text = "";
                TextBoxSoLuongNhapKho.Text = "";
                TextBoxThoiGianBan.Text = "";
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUploadDaiDien.PostedFile != null && FileUploadThumb.PostedFile != null && FileUploadHinh1.PostedFile != null && FileUploadHinh2.PostedFile != null && FileUploadHinh3.PostedFile != null)
            {
                string daidien = Server.MapPath("~/images/sanpham/") + FileUploadDaiDien.PostedFile.FileName;
                string thumb = Server.MapPath("~/images/sanpham/") + FileUploadThumb.PostedFile.FileName;
                string hinh1 = Server.MapPath("~/images/sanpham/") + FileUploadHinh1.PostedFile.FileName;
                string hinh2 = Server.MapPath("~/images/sanpham/") + FileUploadHinh2.PostedFile.FileName;
                string hinh3 = Server.MapPath("~/images/sanpham/") + FileUploadHinh3.PostedFile.FileName;
                FileUploadDaiDien.PostedFile.SaveAs(daidien);
                FileUploadThumb.PostedFile.SaveAs(thumb);
                FileUploadHinh1.PostedFile.SaveAs(hinh1);
                FileUploadHinh2.PostedFile.SaveAs(hinh2);
                FileUploadHinh3.PostedFile.SaveAs(hinh3);

                HinhAnhDAO haDAO = new HinhAnhDAO();
                HinhAnhDTO haDTO = new HinhAnhDTO();
                haDTO.HINHDAIDIEN1 = daidien;
                haDTO.HINHTHUMBNAIL1 = thumb;
                haDTO.HINH11 = hinh1;
                haDTO.HINH21 = hinh2;
                haDTO.HINH31 = hinh3;
                haDAO.InsertHinhAnh_koma(haDTO);
            }
        }
    }
}