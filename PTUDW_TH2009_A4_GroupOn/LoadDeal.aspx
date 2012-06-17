<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoadDeal.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.LoadDeal" %>
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


<div style="clear: both"></div>
<div class="clear h_15"></div>

<div style="clear: both"></div></div>
            <!-- -->
        <!-- -->
        <div class="clear"></div>
        <!-- -->
        <div class="clear"></div>
        
    
    
</asp:Content>
