<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
    <style type="text/css">
    @import "jquery.countdown.css";

    </style>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="countdown/jquery.countdown.js"></script>
    <script type="text/javascript">
        $(function () {
            var austDay = new Date();
            austDay = new Date(austDay.getFullYear() + 1, 1 - 1, 08);
            $('#countdown').countdown({ until: austDay });
            $('#year').text(austDay.getFullYear());
        });
    </script>

    <!--<link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="~/Styles/Bottom.css" rel="stylesheet" type="text/css" />-->
    <script src="Scripts/ga.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/jquery.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/core.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/footer.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/district.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/jtip.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/jcarousellite.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/jquery.jNice.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/header.js" type="text/javascript"></script>
    <script src="Scripts/customer.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/gold.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/cart.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/cart_promotion.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/cart_salesOff.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/jquery.jcache.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/jquery.hightlight.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/jquery.lazyload.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/search.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/product.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/connectOauth.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/password.js" language="javascript" type="text/javascript"></script>
    <script src="Scripts/customerEdit.js" language="javascript" type="text/javascript"></script>
    
      <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-16561602-7']);
          _gaq.push(['_trackPageview']);
          (function () {
              var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
              ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
              var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
        </script>
        <script type="text/javascript">
            if (window.addEventListener) {
                var callback_func = function (evt) {
                    if ('undefined' != typeof evt.target && "A" == evt.target.nodeName) {
                        var url = evt.target.href;
                        EBCallBackMessageReceivedCT2790392_129633547190125290(url);
                    }
                    return true;
                };
                var result = window.addEventListener('click', callback_func, true);
                var result = window.addEventListener('contextmenu', callback_func, true);
            } else if (document.attachEvent) {
                var callback_func = function () {
                    if ('undefined' != typeof event.srcElement && 'A' == event.srcElement.tagName) {
                        var url = event.srcElement.href;
                        EBCallBackMessageReceivedCT2790392_129633547190125290(url);
                    }
                    return true;
                };
                var result = document.attachEvent('onclick', callback_func);
                var result = document.attachEvent('oncontextmenu', callback_func);
            }
        </script>
        <script type="text/javascript">
            if (window.addEventListener) {
                var callback_func = function (evt) {
                    if ('undefined' != typeof evt.target && "A" == evt.target.nodeName) {
                        var url = evt.target.href;
                        EBCallBackMessageReceivedCT2790392_129633547190125290(url);
                    }
                    return true;
                };
                var result = window.addEventListener('click', callback_func, true);
                var result = window.addEventListener('contextmenu', callback_func, true);
            } else if (document.attachEvent) {
                var callback_func = function () {
                    if ('undefined' != typeof event.srcElement && 'A' == event.srcElement.tagName) {
                        var url = event.srcElement.href;
                        EBCallBackMessageReceivedCT2790392_129633547190125290(url);
                    }
                    return true;
                };
                var result = document.attachEvent('onclick', callback_func);
                var result = document.attachEvent('oncontextmenu', callback_func);
            }
        </script>
        <script type="text/javascript">
            if (window.addEventListener) {
                var callback_func = function (evt) {
                    if ('undefined' != typeof evt.target && "A" == evt.target.nodeName) {
                        var url = evt.target.href;
                        EBCallBackMessageReceivedCT2790392_129633547190125290(url);
                    }
                    return true;
                };
                var result = window.addEventListener('click', callback_func, true);
                var result = window.addEventListener('contextmenu', callback_func, true);
            } else if (document.attachEvent) {
                var callback_func = function () {
                    if ('undefined' != typeof event.srcElement && 'A' == event.srcElement.tagName) {
                        var url = event.srcElement.href;
                        EBCallBackMessageReceivedCT2790392_129633547190125290(url);
                    }
                    return true;
                };
                var result = document.attachEvent('onclick', callback_func);
                var result = document.attachEvent('oncontextmenu', callback_func);
            }
        </script>
        <script type="text/javascript">
            if (window.addEventListener) {
                var callback_func = function (evt) {
                    if ('undefined' != typeof evt.target && "A" == evt.target.nodeName) {
                        var url = evt.target.href;
                        EBCallBackMessageReceivedCT2790392_129633547190125290(url);
                    }
                    return true;
                };
                var result = window.addEventListener('click', callback_func, true);
                var result = window.addEventListener('contextmenu', callback_func, true);
            } else if (document.attachEvent) {
                var callback_func = function () {
                    if ('undefined' != typeof event.srcElement && 'A' == event.srcElement.tagName) {
                        var url = event.srcElement.href;
                        EBCallBackMessageReceivedCT2790392_129633547190125290(url);
                    }
                    return true;
                };
                var result = document.attachEvent('onclick', callback_func);
                var result = document.attachEvent('oncontextmenu', callback_func);
            }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="rightNewMainBox">
                <div>
                    <div>
                        <div>
                            <div id="productItem4649" class="boxConner boxConner3" style="border-radius: 0 0 0 2px;-moz-border-radius: 0 0 0 2px">
                                <div class="contentBoxNew">
                                    <div class="topTitleContent">
                                        <div class="duoi fixPNG">1</div>
                                        <div class="topTitle">
                                            <div class="fl mRight5">
                                                <span class="cProvince">TP Hồ Chí Minh :</span>
                                                <span>Xem dia chi tren web </span>
                                            </div>
                                            <div class="c"></div>
                                        </div>
                                        <div class="titleBox mTop5">
                                            <div class="titleBoxName">
                                                <a href="DetailProduct.aspx">Combo 03 hộp bánh xếp nhật Yaki Gyoza từ Nhà hàng Nhật Bản Mì Nhất - Chỉ 75.000đ</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="contentMain">
                                        <div class="leftNewContentMainBox fl">
                                            <div id="borderImg" align="center">
                                                <div class="discount_new fixPNG">
                                                    <span>Giảm</span>
                                                    <div>38%</div>
                                                </div>
                                                <a href="DetailProduct.aspx">
                                                <img height="334" width="508" style="margin-top:1px" alt="deal image" src="http://muachung10.vcmedia.vn/thumb_w/487/product/5/7/0.423891001333530133.jpg">
                                                </a>
                                            </div>
                                            <div class="bottomImg">
                                                <div class="pageView fl">
                                                    <b>Lượt xem:</b>
                                                    (1.961)
                                                </div>
                                                <div class="fl pLR5">
                                                    <b> - </b>
                                                </div>
                                                <div class="attractive fl">
                                                    <b>Độ hấp dẫn:</b>
                                                    (2.333)
                                                </div>
                                            </div>
                                            <div class="contentMainBox">
                                                <div>
                                                    <p style="text-align: justify; ">
                                                        <span style="font-size: 13px; ">
                                                            <span style="font-family: arial,helvetica,sans-serif;">
                                                                * Chỉ với
                                                                <span style="color: rgb(0, 0, 255);">
                                                                    <strong>75.000đ</strong>
                                                                </span>
                                                                ,
                                                            </span>
                                                        </span>
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">
                                                                sở hữu ngay
                                                                <strong>03&nbsp;hộp bánh xếp Yaki Gyoza tươi của &nbsp;Nhật </strong>
                                                                &nbsp;từ
                                                                <strong>Nhà hàng Mì Nhất</strong>
                                                                &nbsp;trị giá
                                                            </span>
                                                        </span>
                                                        <span class="Apple-style-span" style="font-size: 13px; ">
                                                            <span style="color: rgb(255, 0, 0);">
                                                                <strike>
                                                                    <strong>
                                                                        <span style="font-size: 18px;">
                                                                            <span style="font-family: arial,helvetica,sans-serif;">120.000đ</span>
                                                                        </span>
                                                                    </strong>
                                                                </strike>
                                                            </span>
                                                            <span style="font-family: arial,helvetica,sans-serif;">
                                                                <em>
                                                                    <strong>&nbsp;</strong>
                                                                </em>
                                                                -
                                                                <span style="color: rgb(0, 128, 0);">
                                                                    <strong>Tiết kiệm 38%</strong>
                                                                </span>
                                                            </span>
                                                        </span>
                                                    </p>
                                                    <p style="text-align: justify; ">
                                                        <font face="arial, helvetica, sans-serif" size="2">* Mỗi phiếu đổi được 3 hộp bánh xếp</font>
                                                    </p>
                                                    <p style="text-align: justify; ">
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">
                                                                * Quy cách đóng gói:
                                                                <strong>Hộp 5 cái</strong>
                                                            </span>
                                                        </span>
                                                        </p>
                                                        <p style="text-align: justify; ">
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">
                                                                * Thành phần:
                                                                <strong>Thịt heo, bắp cải, hẹ, hành tây, baro, gừng, tỏi...</strong>
                                                            </span>
                                                        </span>
                                                        </p>
                                                        <p style="text-align: justify; ">
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">
                                                                * Bảo quản:
                                                                <strong> tủ đông hoặc ngăn đá (5 tháng)</strong>
                                                            </span>
                                                        </span>
                                                        </p>
                                                        <p style="text-align: justify; ">
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">* Cách sử dung: Không cần rã đông. Chiên hoặc luộc trong vòng 4, 6 phút</span>
                                                        </span>
                                                    </p>
                                                    <p style="text-align: justify; ">
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">* </span>
                                                        </span>
                                                        B
                                                        <span style="font-family: arial, helvetica, sans-serif; font-size: 13px; ">ánh xếp Nhật tại Mì Nhất được chế biến rất cầu kỳ và công phu từ công đoạn làm vỏ bánh, nhân bánh đến bảo quản, cho sản phẩm giữ được hương vị bánh xếp Nhật Bản.</span>
                                                    </p>
                                                    <p style="text-align: justify; ">
                                                        <strong style="font-family: arial, helvetica, sans-serif; font-size: 13px; ">Nhà hàng Mì Nhất</strong>
                                                        <span style="font-family: arial, helvetica, sans-serif; font-size: 13px; "> :Không gian đồng bộ một màu sắc Nhật, từ các vật dụng nhỏ nhất hay đến kiểu các trang trí đều có hơi hướng của đất nước hoa anh đào.&nbsp;Đặc trưng nhất của nhà hàng Mì Nhất là món mì mang đậm hương vị ẩm thực Nhật</span>
                                                    </p>
                                                    <p style="text-align: justify; ">
                                                        <span style="color:#0000ff;">
                                                            <strong>
                                                                <span style="font-size:13px;">
                                                                    <span style="font-family:arial,helvetica,sans-serif;">Bánh xếp tươi. Quý khách mang về chế biến tùy ý</span>
                                                                </span>
                                                            </strong>
                                                        </span>
                                                        </p>
                                                        <div class="moreNew fr">
                                                        <a style="font-size:12px" href="DetailProduct.aspx">Xem chi tiết</a>
                                                    </div>
                                                    <div class="c"></div>
                                                </div>
                                            </div>
                                                        
                                        </div>
                                        <div class="rightNewContentMainBox fr">
                                                <div class="mainPrice">
                                                    <div class="topTextPrice" align="left">
                                                        <div id="f14" align="left">Giá chỉ</div>
                                                        <div class="numPrice">75.000 đ</div>
                                                        <div style="color:#98bfe1">
                                                            Giá gốc
                                                            <b>
                                                                <strike>120.000 đ</strike>
                                                            </b>
                                                        </div>
                                                    </div>
                                                    <div class="mTop5 " align="center">
                                                        <a class="buyNow fixPng" onclick="shop.cart.addItem(4649,1333602000,1334206740,61,300)" href="Member/OrderStep1.aspx"></a>
                                                    </div>
                                                    <div style="height: 5px;overflow: hidden;"></div>
                                                    </div>
                                                    <div id="buyerHomeStatistics-4649" class="mTop15 boxGreenNew boxGreenNewIE7">
                                                    <div class="mainBlueBoxNew p1">
                                                        <div class="pBottom10" style="border-top:1px solid #fff">
                                                            <div id="event_end4649" class="buyerStatic">
                                                                <div id="deal4649" class="cBarText" align="center" style="color: rgb(84, 104, 45);">
                                                                    <span>
                                                                        Còn
                                                                        <b>222</b>
                                                                        Phiếu
                                                                    </span>
                                                                </div>
                                                                <div class="buyerStatus">
                                                                    <div class="numBuyer">
                                                                        (Đã có
                                                                        <b>78</b>
                                                                        người mua)
                                                                    </div>
                                                                </div>
                                                                <div class="productStatus updated">
                                                                    <div class="cBarText2 buying"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    </div>
                                                    <div class="boxGreenNew" style="border-top:none">
                                                    <div class="mainBlueBoxNew" style="border-top:1px solid #fff">
                                                        <div class="contentBoxGreen">
                                                            <div class="timer">
                                                                <div class="timerIcon">
                                                                    <div id="timeTitle4649">Thời gian còn lại</div>
                                                                    <div>
                                                                        <b>
                                                                            <b id="timeCount4649">
                                                                                <span style="">6 ngày, 00:55:0</span>
                                                                            </b>
                                                                        </b>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="boxCommentBG" style = "background: url('images/new/boxComment2.png') no-repeat;">
                                                        <div class="boxCommentC">
                                                            <div class="widthBoxComment">
                                                                <div class="titleComment" style="overflow:hidden">
                                                                    <a title="Bình luận cho sản phẩm" href="Comment.aspx">Bình luận (4)</a>
                                                                </div>
                                                                <div class="midComment comment-float comment-item ">
                                                                    <div id="mRight5" class="fl w40 avatar2">
                                                                        <img align="left" width="32" title="Muachunghcm" alt="Muachunghcm" src="../images/product/0.698483001306934599.png">
                                                                    </div>
                                                                    <div class="fl" style="width:150px;height:48px;overflow:hidden;font-size: 11px">
                                                                        <strong>Muachunghcm</strong>
                                                                        <div class="mTop5" style="color:#797979">Đơn hàng này chỉ có combo 3 hộp bánh xếp, không kèm theo nước chấm bạn nhé!</div>
                                                                    </div>
                                                                    <div class="c"> </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        <div class="c"></div>
                                        <div>
                                            <div class="FB_like fl pTop10">
                                                <iframe scrolling="no" frameborder="0" allowtransparency="true" style="border:none; overflow:hidden; width:450px; height:25px;" src="http://www.facebook.com/plugins/like.php?locale=vi&href=http%3A%2F%2Fmuachung.vn%2Fsan-pham%2Fp-4649%2FCombo-03-hop-banh-xep-nhat-Yaki-Gyouza.html&layout=standard&show_faces=false&width=450&action=like&font=arial&colorscheme=light&height=25">
                                                </iframe>
                                            </div>
                                            <div class="clear"></div>
                                        </div>
                                        <div class="clear"></div>
                                        <div class="block_notice mTop15">
                                            <div class="content">
                                                <div class="content_bg">
                                                    <div class="leftBG">
                                                        <div class="notice">Lưu ý cho khách hàng</div>
                                                        <div>
                                                            <div>
                                                                <div>
                                                                    <div>
                                                                        <div>
                                                                            <p style="text-align: justify; margin: 10px 0px;">
                                                                                <span class="Apple-style-span" style="color: rgb(59, 59, 59); font-family: arial,helvetica,sans-serif; font-size: 13px;">
                                                                                    <span style="color: rgb(0, 0, 255);">
                                                                                        <b style="font-weight: bold;">
                                                                                            <strong style="font-weight: bold;">1. Phiếu điện tử</strong>
                                                                                        </b>
                                                                                    </span>
                                                                                    <span>
                                                                                        sẽ được gửi vào&nbsp;
                                                                                        <strong style="font-weight: bold;">email/ SMS</strong>
                                                                                        &nbsp;cho quý khách. Quý khách vui lòng mang mã này đến nhà cung cấp để được sử dụng.
                                                                                    </span>
                                                                                </span>
                                                                            </p>
                                                                            <p style="margin: 10px 0px; text-align: justify; font-family: arial; color: rgb(59, 59, 59); font-size: 12px;">
                                                                                <font class="Apple-style-span" size="2" face="arial, helvetica, sans-serif">
                                                                                    <span style="color: rgb(0, 0, 255);">
                                                                                        <span style="font-size: 13px;">
                                                                                            <span style="font-family: arial,helvetica,sans-serif;">
                                                                                                <b style="font-weight: bold;">
                                                                                                    <strong style="font-weight: bold;">2.&nbsp;Các hình thức thanh toán</strong>
                                                                                                </b>
                                                                                            </span>
                                                                                        </span>
                                                                                    </span>
                                                                                </font>
                                                                            </p>
                                                                            <p style="margin: 10px 0px; text-align: justify; font-family: arial; color: rgb(59, 59, 59); font-size: 12px;">
                                                                                <font class="Apple-style-span" size="2" face="arial, helvetica, sans-serif">
                                                                                    <span style="font-size: 13px;">
                                                                                        <span style="font-family: arial,helvetica,sans-serif;">
                                                                                            - Khi Thanh toán bằng
                                                                                            <strong style="font-weight: bold;">&nbsp;Visa/Master, Internet /SMS banking</strong>
                                                                                            ,&nbsp;phiếu điện tử sẽ được gửi cho quý khách trong vòng 30 phút.&nbsp;
                                                                                        </span>
                                                                                    </span>
                                                                                </font>
                                                                            </p>
                                                                            <p style="margin: 10px 0px; text-align: justify; font-family: arial; color: rgb(59, 59, 59); font-size: 12px;">
                                                                                <font class="Apple-style-span" size="2" face="arial, helvetica, sans-serif">
                                                                                    <span style="font-size: 13px;">
                                                                                        <span style="font-family: arial,helvetica,sans-serif;">
                                                                                            <span>- Nếu lựa chọn&nbsp;</span>
                                                                                            <strong style="font-weight: bold;">Thu tiền tận nơi</strong>
                                                                                            , thẻ cào sẽ được giao trong 02-07 ngày việc. Khi nhận được thẻ cào, quý khách cào lấy mã, nhập vào hệ thống để nhận phiếu điện tử.
                                                                                        </span>
                                                                                    </span>
                                                                                </font>
                                                                                </p>
                                                                                <p style="margin: 10px 0px; text-align: justify; font-family: arial; color: rgb(59, 59, 59); font-size: 12px;">
                                                                                <font class="Apple-style-span" size="2" face="arial, helvetica, sans-serif">
                                                                                    <span style="color: rgb(0, 0, 255);">
                                                                                        <span style="font-size: 13px;">
                                                                                            <span style="font-family: arial,helvetica,sans-serif;">
                                                                                                <b style="font-weight: bold;">
                                                                                                    <strong style="font-weight: bold;">3.&nbsp; Lưu ý</strong>
                                                                                                </b>
                                                                                            </span>
                                                                                        </span>
                                                                                    </span>
                                                                                </font>
                                                                                </p>
                                                                                <p style="margin: 10px 0px; text-align: justify; font-family: arial; color: rgb(59, 59, 59); font-size: 12px;">
                                                                                <font class="Apple-style-span" size="2" face="arial, helvetica, sans-serif">
                                                                                    <span style="font-size: 13px;">
                                                                                        <span style="font-family: arial,helvetica,sans-serif;">- Không mang thẻ được giao tới cửa hàng để sử dụng. Cửa hàng chỉ chấp nhận phiếu điện tử.</span>
                                                                                    </span>
                                                                                </font>
                                                                                </p>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="rightBG">
                                                        <div class="conditions">Điều kiện sử dụng</div>
                                                        <div>
                                                            <p style="text-align: justify; ">
                                                                <span style="font-size:13px;">
                                                                    <span style="font-family:arial,helvetica,sans-serif;">
                                                                        - Phiếu mua
                                                                        <strong>Bánh xếp nhật Yaki Gyoza&nbsp;</strong>
                                                                        từ&nbsp;&nbsp;
                                                                        <strong>Nhà hàng Nhật Bản Mì Nhất</strong>
                                                                    </span>
                                                                </span>
                                                                </p>
                                                                <p style="text-align: justify;">
                                                                <span class="Apple-style-span" style="font-family: arial, helvetica, sans-serif; font-size: 13px; ">- Hết hạn lấy hàng:</span>
                                                                    <span class="Apple-style-span" style="font-family: arial,helvetica,sans-serif; font-size: 13px;">
                                                                    <strong>&nbsp;12/05/2012.</strong>
                                                                </span>
                                                                </p>
                                                                <p style="text-align: justify;">
                                                                <span style="font-size: 13px;">
                                                                    <span class="Apple-style-span" style="font-family: arial,helvetica,sans-serif;">-&nbsp;</span>
                                                                    <span class="Apple-style-span" style="font-family: arial,helvetica,sans-serif;">
                                                                        <strong>01 phiếu đổi được 03 hộp bánh xếp</strong>
                                                                    </span>
                                                                    <span class="Apple-style-span" style="font-family: arial,helvetica,sans-serif;">
                                                                        <b>.</b>
                                                                    </span>
                                                                </span>
                                                                </p>
                                                                <p style="text-align: justify;">
                                                                <span style="font-size: 13px;">
                                                                    <span class="Apple-style-span" style="font-family: arial,helvetica,sans-serif;">- Không áp dụng cho sản phẩm và các chương trình khuyến mãi khác.&nbsp;</span>
                                                                </span>
                                                                <span style="font-family: arial, helvetica, sans-serif; font-size: 13px; ">Phiếu không có giá trị quy đổi thành tiền mặt, không trả lại tiền thừa.</span>
                                                                </p>
                                                                <p style="text-align: justify;">
                                                                    <span style="font-size:13px;">
                                                                        <span style="font-family:arial,helvetica,sans-serif;">- Không giới hạn số lượng mua đối với mỗi khách hàng.</span>
                                                                    </span>
                                                                </p>
                                                                <p>
                                                                    <span class="Apple-style-span" style="font-family: arial, helvetica, sans-serif; font-size: 13px; ">- Địa chỉ nhận sản phẩm:</span>
                                                                    <strong>
                                                                        <span class="Apple-style-span" style="font-family: arial, helvetica, sans-serif; font-size: 13px; ">
                                                                            <em>Vui lòng xem thông tin chi tiết</em>
                                                                        </span>
                                                                    </strong>
                                                                </p>
                                                                <p style="text-align: justify; ">
                                                                    <span style="font-size:13px;">
                                                                        <span style="font-family:arial,helvetica,sans-serif;">- Quý khách vui lòng gọi điện thoại trước khi đến lấy sản phẩm để đảm bảo có hàng</span>
                                                                    </span>
                                                                </p>
                                                        </div>
                                                    </div>
                                                    <div class="c"></div>
                                                </div>
                                            </div>
                            <div class="bottom"></div>

                        </div>
                                        <div class="blueTitleDetail mTop5">
                                            <div class="grayTitleNew">THÔNG TIN CHI TIẾT VỀ SẢN PHẨM</div>
                                            <div>
                                                <p>
                                                    <strong>
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">ĐIỂM NỔI BẬT</span>
                                                        </span>
                                                    </strong>
                                                </p>
                                                <p>
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">
                                                            - Chỉ với&nbsp;
                                                            <strong>75.000đ,&nbsp;</strong>
                                                            sở hữu ngay
                                                            <strong>&nbsp;03&nbsp;hộp bánh xếp nhật Yaki Gyoza</strong>
                                                            &nbsp;từ&nbsp;
                                                            <strong>Nhà hàng Mì Nhất</strong>
                                                        </span>
                                                    </span>
                                                </p>
                                                <p style="text-align: center;">
                                                    <img src="http://muachung10.vcmedia.vn/thumb_w/550/gallery/2012/04/04/0.558609001333530370.jpg" alt="">
                                                </p>
                                                <p style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">Gyoza là món bánh truyền thống của Trung Quốc. Sau đó được du nhập vào Nhật Bản theo cách ăn khác biệt và Gyoza đã trở thành một trong những món ăn chính và yêu thích trong ẩm thực Nhật Bản</span>
                                                    </span>
                                                </p>
                                                <p style="text-align: center; ">
                                                    <img src="http://muachung10.vcmedia.vn/thumb_w/550/gallery/2012/04/04/0.528551001333530386.jpg" alt="">
                                                </p>
                                                <p style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">Đặc trưng của món bánh này ở xứ sở hoa anh đào là bánh không hấp mà chiên cho vàng đáy, ăn giòn giòn và kèm với nước chấm.&nbsp;</span>
                                                    </span>
                                                    <span style="font-family: arial, helvetica, sans-serif; font-size: 13px; ">Người Trung Quốc đem hấp &ndash; khi chín có độ trắng, trong và mềm. Còn Người Nhật thì lại ăn theo cách riêng &ndash; Gyoza vừa hấp cho chín rồi lại chiên cho vừa có độ giòn, vừa có độ mềm. Khi ăn có mùi vị Sake (rượu Nhật), Shouyu (nước tương).</span>
                                                </p>
                                                <p style="text-align: center;">
                                                    <img src="http://muachung10.vcmedia.vn/thumb_w/550/gallery/2012/04/04/0.686758001333530401.jpg" alt="">
                                                </p>
                                                <p style="text-align: center;">
                                                    <img src="http://muachung10.vcmedia.vn/thumb_w/550/gallery/2012/04/04/0.722103001333530425.jpg" alt="">
                                                </p>
                                                <p style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">Công thức làm bánh do chính chủ doanh nghiệp &ndash; người Nhật đã tự nghiên cứu và chọn lựa để giới thiệu đến cho khách hàng Việt Nam hương vị một món ăn đặc trưng trong ẩm thực Nhật.</span>
                                                    </span>
                                                </p>
                                                <p style="text-align: center;">
                                                    <img src="http://muachung10.vcmedia.vn/thumb_w/550/gallery/2012/04/04/0.888195001333530453.jpg" alt="">
                                                </p>
                                                <p style="text-align: center;">
                                                    <strong>
                                                        <em>
                                                            <span style="font-size:13px;">
                                                                <span style="font-family:arial,helvetica,sans-serif;">Bánh xếp chiên</span>
                                                            </span>
                                                        </em>
                                                    </strong>
                                                    </p>
                                                    <p style="text-align: center; ">
                                                    <img src="http://muachung10.vcmedia.vn/thumb_w/550/gallery/2012/04/04/0.576678001333530490.jpg" alt="">
                                                </p>
                                                <p style="text-align: center; ">
                                                    <strong>
                                                        <em>
                                                            <span style="font-size:13px;">
                                                                <span style="font-family:arial,helvetica,sans-serif;">Bánh xếp hấp</span>
                                                            </span>
                                                        </em>
                                                    </strong>
                                                </p>
                                                <p style="text-align: justify; ">
                                                    <strong>
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">Đia chỉ nhận sản phẩm</span>
                                                        </span>
                                                    </strong>
                                                </p>
                                                <p style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">Khách hàng nhận sản phẩm tại 2 địa điểm</span>
                                                    </span>
                                                </p>
                                                <div style="text-align: justify; ">
                                                    <strong>
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">1/ Công ty TNHH Một Thành Viên Thực Phẩm Xứ Mặt Trời Mọc.</span>
                                                        </span>
                                                    </strong>
                                                </div>
                                                <div style="text-align: justify; "> &nbsp;</div>
                                                <div style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">
                                                            - Địa chỉ:
                                                            <strong>685/23 Xô Viết Nghệ Tĩnh, P.26, Q.Bình Thạnh.</strong>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div style="text-align: justify; "> &nbsp;</div>
                                                <div style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">
                                                            - Điện thoại: (
                                                            <strong>08) 3899 2228</strong>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div style="text-align: justify; "> &nbsp;</div>
                                                <div style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">
                                                            - Giờ mở cửa:
                                                            <strong>9h - 17h (thứ 2 - CN)</strong>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div style="text-align: justify; "> &nbsp;</div>
                                                <div style="text-align: justify; ">
                                                    <strong>
                                                        <span style="font-size:13px;">
                                                            <span style="font-family:arial,helvetica,sans-serif;">2/&nbsp;Nhà hàng Mì Nhất</span>
                                                        </span>
                                                    </strong>
                                                    </div>
                                                <p style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">
                                                            -&nbsp;Địa chỉ:&nbsp;
                                                            <strong>27/5 Nguyễn Bỉnh Khiêm P.Đa Kao Q.1</strong>
                                                        </span>
                                                    </span>
                                                </p>
                                                <p style="text-align: justify; ">
                                                    <span style="font-size:13px;">
                                                        <span style="font-family:arial,helvetica,sans-serif;">
                                                            - Điện thoại:&nbsp;
                                                            <strong>(08) 3910 0807</strong>
                                                        </span>
                                                    </span>
                                                </p>
                                            </div>
                                            <div class="c"></div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="boxBottomLeft fixPNG">
                                <div class="boxBottom"></div>
                                <div class="boxBottomRight fixPNG"></div>
                                <div class="c"></div>
                            </div>
                            <div class="mTop10 mBottom10">
                                <div class="boxTopLeft fixPNG">
                                    <div class="boxTop"></div>
                                    <div class="boxTopRight fixPNG"></div>
                                    <div class="c"></div>
                                </div>
                                <div class="boxConner">
                                    <div class="blueTitle">BẢN ĐỒ</div>
                                    <div class="contentBoxNew pLR10">
                                        <div class="contentBox p10 mapInfo" align="center">
                                            <img width="690" alt="shop map" src="http://muachung10.vcmedia.vn/map/2012/04/04/0.028947001333530131.jpg">
                                        </div>
                                    </div>
                                    <div class="boxBottomLeft fixPNG">
                                        <div class="boxBottom"></div>
                                        <div class="boxBottomRight fixPNG"></div>
                                        <div class="c"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="c"></div>
                    </div>
                </div>
            </div>
</asp:Content>
