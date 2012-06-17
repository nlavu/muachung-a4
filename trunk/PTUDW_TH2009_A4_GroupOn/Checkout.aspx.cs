using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.BUS;
using PTUDW_TH2009_A4_GroupOn.DTO;

namespace PTUDW_TH2009_A4_GroupOn
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logIn"] == null)
                Response.Redirect("./Default.aspx");
            loadinfo();
        }

        protected void loadinfo()
        {
            string username = Session["logIn"].ToString();
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            PTUDW_TH2009_A4_GroupOn.DTO.sp_laythongtinkhbangusernameResult taikhoan = TaiKhoanThuongBUS.laythongtinkh_username(username);
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            cart_fullname.Text = taikhoan.USERNAME.ToString() ;
            cart_email.Text = taikhoan.EMAIL.ToString();
            cart_tel.Text = taikhoan.SDT.ToString();
            cart_address.Text = taikhoan.DIACHI.ToString();
            price.Text = voucher.GIAKHUYENMAI1.ToString();
            int price1  = Convert.ToInt32(price.Text = voucher.GIAKHUYENMAI1.ToString());
            int soluong = Convert.ToInt32(DropDownListSoLuong.SelectedValue);
            totalprice.Text = (soluong * price1).ToString();
            bgAllPrice.Text = totalprice.Text;
            txtdiachi.Text = taikhoan.DIACHI.ToString();
            if (money.Checked)
            {
                fnhoten.Text = taikhoan.USERNAME.ToString();
                fndiachi.Text = taikhoan.DIACHI.ToString();
                fnemail.Text = taikhoan.EMAIL.ToString();
                fnphone.Text = taikhoan.SDT.ToString();
                fnthanhtoan.Text = "Giao phiếu và thu tiền tận nơi";
                tendeal.Text = voucher.TENVOUCHER1.ToString();
                dongia.Text = voucher.GIAKHUYENMAI1.ToString();
                sodeal.Text = soluong.ToString();
                thanhtien.Text = totalprice.Text;
            }
        }

    }
}