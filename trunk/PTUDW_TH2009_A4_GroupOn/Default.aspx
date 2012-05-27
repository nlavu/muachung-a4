<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    
     ﻿<script type="text/javascript">
          function checksearch() {
              var searcha = document.getElementById('search');


              if (searcha.value == '') {
                  alert("Vui lòng nhập 1 từ khóa");
                  searcha.focus();
                  return false;
              }


          }
    </script>

    <script type="text/javascript" language="javascript">

    function list(a) {
        var keyword = document.getElementById('keyword');

        if (a.substring(0, 9) == "index.php") {
            document.dangky.action = a;
        }
        else {
            if (keyword.value == '') {
                alert("Vui lòng nhập từ khóa");
                keyword.focus();
                return;
            }


            document.timkiem.submit();
        }
        document.timkiem.submit();
    }

    </script>
    <div style="width:100%; border-bottom:1px dashed #bbb; padding-bottom:10px;">

    <div class="search">
                	<form action="#" method="post" name="timkiem"  onsubmit="return checkrecive();">
    <input type="text" value="" name="keyword" class="search" id="keyword"/>
    <!--<input type="submit" value="Tìm kiếm" class="submit"/>-->
    </form>
                    <div class="search-bt"><a href="javascript:list('xacnhan');"></a></div>
                    <div class="clear"></div>
                    <div style="width:255px; height:113px; margin-top:20px;">

                    <iframe id="f3e6625174" name="f3f45b3484" scrolling="no" style="border-top-style: none; border-right-style: none; border-bottom-style: none; border-left-style: none; border-width: initial; border-color: initial; border-image: initial; overflow-x: hidden; overflow-y: hidden; height: 139px; width: 230px; " class="fb_ltr" src="http://www.facebook.com/plugins/likebox.php?channel=https%3A%2F%2Fs-static.ak.fbcdn.net%2Fconnect%2Fxd_proxy.php%23cb%3Df2fb261a3c%26origin%3Dhttp%253A%252F%252Fnews.jimmydang.vn%252Ff7488b50%26relation%3Dparent.parent%26transport%3Dpostmessage&amp;colorscheme=light&amp;header=true&amp;height=470&amp;href=http%3A%2F%2Fwww.facebook.com%2Fjimmydangfb&amp;locale=en_US&amp;sdk=joey&amp;show_faces=true&amp;stream=false&amp;width=310"></iframe>
                    	

                    </div>
                </div>
                
                <div class="boxcountry">
                   <div class="quanhuyen-tt">Quận huyện</div>
                    <div class="wrapquanhuyen">
                        <div class="quanhuyen"><a href="#">Quận 1<span class="orange">(20)</span></a></div> <div class="quanhuyen"><a href="#">Quận 2<span class="orange">(0)</span></a></div> <div class="quanhuyen"><a href="#">Quận 3<span class="orange">(19)</span></a></div> <div class="quanhuyen"><a href="#">Quận 4<span class="orange">(0)</span></a></div> <div class="quanhuyen"><a href="#">Quận 5<span class="orange">(3)</span></a></div> <div class="quanhuyen"><a href="#">Quận 6<span class="orange">(0)</span></a></div> <div class="quanhuyen"><a href="#">Quận 7<span class="orange">(1)</span></a></div> <div class="quanhuyen"><a href="#">Quận 8<span class="orange">(0)</span></a></div> <div class="quanhuyen"><a href="#">Quận 10<span class="orange">(6)</span></a></div> <div class="quanhuyen"><a href="#">Quận 11<span class="orange">(2)</span></a></div> <div class="quanhuyen"><a href="#">Quận 12<span class="orange">(0)</span></a></div> <div class="quanhuyen"><a href="#">Tân Bình<span class="orange">(8)</span></a></div> <div class="quanhuyen"><a href="#">Tân Phú<span class="orange">(2)</span></a></div> <div class="quanhuyen"><a href="#">Bình Thạnh<span class="orange">(9)</span></a></div> <div class="quanhuyen"><a href="#">Gò Vấp<span class="orange">(3)</span></a></div> <div class="quanhuyen"><a href="#">Bình Tân<span class="orange">(0)</span></a></div> <div class="quanhuyen"><a href="#">Thủ Đức<span class="orange">(0)</span></a></div> <div class="quanhuyen"><a href="#">Bình Chánh<span class="orange">(0)</span></a></div> <div class="quanhuyen"><a href="#">Phú Nhuận<span class="orange">(5)</span></a></div> <div class="quanhuyen"><a href="#">Củ chi<span class="orange">(0)</span></a></div>                    </div>
                  
                  
                    <!-- -->
                </div>
                
                <div class="boxdmsp">
                	<div class="danhmucsp">Sản phẩm</div>
                    <!-- -->
                    <div class="wraplinkdmsp">
                       <div class="linkdmsp"><a href="#">Nhà hàng - Quán ăn <span class="orange">(10)</span></a></div><div class="linkdmsp"><a href="#">Cafe - Kem - Bánh <span class="orange">(16)</span></a></div><div class="linkdmsp"><a href="#">Mua sắm - Thời trang <span class="orange">(25)</span></a></div><div class="linkdmsp"><a href="#">Làm đẹp - Sức khỏe <span class="orange">(11)</span></a></div><div class="linkdmsp"><a href="#">Du lịch - Khách sạn <span class="orange">(5)</span></a></div><div class="linkdmsp"><a href="#">Giáo dục - Đào tạo <span class="orange">(5)</span></a></div><div class="linkdmsp"><a href="#">Vui chơi -Giải trí <span class="orange">(0)</span></a></div><div class="linkdmsp"><a href="#">Dịch vụ bảo vệ <span class="orange">(0)</span></a></div><div class="linkdmsp"><a href="#">Studio - Áo cưới <span class="orange">(4)</span></a></div><div class="linkdmsp"><a href="#">Kiến trúc - Nội thất <span class="orange">(1)</span></a></div><div class="linkdmsp"><a href="#">Bất động sản <span class="orange">(0)</span></a></div><div class="linkdmsp"><a href="#"> Bệnh viện-Phòng khám <span class="orange">(1)</span></a></div>                    </div>
                   
                   
                    <!-- -->
                </div>
                
                
                <div class="clear"></div>
            </div>
            <div class="clear h_10"></div>     
            <div class="clear h_10"></div>
            <!-- ---------------------------------------------------- -->

       <div class="leftside">
<style>
.title_new{width:100%; background:url(images/bg_new_ti.png) no-repeat; height:40px; margin-left:-33px; }
.title_new h2{ color:#FF6D0C; font-size:14px; padding-top:15px; margin-left:50px; float:left}
.xemtatca{width:100%; text-align:right; border-bottom:dotted 1px #CCC; padding-bottom:0px; margin-bottom:20px;}
.xemtatca a{ text-decoration:none; color:#F60; font-size:14px;}
</style>
<div class="title_new">
<h2>Địa điểm nổi bật</h2>
</div>

<div class="clear h_15"></div>


   <div id="featured-products_block_center1">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="ProductDetail.aspx" title="#"><img src="images/sanpham/1139559419noithat8.jpg" alt="Nội Thất Kiến Xinh" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	&quot;H&atilde;y để ch&uacute;ng t&ocirc;i g&oacute;p 1 phần nhỏ l&agrave;m ho&agrave;n thiện hơn tổ ấm của bạn&quot;.&nbsp;Giảm&nbsp;10%&nbsp;tr&ecirc;n tổng h&oacute;a&nbsp;đơn cho&nbsp;tất cả c&aacute;c sản....</div>
    
<script type="text/javascript">
    $(document).ready(function () {
        $("#featured-products_block_center1 li").hover(function () {
            $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
        },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
    });
 
</script>
<style>

div#featured-products_block_center1 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center1 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center1 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center1 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center1 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center1 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center1 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center1 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center1 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center1 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center1 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center1 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="ProductDetail.aspx" id="dialog_link1" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Nội Thất Kiến Xinh</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog1" title="Bản đồ" style="display:none !important;z-index:99999999 !important">
			<p><img src="images/bando/1029248795Nội thất Kiến Xinh.png"/></p>
		</div> 

 
   <div id="featured-products_block_center2">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/1240674624Untitled.jpg" alt="Bệnh Viện HỒNG ĐỨC" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Miễn ph&iacute; cho&nbsp;lần kh&aacute;m&nbsp;đầu ti&ecirc;n&nbsp;( từ ng&agrave;y 2/4/2012). Giảm 10 % tr&ecirc;n tổng h&oacute;a đơn thanh to&aacute;n tại bệnh viện.</p>
 </div>
    
<script type="text/javascript">
    $(document).ready(function () {
        $("#featured-products_block_center2 li").hover(function () {
            $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
        },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
    });
 
</script>
<style>

div#featured-products_block_center2 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center2 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center2 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center2 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center2 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center2 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center2 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center2 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center2 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center2 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center2 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center2 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link2" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Bệnh Viện HỒNG ĐỨC</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog2" title="Bản đồ" style="display:none !important;z-index:99999999 !important">
			<p><img src="images/bando/10351655432.png"/></p>
		</div> 

 
   <div id="featured-products_block_center3">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/804787776logo nho(2).JPG" alt="Ngân Hàng Nam Á" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Đồng hợp t&aacute;c với Giahot24h l&agrave; Ng&acirc;n h&agrave;ng Nam &Aacute; &nbsp;với phương ch&acirc;m họat động&nbsp;&ldquo;<strong>An to&agrave;n, ph&aacute;t triển, hiệu quả v&agrave; b&ecirc;n....</div>
    
<script type="text/javascript">
    $(document).ready(function () {
        $("#featured-products_block_center3 li").hover(function () {
            $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
        },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
    });
 
</script>
<style>

div#featured-products_block_center3 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center3 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center3 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center3 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center3 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center3 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center3 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center3 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center3 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center3 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center3 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center3 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link3" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> </div></div>     
                    <div class="ttdeal"><a href="#">Ngân Hàng Nam Á</a></div>
                </div>
            </div>
               
            
             <div class="clear h_15"></div>
             
             
              
        <div id="dialog3" title="Bản đồ" style="display:none !important;z-index:99999999 !important">
			<p><img src="images/bando/669837911"/></p>
		</div> 

            <!-- -->

<div style="clear: both"></div>
<div class="clear h_15"></div>
<div class="title_new">
<h2>Nhà hàng - Quán ăn</h2>
</div>
<div style="clear: both"></div>
<div class="clear h_15"></div>
   <div id="featured-products_block_center11">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/780522436ab14.jpg" alt="Nhà Hàng Tự Do" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	C&ugrave;ng bạn b&egrave;, người th&acirc;n đến v&agrave; thưởng thức c&aacute;c m&oacute;n ăn độc đ&aacute;o, hấp dẫn tại Nh&agrave; H&agrave;ng Tự Do</p>
 </div>
                            <a href="#" id="count_down_container11" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container11", "march 01, "+2013+" 06:38:46")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center11 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center11 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center11 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center11 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center11 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center11 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center11 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center11 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center11 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center11 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center11 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center11 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center11 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link11" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Nhà Hàng Tự Do</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog11" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/177047936ab1.jpg"/></p>
		</div> 

    <div id="featured-products_block_center12">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/316699423p4.jpg" alt="Nhà Hàng Dòng Sông Xanh" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Thưởng thức bữa tiệc thật vui vẻ c&ugrave;ng bạn b&egrave;, người th&acirc;n trong kh&ocirc;ng gian thư gi&atilde;n tho&aacute;ng m&aacute;t tại Nh&agrave; H&agrave;ng D&ograve;ng S&ocirc;ng Xanh</p>
 </div>
                            <a href="#" id="count_down_container12" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container12", "february 28, "+2013+" 07:12:37")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center12 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center12 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center12 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center12 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center12 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center12 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center12 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center12 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center12 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center12 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center12 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center12 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center12 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link12" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Nhà Hàng Dòng Sông Xanh</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog12" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/294413173p5.jpg"/></p>
		</div> 

    <div id="featured-products_block_center13">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/862858383v7.jpg" alt="Nhà Hàng Nguyễn" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Thưởng thức c&aacute;c m&oacute;n đặc sản tại Nh&agrave; H&agrave;ng Nguyễn với thiết kế đẹp mắt, sang trọng, lịch sự</p>
 </div>
                            <a href="#" id="count_down_container13" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container13", "march 01, "+2013+" 04:59:13")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center13 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center13 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center13 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center13 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center13 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center13 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center13 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center13 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center13 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center13 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center13 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center13 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center13 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link13" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Nhà Hàng Nguyễn</a></div>
                </div>
            </div>
               
            
             <div class="clear h_15"></div>
             
             
              
        <div id="dialog13" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/401419514v12.jpg"/></p>
		</div> 

    <div id="featured-products_block_center14">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/2151591046.JPG" alt="Nhà Hàng Corner" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Đến Corner restaurant để cảm nhận sự sang trọng v&agrave; đẳng cấp với mức gi&aacute; ưu &aacute;i đến 15% trong suốt 1 năm chỉ c&oacute; tại giahot24h</p>
 </div>
                            <a href="#" id="count_down_container14" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container14", "february 23, "+2013+" 06:02:56")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center14 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center14 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center14 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center14 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center14 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center14 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center14 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center14 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center14 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center14 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center14 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center14 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center14 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link14" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 15%</div></div>     
                    <div class="ttdeal"><a href="#">Nhà Hàng Corner</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog14" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/766433748Cafe Corner.png"/></p>
		</div> 

    <div id="featured-products_block_center15">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/91421305w4.jpg" alt="Nhà hàng bò Beefsteak Ông Tây" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Thưởng thức B&ograve; Beefsteak thơm ngon gi&agrave;u chất dinh dưỡng tại Nh&agrave; H&agrave;ng B&ograve; Beefsteak &Ocirc;ng T&acirc;y</p>
 </div>
                            <a href="#" id="count_down_container15" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container15", "february 08, "+2013+" 07:32:40")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center15 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center15 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center15 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center15 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center15 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center15 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center15 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center15 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center15 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center15 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center15 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center15 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center15 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link15" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Nhà hàng bò Beefsteak Ông Tây</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog15" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/1108212341w7.jpg"/></p>
		</div> 

    <div id="featured-products_block_center16">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/1230197051b9.jpg" alt="Nhà hàng Bánh Cuốn Lá" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	C&ugrave;ng Giahot24h đến Nh&agrave; h&agrave;ng B&aacute;nh Cuốn L&aacute; để thưởng thức những hương vị kh&aacute;c nhau của m&oacute;n ăn d&acirc;n d&atilde;: b&aacute;nh cuốn</p>
 </div>
                            <a href="#" id="count_down_container16" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container16", "february 10, "+2013+" 05:54:29")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center16 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center16 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center16 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center16 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center16 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center16 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center16 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center16 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center16 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center16 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center16 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center16 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center16 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link16" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Nhà hàng Bánh Cuốn Lá</a></div>
                </div>
            </div>
               
            
             <div class="clear h_15"></div>
             
             
              
        <div id="dialog16" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/409761555bando.gif"/></p>
		</div> 

      
 <div style="clear: both"></div>    
 <div class="xemtatca"><a href="#">Xem tất cả ...!</a></div>
 <div style="clear: both"></div>
 
 
 

<div class="title_new">
<h2>Làm đẹp - sức khỏe</h2>
</div>

<div class="clear h_15"></div>
   <div id="featured-products_block_center21">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/799448242q.jpg" alt="Mộc Nhiên Spa" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Tận hưởng cảm gi&aacute;c nhẹ nh&agrave;ng, thư th&aacute;i &amp; kết hợp chăm s&oacute;c da/t&oacute;c/cơ thể nhằm rũ bỏ những căng thẳng, mệt mỏi của c&ocirc;ng việc hằng ng&agrave;y. Ưu &aacute;i 20%....</div>
                            <a href="#" id="count_down_container21" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container21", "march 12, "+2013+" 06:36:02")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center21 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center21 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center21 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center21 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center21 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center21 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center21 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center21 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center21 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center21 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center21 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center21 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center21 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link21" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 20%</div></div>     
                    <div class="ttdeal"><a href="#">Mộc Nhiên Spa</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog21" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/519733617Mộc Nhiên Spa.png"/></p>
		</div> 

    <div id="featured-products_block_center22">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/640289390qw2.jpg" alt="Nha Khoa Hồng Dung" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	- Cho h&agrave;m răng trắng sạch, khỏe đẹp v&agrave; tự tin hơn với dịch vụ chăm s&oacute;c răng miệng tại Nha Khoa Hồng Dung</p>
 </div>
                            <a href="#" id="count_down_container22" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container22", "march 06, "+2013+" 05:53:39")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center22 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center22 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center22 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center22 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center22 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center22 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center22 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center22 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center22 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center22 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center22 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center22 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center22 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link22" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 15%</div></div>     
                    <div class="ttdeal"><a href="#">Nha Khoa Hồng Dung</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog22" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/123038474qw1.jpg"/></p>
		</div> 

    <div id="featured-products_block_center23">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/10572638167.jpg" alt="Bee Spa" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Bee Spa - Nơi cảm x&uacute;c thăng hoa bất tận. Ưu đ&atilde;i đến 25% trong suốt 1 năm chỉ c&oacute; tại Giahot24h</p>
 </div>
                            <a href="#" id="count_down_container23" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container23", "february 17, "+2013+" 07:46:07")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center23 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center23 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center23 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center23 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center23 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center23 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center23 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center23 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center23 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center23 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center23 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center23 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center23 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link23" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 25%</div></div>     
                    <div class="ttdeal"><a href="#">Bee Spa</a></div>
                </div>
            </div>
               
            
             <div class="clear h_15"></div>
             
             
              
        <div id="dialog23" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/70160038Bee Spa.png"/></p>
		</div> 

    <div id="featured-products_block_center24">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/120001875813286740154674.jpg" alt="Spa Phú Mỹ" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Rạng ngời v&agrave; thư gi&atilde;n c&ugrave;ng Ph&uacute; Mỹ Spa. Ưu đ&atilde;i tới 30%, chỉ c&oacute; tại Giahot24h</p>
 </div>
                            <a href="#" id="count_down_container24" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container24", "february 14, "+2013+" 06:22:27")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center24 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center24 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center24 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center24 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center24 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center24 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center24 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center24 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center24 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center24 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center24 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center24 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center24 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link24" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 30%</div></div>     
                    <div class="ttdeal"><a href#">Spa Phú Mỹ</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog24" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/911422978bando(69).jpg"/></p>
		</div> 

    <div id="featured-products_block_center25">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/720606238s2.jpg" alt="Hoàng Thư Spa" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	<em>Đến với Ho&agrave;ng Thư Spa c&aacute;c chị em phụ nữ kh&ocirc;ng chỉ được chăm s&oacute;c sắc đẹp m&agrave; c&ograve;n l&agrave; nơi để thư gi&atilde;n cơ thể, gạt bỏ những lo &acirc;u, mệt mỏi....</div>
                            <a href="#" id="count_down_container25" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container25", "february 13, "+2013+" 09:25:30")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center25 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center25 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center25 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center25 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center25 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center25 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center25 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center25 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center25 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center25 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center25 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center25 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center25 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link25" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 20%</div></div>     
                    <div class="ttdeal"><a href="#">Hoàng Thư Spa</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog25" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/941809703s13.jpg"/></p>
		</div> 

    <div id="featured-products_block_center26">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/1146820201.JPG" alt="Spa Việt Hàn" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Thoải m&aacute;i l&agrave;m đẹp tại spa Việt H&agrave;n. Ưu đ&atilde;i đến 50% cho tất cả c&aacute;c dịch vụ trong suốt 1 năm chỉ c&oacute; tại Giahot24h.com</p>
 </div>
                            <a href="#" id="count_down_container26" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container26", "february 09, "+2013+" 05:42:23")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center26 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center26 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center26 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center26 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center26 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center26 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center26 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center26 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center26 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center26 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center26 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center26 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center26 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx></a></div><a href="#" id="dialog_link26" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 50%</div></div>     
                    <div class="ttdeal"><a href="#">Spa Việt Hàn</a></div>
                </div>
            </div>
               
            
             <div class="clear h_15"></div>
             
             
              
        <div id="dialog26" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/8599367220.889911001328497492.jpg"/></p>
		</div> 

            <!-- -->

 <div class="xemtatca"><a href="#">Xem tất cả ...!</a></div>
<div style="clear: both"></div>

<div class="title_new">
<h2>Mua sắm - thời trang</h2>
</div>

<div class="clear h_15"></div>
   <div id="featured-products_block_center31">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/132392634Ao-cap-Twenty-seven-trang-_27032011022625.jpg.png" alt="Shop Gấu Bông" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Trẻ trung v&agrave; năng động với mẫu m&atilde; đa dạng tại Shop thời trang H&agrave;n Quốc Gấu B&ocirc;ng</p>
 </div>
                            <a href="#" id="count_down_container31" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container31", "february 28, "+2013+" 15:16:50")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center31 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center31 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center31 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center31 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center31 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center31 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center31 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center31 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center31 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center31 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center31 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center31 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center31 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link31" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 15%</div></div>     
                    <div class="ttdeal"><a href="#">Shop Gấu Bông</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog31" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/524068575"/></p>
		</div> 

    <div id="featured-products_block_center32">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/1327237706trends-korean_fashion_design_for_girls.jpg" alt="Shop Lin Korean Style" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Xứ sở của thời trang H&agrave;n Quốc&nbsp;</p>
 </div>
                            <a href="#" id="count_down_container32" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container32", "january 01, "+2013+" 14:11:28")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center32 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center32 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center32 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center32 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center32 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center32 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center32 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center32 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center32 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center32 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center32 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center32 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center32 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link32" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Shop Lin Korean Style</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog32" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/198812307Bài tiểu luận.docx"/></p>
		</div> 

    <div id="featured-products_block_center33">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/702187626hnm1.jpg" alt="Hải Nam Collection" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Ki&ecirc;u sa, qu&yacute; ph&aacute;i với Thời Trang Hải Nam</p>
 </div>
                            <a href="#" id="count_down_container33" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container33", "march 15, "+2013+" 14:25:52")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center33 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center33 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center33 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center33 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center33 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center33 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center33 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center33 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center33 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center33 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center33 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center33 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center33 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link33" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 20%</div></div>     
                    <div class="ttdeal"><a href="#">Hải Nam Collection</a></div>
                </div>
            </div>
               
            
             <div class="clear h_15"></div>
             
             
              
        <div id="dialog33" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/187640173hnm3.jpg"/></p>
		</div> 

    <div id="featured-products_block_center34">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="Giahot24h.com"><img src="images/sanpham/1036740479we12.jpg" alt="Kirei Fashion" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Cơ hội mua sắm cho c&aacute;c t&iacute;n đồ thời trang. Giảm 30% thỏa sức mua sắm tại cửa h&agrave;ng thời trang Kerei Fashion</p>
 </div>
                            <a href="#" id="count_down_container34" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container34", "march 01, "+2013+" 06:28:16")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center34 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center34 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center34 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center34 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center34 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center34 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center34 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center34 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center34 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center34 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center34 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center34 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center34 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link34" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 30%</div></div>     
                    <div class="ttdeal"><a href="#">Kirei Fashion</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog34" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/747993869we18.jpg"/></p>
		</div> 

    <div id="featured-products_block_center35">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/1091064375sm10.jpg" alt="Shop Thời Trang Mốt Trẻ" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Phong c&aacute;ch lịch l&atilde;m, trẻ trung cho đấng m&agrave;y r&acirc;u</p>
 </div>
                            <a href="#" id="count_down_container35" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container35", "march 05, "+2013+" 06:54:46")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center35 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center35 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center35 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center35 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center35 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center35 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center35 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center35 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center35 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center35 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center35 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center35 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center35 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link35" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
                    <div class="ttdeal"><a href="#">Shop Thời Trang Mốt Trẻ</a></div>
                </div>
            </div>
               
         <div style="width:30px; float:left; height:1px;"></div> 
            
        <div id="dialog35" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/299495487shop Thời trang Mốt trẻ 2.png"/></p>
		</div> 

    <div id="featured-products_block_center36">
                    <div class="block_content">
                    <ul>
                        <li class="ajax_block_product">
                            <a class="product_image" href="#" title="#"><img src="images/sanpham/698457764dung-cu-thu-day-phone-rilakkuma-21.jpg" alt="Pety Shop" width="290" height="184"></a>
                            <div class="product_info">
                                <div class="desc"><p>
	Sắm phụ kiện thời trang độc đ&aacute;o v&agrave; c&aacute; t&iacute;nh ưu đ&atilde;i tới 25% tại Pety Shop</p>
 </div>
                            <a href="#" id="count_down_container36" class="dealtime fleft"></a>
                            <script type="text/javascript">
                                /*							
                                var target_date=new cdtime("count_down_container36", "february 28, "+2013+" 11:30:29")
                                target_date.displaycountdown("days", displayCountDown)*/


                                $(document).ready(function () {
                                    $("#featured-products_block_center36 li").hover(function () {
                                        $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                    },
  function () {
      $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
  })
                                });
 
</script>
<style>

div#featured-products_block_center36 { width:284px; border-radius:8px; padding:7px; background-color:#eee; float:left;}
div#featured-products_block_center36 h4 {padding:7px 0;font-size:12px;font-weight:bold;color:#374853;text-transform:uppercase;}
div#featured-products_block_center36 ul {width:280px;overflow:hidden; margin-top:0px; margin-left:1px;}
div#featured-products_block_center36 ul li {width:272px; height:160px; float:left;margin:6px 8px 0 0;position:relative;background:url('../img/masck.png') left top no-repeat; padding:4px; overflow:hidden; background-color:#ff660d;}
div#featured-products_block_center36 ul li .product_image { margin:0px 0 0 1px }
div#featured-products_block_center36 ul li .product_image img{ width:270px; height:160px;}
div#featured-products_block_center36 ul li div.product_info {background: url(../images/dot-white.png);
    bottom:-200px;
    height:132px;
    left:9px;
    position: absolute;
    width:240px; 
	padding:10px;}
div#featured-products_block_center36 ul li div.product_info .desc { font-size:11px; color:#000; text-decoration:none;padding:0px; line-height:1.3em;}

div#featured-products_block_center36 ul li div.product_info p.product_desc {padding:3px 0 0 0;}

div#featured-products_block_center36 ul li div.product_info span.price {display:block;padding:3px 0 0 17px; font-size:22px; color:#353637; font-weight:normal;}
div#featured-products_block_center36 ul li div.product_info p.buttons {padding:0;}
div#featured-products_block_center36 ul li div.product_info p.buttons a {margin:6px 0 0 0;}
</style>

                    		<div class="xem-bt"><a href="ProductDetail.aspx"></a></div><a href="#" id="dialog_link36" class="orange fleft bold f16 pad_r10">Xem địa điểm</a>
                            </div>
                        </li>
                    </ul>
                    <div class="dealpc"><div class="showdealpc"> 25%</div></div>     
                    <div class="ttdeal"><a href="#">Pety Shop</a></div>
                </div>
            </div>
               
            
             <div class="clear h_15"></div>
             
             
              
        <div id="dialog36" title="Bản đồ" style=" display:none !important">
			<p><img src="images/bando/75734889pt14.png"/></p>
		</div> 

            <!-- -->

 <div class="xemtatca"><a href="#">Xem tất cả ...!</a></div>
<div style="clear: both"></div></div>
            <!-- -->
        
        <!-- -->
        <div class="clear"></div>
        <!-- -->
        <div class="clear"></div>
        
    
    
</asp:Content>
