using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PTUDW_TH2009_A4_GroupOn.DTO;
using PTUDW_TH2009_A4_GroupOn.BUS;

namespace PTUDW_TH2009_A4_GroupOn
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltrSanPham.Text = LoadProduct();
            ltrShowProduct.Text = LoadListProduct();
        }

        protected string LoadProduct()
        {
            try
            {
                List<LoaiVoucherDTO> lstVoucher = LoaiVoucherBUS.LayDanhSachLoaiVoucher();

                string result = "";

                foreach(LoaiVoucherDTO i_item in lstVoucher)
                {
                    int maloai = i_item.MALOAIVOUCHER1;
                    int i_voucher = 0;

                    i_voucher =  LoaiVoucherBUS.LaySoLuongVoucherTheoLoai(maloai);
                    result += "<div class='linkdmsp'><a href='ListProduct.aspx?id="+i_item.MALOAIVOUCHER1+@"'> " + i_item.TENLOAIVOUCHER1.ToString() + " <span class='orange'>(" + i_voucher.ToString() + ")</span></a></div>";
                }
                return result;
            }
            catch (Exception ex)
            {
                System.Console.WriteLine(ex.Message.ToString());
                return "";
            }
        }

        protected String LoadListProduct()
        {
            String result = "";
            List<LoaiVoucherDTO> lstLoaiVoucher = LoaiVoucherBUS.LayDanhSachLoaiVoucher();
            int i = 0;
            foreach (LoaiVoucherDTO i_LoaiVoucher in lstLoaiVoucher)
            {
                result += @"
                    <div class='title_new'>
                        <h2>"+i_LoaiVoucher.TENLOAIVOUCHER1.ToString() +@"</h2>
                    </div>
                    <div class='clear h_15'></div>";
                int i_maLoai = i_LoaiVoucher.MALOAIVOUCHER1;
                List<VoucherDTO> lstVoucher = VoucherBUS.SelectTop6TheoMaLoai(i_maLoai);
                int i_checkPosition = 0;
                foreach (VoucherDTO i_Vocher in lstVoucher)
                {
                    float newprice = i_Vocher.GIAKHUYENMAI1;
                    float oldprice = i_Vocher.GIAGOC1;
                    float percent = (newprice * 100) / oldprice;
                    int year = i_Vocher.THOIGIANKTKM1.Year;
                    int month = i_Vocher.THOIGIANKTKM1.Month;
                    int day = i_Vocher.THOIGIANKTKM1.Day;
                    i_checkPosition++;
                    i++;
                    result += @"
    <div id='featured-products_block_center'>
        <div class='block_content'>
            <ul>
                <li class='ajax_block_product'>
                    <a class='product_image' href='ProductDetail.aspx?id=" + i_Vocher.MAVOUCHER1.ToString() + @"' title='#'>
                        <img src='images/sanpham/1139559419noithat8.jpg' alt='" + i_Vocher.TENVOUCHER1.ToString()+@"' width='290' height='184'>
                    </a>
                    <div class='product_info'>
                        <div class='desc'>
                            <p>"+ i_Vocher.NOIDUNG1+@"</p>
                        </div>
    
                        <script type='text/javascript'>
                            $(document).ready(function () {
                                $('#featured-products_block_center li').hover(function () {
                                    $(this).find('div.product_info').stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                },
                          function () {
                              $(this).find('div.product_info').stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
                          })
                            });
 
                        </script>
                         <script type='text/javascript'>
                            $(document).ready(function () {
                                var myDate = new Date("+year+@", "+month+@", "+day+@", 0, 0, 0)
                                $.countdown('#countbox"+i.ToString()+@"', myDate);
                            });
	                    </script>
                        <style>
                            div#featured-products_block_center { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
                            div#featured-products_block_center h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
                            div#featured-products_block_center ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
                            div#featured-products_block_center ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
                            div#featured-products_block_center ul li .product_image { margin:0px 0 0 1px }
                            div#featured-products_block_center ul li .product_image img{ width:270px; height:160px;}
                            div#featured-products_block_center ul li div.product_info {background: url(../images/dot-white.png);
                                bottom:-200px;
                                height:132px;
                                left:9px;
                                position: absolute;
                                width:240px; 
	                            padding:10px;}
                            div#featured-products_block_center ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

                            div#featured-products_block_center ul li div.product_info p.product_desc {padding:3px 0 0 0;}

                            div#featured-products_block_center ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
                            div#featured-products_block_center ul li div.product_info p.buttons {padding:0;}
                            div#featured-products_block_center ul li div.product_info p.buttons a {margin:6px 0 0 0;}
                        </style>

                        <div class='xem-bt'><a href='ProductDetail.aspx?id="+i_Vocher.MAVOUCHER1+@"'></a></div>
                        <a href='ProductDetail.aspx' id='dialog_link"+i.ToString()+@"' class='orange fleft bold f16 pad_r10'>Xem địa điểm</a>
                    </div>
                </li>
            </ul>
            <div class='dealpc'><div class='showdealpc'> "+percent.ToString()+@"%</div></div>     
            <div class='ttdeal'><a href='#'>"+i_Vocher.TENVOUCHER1.ToString()+@"</a></div>
            <div class='price'>
                <div class='new_price'><a href='#'>"+i_Vocher.GIAKHUYENMAI1.ToString()+@"đ</a></div>
                <div class='old_price'><a href='#'>"+i_Vocher.GIAGOC1.ToString()+@"đ</a></div>
            </div>
            <h1 id='countbox"+i.ToString()+@"'></h1>
        </div>
    </div>          
    <div style='width:30px; float:left; height:1px;'></div>       
    <div id='dialog"+i.ToString()+@"' title='Bản đồ' style='display:none !important;z-index:99999999 !important'>
		<p><img src='images/bando/1029248795Nội thất Kiến Xinh.png'/></p>
	</div>";
                    if(i_checkPosition == 3)
                    {
                        result += "<div class='clear h_15'></div>";
                    }
                }
                result += @"<div style='clear: both'></div>
                            <div class='clear h_15'></div> ";
            }
            return result;
        }
    }
}
