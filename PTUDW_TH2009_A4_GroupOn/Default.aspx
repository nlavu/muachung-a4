<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script src="js/jquery.countdown.js" language="javascript"></script>
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
        <div class="quanhuyen-tt">Deal</div>
        <div class="wrapquanhuyen">
            <div class="quanhuyen"><a href="#">Deal Khuyến Mãi<span class="orange"></span></a></div> 
            <div class="quanhuyen"><a href="#">Deal Đã Bán<span class="orange"></span></a></div> 
            <div class="quanhuyen"><a href="#">Tất Cả Deal<span class="orange"></span></a></div>
        </div>
    </div>          
    <div class="boxdmsp">
        <div class="danhmucsp">Sản phẩm</div>
        <!-- -->
        <div class="wraplinkdmsp">
            <asp:Literal ID="ltrSanPham" runat="server"></asp:Literal>
        </div>       
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

    <asp:Literal ID="ltrShowProduct" runat="server"></asp:Literal>

<div class="title_new">
        <h2>Ð?a di?m n?i b?t</h2>
    </div>
    <div class="clear h_15"></div>

    <div id="featured-products_block_center">
        <div class="block_content">
            <ul>
                <li class="ajax_block_product">
                    <a class="product_image" href="ProductDetail.aspx" title="#">
                        <img src="images/sanpham/1139559419noithat8.jpg" alt="N?i Th?t Ki?n Xinh" width="290" height="184">
                    </a>
                    <div class="product_info">
                        <div class="desc">
                            <p>H?y d? chúng tôi góp m?t ph?n nh? làm hoàn thi?n hon ...</p>
                        </div>
    
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $("#featured-products_block_center li").hover(function () {
                                    $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                },
                          function () {
                              $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
                          })
                            });
 
                        </script>
                         <!--countdown-->  
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    // create a new date and insert it
                                    var myDate = new Date(2012, 11, 15, 0, 0, 0)
                                    $.countdown('#countbox1', myDate);
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

                        <div class="xem-bt"><a href="ProductDetail.aspx"></a></div>
                        <a href="ProductDetail.aspx" id="dialog_link1" class="orange fleft bold f16 pad_r10">Xem d?a di?m</a>
                    </div>
                </li>
            </ul>
            <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
            <div class="ttdeal"><a href="#">N?i Th?t Ki?n Xinh</a></div>
            <div class="price">
                <div class="new_price"><a href="#">2000000Đ</a></div>
                <div class="old_price"><a href="#">2000000Đ</a></div>
            </div>
            <h1 id="countbox1"></h1>
        </div>
    </div>          
    <div style="width:30px; float:left; height:1px;"></div>       
    <div id="dialog1" title="B?n d?" style="display:none !important;z-index:99999999 !important">
		<p><img src="images/bando/1029248795N?i th?t Ki?n Xinh.png"/></p>
	</div> 

     <div id="featured-products_block_center">
        <div class="block_content">
            <ul>
                <li class="ajax_block_product">
                    <a class="product_image" href="ProductDetail.aspx" title="#">
                        <img src="images/sanpham/1139559419noithat8.jpg" alt="N?i Th?t Ki?n Xinh" width="290" height="184">
                    </a>
                    <div class="product_info">
                        <div class="desc">
                            <p>H?y d? chúng tôi góp m?t ph?n nh? làm hoàn thi?n hon ...</p>
                        </div>
    
                        <script type="text/javascript">
                            $(document).ready(function () {
                                $("#featured-products_block_center li").hover(function () {
                                    $(this).find("div.product_info").stop().animate({ bottom: '8' }, 800, 'easeOutQuart');
                                },
                          function () {
                              $(this).find("div.product_info").stop().animate({ bottom: '-200' }, 800, 'easeOutQuart');
                          })
                            });
 
                        </script>
                         <!--countdown-->  
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    // create a new date and insert it
                                    var myDate = new Date(2012, 11, 15, 0, 0, 0)
                                    $.countdown('#countbox2', myDate);
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

                        <div class="xem-bt"><a href="ProductDetail.aspx"></a></div>
                        <a href="ProductDetail.aspx" id="A1" class="orange fleft bold f16 pad_r10">Xem d?a di?m</a>
                    </div>
                </li>
            </ul>
            <div class="dealpc"><div class="showdealpc"> 10%</div></div>     
            <div class="ttdeal"><a href="#">N?i Th?t Ki?n Xinh</a></div>
            <div class="price">
                <div class="new_price"><a href="#">2000000Đ</a></div>
                <div class="old_price"><a href="#">2000000Đ</a></div>
            </div>
            <h1 id="countbox2"></h1>
        </div>
    </div>          
    <div style="width:30px; float:left; height:1px;"></div>       
    <div id="Div2" title="B?n d?" style="display:none !important;z-index:99999999 !important">
		<p><img src="images/bando/1029248795N?i th?t Ki?n Xinh.png"/></p>
	</div> 


<div style="clear: both"></div>
<div class="clear h_15"></div>

<div style="clear: both"></div></div>
            <!-- -->
        <!-- -->
        <div class="clear"></div>
        <!-- -->
        <div class="clear"></div>
        
    
    
</asp:Content>
