using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.BUS;

namespace PTUDW_TH2009_A4_GroupOn
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            ltrTitle.Text = LoadTilte();
            ltrLoadImage.Text = LoadImage();
            ltrcontent.Text = loadcontent();
            ltrprice.Text = loadprice();
            ltrSoPhieu.Text = loadSophieu();
            ltrimagedetail.Text = loadimagedetail();
            ltrdiachidn.Text = loaddiachidn();
            ltrdieukienvoucher.Text = loaddieukienvoucher();
            ltrtimer.Text = loadtimercountdown();
            //if (Request["maSP"] == null)
            //{
                
            //}
            //int maSP = int.Parse(Request["maSP"].ToString());
        }

        protected string LoadTilte()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            result += @"<div class='titleBoxName'>
                        <a href=ProductDetail.aspx?id="+maVoucher.ToString()+@"'>"+voucher.TENVOUCHER1.ToString()+@" - Chỉ "+voucher.GIAKHUYENMAI1.ToString()+@"đ</a>
                    </div>";
            return result;
        }

        protected string LoadImage()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            float newprice = voucher.GIAKHUYENMAI1;
            float oldprice = voucher.GIAGOC1;
            float percent = (newprice * 100) / oldprice;
            int mahinh = HinhAnhBUS.laymahinhanhtheomavoucher(maVoucher);
            HinhAnhDTO hinhanh = HinhAnhBUS.layhinhanhtheomahinh(mahinh);

            result += @"<div id='borderImg' align='center'>
                            <div class='discount_new fixPNG'>
                                <span>Giảm</span>
                                <div>"+percent.ToString()+ @"%</div>
                            </div>
                            <a href='DetailPr8oduct.aspx'>
                            <img height='334' width='508' style='margin-top:1px' alt='deal image' src='"+hinhanh.HINHDAIDIEN1.ToString()+@"'>
                            </a>
                        </div>";
            return result;
        }

        protected string loadcontent()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            float newprice = voucher.GIAKHUYENMAI1;
            float oldprice = voucher.GIAGOC1;
            float percent = (newprice * 100) / oldprice;
            result += @"<p style='text-align: justify; '>
                            <span style='font-size: 13px; '>
                                <span style='font-family: arial,helvetica,sans-serif;'>
                                    * Chỉ với
                                    <span style='color: rgb(0, 0, 255);'>
                                        <strong>"+voucher.GIAKHUYENMAI1.ToString()+@"đ</strong>
                                    </span>
                                    ,
                                </span>
                            </span>
                            <span style='font-size:13px;'>
                                <span style='font-family:arial,helvetica,sans-serif;'>
                                    sở hữu ngay
                                    <strong> "+voucher.TENVOUCHER1.ToString()+@"</strong>
                                   
                                    &nbsp;trị giá
                                </span>
                            </span>
                            <span class='Apple-style-span' style='font-size: 13px; '>
                                <span style='color: rgb(255, 0, 0);'>
                                    <strike>
                                        <strong>
                                            <span style='font-size: 18px;'>
                                                <span style='font-family: arial,helvetica,sans-serif;'>"+voucher.GIAGOC1.ToString()+@"đ</span>
                                            </span>
                                        </strong>
                                    </strike>
                                </span>
                                <span style='font-family: arial,helvetica,sans-serif;'>
                                    <em>
                                        <strong>&nbsp;</strong>
                                    </em>
                                    -
                                    <span style='color: rgb(0, 128, 0);'>
                                        <strong>Tiết kiệm "+percent.ToString()+@"%</strong>
                                    </span>
                                </span>
                            </span>
                        </p>
                        <p style='text-align: justify; '>
                            <font face='arial, helvetica, sans-serif' size='2'>* "+voucher.NOIDUNG1.ToString()+@"</font>
                        </p>";
            return result;
        }

        protected string loadprice()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            result += @"<div class='topTextPrice' align='left'>
                            <div id='f14' align='left'></div>
                            <div class='numPrice'>" + voucher.GIAKHUYENMAI1.ToString() +@" đ</div>
                            <div style='color:#98bfe1; font-size:20px;'>
                                Giá gốc
                                <b>
                                    <strike>"+voucher.GIAGOC1.ToString()+@" đ</strike>
                                </b>
                            </div>
                        </div>";
            return result;
        }

        protected string loadSophieu()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            result = @"<div id='deal4649' class='cBarText' align='center' style='color: rgb(84, 104, 45);'>
                            <span>
                                Còn
                                <b>"+voucher.SOLUONGTRONGKHO1.ToString()+@"</b>
                                Phiếu
                            </span>
                        </div>
                        <div class='buyerStatus'>
                            <div class='numBuyer'>
                                (Đã có
                                <b>"+voucher.SOLUONGDAMUA1.ToString()+@"</b>
                                người mua)
                            </div>
                        </div>";
            return result;
        }

        protected string loadimagedetail()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            int mahinh = HinhAnhBUS.laymahinhanhtheomavoucher(maVoucher);
            HinhAnhDTO hinhanh = HinhAnhBUS.layhinhanhtheomahinh(mahinh);
            result += @"<p>
                            <span style='font-size:13px;'>
                                <span style='font-family:arial,helvetica,sans-serif;'>
                                    - Chỉ với&nbsp;
                                    <strong>"+voucher.GIAKHUYENMAI1.ToString()+@"đ,&nbsp;</strong>
                                    sở hữu ngay
                                    <strong>"+voucher.TENVOUCHER1.ToString()+@"</strong>
                                </span>
                            </span>
                        </p>
                        <p style='text-align: center;'>
                            <img src='"+hinhanh.HINH11.ToString()+@"' alt=''>
                        </p>
                                               
                        <p style='text-align: center; '>
                            <img src='"+hinhanh.HINH21.ToString()+@"' alt=''>
                        </p>
                                                
                        <p style='text-align: center;'>
                            <img src='"+hinhanh.HINH31.ToString()+@"' alt=''>
                        </p>";
            return result;
        }

        protected string loaddiachidn()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            int madn = TaiKhoanDoanhNghiepBUS.laymadoanhnghieptheomavoucher(maVoucher);
            PTUDW_TH2009_A4_GroupOn.DTO.sp_LayDoanhNghiepTheoMadnResult dn = TaiKhoanDoanhNghiepBUS.laydoanhnghieptheomadn(madn);
            result += @"<span style='font-size:13px;'>
                        <strong><span>Đia chỉ nhận sản phẩm</span></strong>
                        <div style='text-align: justify; '> &nbsp;</div>
                        <strong><span>" + dn.TENDN.ToString()+@"</span></strong>
                        <div style='text-align: justify; '> &nbsp;</div>
                        <span>
                            - Địa chỉ 1:
                            <strong>"+dn.DC1.ToString()+@"</strong>
                        </span>
                        <div style='text-align: justify; '> &nbsp;</div>
                        <span>
                            - Địa chỉ 2:
                            <strong>"+dn.DC2.ToString()+@"</strong>
                        </span>
                        <div style='text-align: justify; '> &nbsp;</div>
                        <span>
                            - Địa chỉ 3:
                            <strong>"+dn.DC3.ToString()+@"</strong>
                        </span>
                        <div style='text-align: justify; '> &nbsp;</div>
                        <span>
                            - Website: 
                            <strong>"+dn.WEBSITE.ToString()+@"</strong>
                        </span>  
                        <div style='text-align: justify; '> &nbsp;</div>
                        <span>
                            - Số điện thoại:
                            <strong>"+dn.SDTDN.ToString()+@"</strong>
                        </span>  
                    </span>";
            return result;
        }

        protected string loaddieukienvoucher()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            result += @"<p style='text-align: justify; '>
                            <span style='font-size:13px;'>
                                <span style='font-family:arial,helvetica,sans-serif;'>
                                    - Phiếu mua
                                    <strong>"+voucher.TENVOUCHER1.ToString()+@"</strong>
                                </span>
                            </span>
                            </p>
                            <p style='text-align: justify;'>
                            <span class='Apple-style-span' style='font-family: arial, helvetica, sans-serif; font-size: 13px; '>- Hết hạn lấy hàng:</span>
                                <span class='Apple-style-span' style='font-family: arial,helvetica,sans-serif; font-size: 13px;'>
                                <strong>&nbsp;"+voucher.THOIGIANKTKM1.ToString()+@".</strong>
                            </span>
                            </p>";
            return result;
        }

        protected string loadtimercountdown()
        {
            string result = "";
            int maVoucher = int.Parse(Request.QueryString["id"].ToString());
            VoucherDTO voucher = VoucherBUS.SelectVoucherTheoMa(maVoucher);
            DateTime thoigian = voucher.THOIGIANKTKM1;
            int year = thoigian.Year;
            int date = thoigian.Month;
            int day = thoigian.Day;
            result += @" </script>
                            <!--countdown-->  
                            <script type='text/javascript'>
                                $(document).ready(function () {
                                    // create a new date and insert it
                                    var myDate = new Date("+year+@", "+date+@", "+day+@", 0, 0, 0)
                                    $.countdown('#countbox21', myDate);
                                });
	                    </script>
                        <div class='timerIcon'>
                            <div id='timeTitle4649'>Thời gian còn lại</div>
                            <div>
                                <b>
                                    <span id='countbox21'></span>
                                </b>
                            </div>
                        </div>";
            return result;
        }

    }

}