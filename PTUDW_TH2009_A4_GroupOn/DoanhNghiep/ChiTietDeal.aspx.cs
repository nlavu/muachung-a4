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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int mavoucher = int.Parse(Request.QueryString["MAVOUCHER"]);
                VoucherDAO vDao = new VoucherDAO();
                VoucherDTO vDto = vDao.SelectVoucher_MaVoucher(mavoucher);
                
                txtMaVoucher.Text = vDto.MAVOUCHER1.ToString();
                txtTenVoucher.Text = vDto.TENVOUCHER1.ToString();
                txtTGBD.Text = vDto.THOIGIANBDKM1.ToString();
                txtTGKT.Text = vDto.THOIGIANKTKM1.ToString();
                txtNoiDung.Text = vDto.NOIDUNG1.ToString();
                txtGiaGoc.Text = vDto.GIAGOC1.ToString();
                txtGiaKhuyenMai.Text = vDto.GIAKHUYENMAI1.ToString();
                txtSLKho.Text = vDto.SOLUONGTRONGKHO1.ToString();
                txtSLDaMua.Text = vDto.SOLUONGDAMUA1.ToString();
                txtVip.Text = vDto.THUOCTINHVIP1.ToString();
                txtThoiGianBan.Text = vDto.TONGSOGIOBAN1.ToString();
                txtTrangThaiDuyet.Text = vDto.TRANGTHAIDUYET1.ToString();
                ddlAvai.SelectedValue = vDto.ISAVAILABLE1.ToString();

                //load mahinhanh cua voucher hien tai va cac hinh khac trong combo box
                HinhAnhDAO hinhDAO = new HinhAnhDAO();
                List<HinhAnhDTO> lstHinh = new List<HinhAnhDTO>();
                lstHinh = hinhDAO.SelectAllHinhAnh();
                ddlHinh.DataSource = lstHinh;
                ddlHinh.DataTextField = "MAHINHANH1";
                ddlHinh.DataValueField = "MAHINHANH1";
                ddlHinh.DataBind();
                ddlHinh.SelectedValue = vDto.MAHINH1.ToString();
                

                //load loai voucher cua voucher hien tai va cac voucher khac trong combo box
                LoaiVoucherDAO loaiVoucherDAO = new LoaiVoucherDAO();
                List<LoaiVoucherDTO> lstLoaiVC = new List<LoaiVoucherDTO>();
                lstLoaiVC = loaiVoucherDAO.SelectAllLoaiVoucher();
                ddlVoucher.DataSource = lstLoaiVC;
                ddlVoucher.DataTextField = "TENLOAIVOUCHER1";
                ddlVoucher.DataValueField = "MALOAIVOUCHER1";
                ddlVoucher.DataBind();
                ddlVoucher.SelectedValue = vDto.MALOAIVOUCHER1.ToString();

                //load loai voucher cua voucher hien tai va cac voucher khac trong combo box
                KhuVucDAO kvDAO = new KhuVucDAO();
                List<KhuVucDTO> lstKV = new List<KhuVucDTO>();
                lstKV = kvDAO.SelectAllKhuVuc();
                ddlKV.DataSource = lstKV;
                ddlKV.DataTextField = "TENKHUVUC1";
                ddlKV.DataValueField = "MAKHUVUC1";
                ddlKV.DataBind();
                ddlKV.SelectedValue = vDto.MAKHUVUC1.ToString();

                //load loai voucher cua voucher hien tai va cac voucher khac trong combo box
                TaiKhoanDoanhNghiepDAO dnDAO = new TaiKhoanDoanhNghiepDAO();
                List<TaiKhoanDoanhNghiepDTO> lstDN = new List<TaiKhoanDoanhNghiepDTO>();
                lstDN = dnDAO.SelectAllTaiKhoanDoanhNghiep();
                ddlDN.DataSource = lstDN;
                ddlDN.DataTextField = "TENDN1";
                ddlDN.DataValueField = "MADN1";
                ddlDN.DataBind();
                ddlDN.SelectedValue = vDto.MADOANHNGHIEP1.ToString();
                
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            int mavoucher = int.Parse(Request.QueryString["MAVOUCHER"]);
            VoucherDAO vDao = new VoucherDAO();
            VoucherDTO vDto = new VoucherDTO();
            vDto.MAVOUCHER1 = int.Parse(txtMaVoucher.Text);
            vDto.TENVOUCHER1 = txtTenVoucher.Text;
            vDto.THOIGIANBDKM1 = DateTime.Parse(txtTGBD.Text);
            vDto.THOIGIANKTKM1 = DateTime.Parse(txtTGKT.Text);
            vDto.NOIDUNG1 = txtNoiDung.Text;
            vDto.GIAGOC1 = int.Parse(txtGiaGoc.Text);
            vDto.GIAKHUYENMAI1 = int.Parse(txtGiaKhuyenMai.Text) ;
            vDto.SOLUONGTRONGKHO1 = int.Parse(txtSLKho.Text);
            vDto.SOLUONGDAMUA1 = int.Parse(txtSLDaMua.Text);
            vDto.THUOCTINHVIP1 = int.Parse(txtVip.Text);
            vDto.TONGSOGIOBAN1 = int.Parse(txtThoiGianBan.Text);
            vDto.TRANGTHAIDUYET1 = int.Parse(txtTrangThaiDuyet.Text);
            vDto.ISAVAILABLE1 = int.Parse(ddlAvai.SelectedValue.ToString());
            vDto.MAHINH1 = int.Parse(ddlHinh.SelectedValue.ToString());
            vDto.MALOAIVOUCHER1 = int.Parse(ddlVoucher.SelectedValue.ToString());
            vDto.MAKHUVUC1 = int.Parse(ddlKV.SelectedValue.ToString());
            vDto.MADOANHNGHIEP1 = int.Parse(ddlDN.SelectedValue.ToString());

            vDao.UpdateVoucher(vDto);
        }
    }
}