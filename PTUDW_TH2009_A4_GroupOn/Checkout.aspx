<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CheckOut Product</title>
    <link href="css/styles/demo_style.css" rel="stylesheet" type="text/css">

    <link href="css/styles/smart_wizard.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.smartWizard-2.0.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/checkout.css"/>
    <link rel="stylesheet" type="text/css" href="css/Style_Cart.css"/>

    <script type="text/javascript">
    $(document).ready(function () {
        // Smart Wizard 	
        $('#wizard').smartWizard();

        function onFinishCallback() {
            $('#wizard').smartWizard('showMessage', 'Finish Clicked');
            //alert('Finish Clicked');
        }
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Smart Wizard 2.0 - a javascript jQuery wizard control plugin</h1>
  <h2>Basic Example</h2> 
  <br />
  <a href="#" class="selected">Basic Example</a>
  <a href="#" class="btn">Ajax Contents</a>
  <a href="#" class="btn">Step Validation</a>  
  <a href="#" class="btn">Multiple Wizard</a>
  <a href="#" class="btn">Vertical Style</a>
  <a href="#" class="btn">Go Home</a>
  <a href="#" class="btn">Documentation</a>
</div>
<!-- Smart Wizard -->
<form runat= "server">
  		<div id="wizard" class="swMain">
  			<ul>
  				<li><a href="#step-1">
                <label class="stepNumber">1</label>
                <span class="stepDesc">
                   Step 1<br />
                   <small>Step 1 description</small>
                </span>
            </a></li>
  				<li><a href="#step-2">
                <label class="stepNumber">2</label>
                <span class="stepDesc">
                   Step 2<br />
                   <small>Step 2 description</small>
                </span>
            </a></li>
  				<li><a href="#step-3">
                <label class="stepNumber">3</label>
                <span class="stepDesc">
                   Step 3<br />
                   <small>Step 3 description</small>
                </span>                   
             </a></li>
  				<li><a href="#step-4">
                <label class="stepNumber">4</label>
                <span class="stepDesc">
                   Step 4<br />
                   <small>Step 4 description</small>
                </span>                   
            </a></li>
  			</ul>
  			<div id="step-1">	
            <h2 class="StepTitle">Nhập thông tin cá nhân</h2>
            <ul type="disk">
            </ul>
              <div class="classic-popup-content">
                                <div class="reg_cart_form">
                                    <form id="cartRegisterForm" name="cartRegisterForm">
                                        <div class="cartNewForm">
                                            <div id="cError"></div>
                                            <div class="infoUser">
                                                <div class="text_tit">Thông tin mua hàng của Quý khách:</div>
                                                <div style="padding-left:35px">
                                                <table cellspacing="0" cellpadding="3" border="0">
                                                    <tbody>
                                                        <tr>
                                                            <td class="bold" width="85">Họ và tên:</td>
                                                            <td>
                                                                <asp:TextBox ID="cart_fullname" runat="server"></asp:TextBox>
                                                                <%--<input id="cart_fullname" type="text" value="" name="fullname">--%>
                                                            </td>
                                                        </tr>
                                                        <tr>

                                                            <td class="bold">ĐT di động:</td>
                                                            <td>
                                                                <asp:TextBox ID="cart_tel" runat="server"></asp:TextBox>
                                                                <%--<input id="cart_tel" type="text" onkeypress="return shop.numberOnly(this, event)" maxlength="20" value="" name="tel">--%>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="bold">Email:</td>
                                                            <td>
                                                                <asp:TextBox ID="cart_email" runat="server"></asp:TextBox>
                                                                <%--<input id="cart_email" type="text" value="" name="email">--%>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            </div>
                                            <div class="infoAddress mTop20">
                                                <div class="text_tit">Địa chỉ nhận hàng:</div>
                                                <div style="padding-left:35px">
                                                    <table cellspacing="0" cellpadding="3" border="0">
                                                        <tbody>
                                                            <tr>
                                                                <td class="bold" width="85">Địa chỉ:</td>
                                                                <td>
                                                                    <asp:TextBox ID="cart_address" runat="server"></asp:TextBox>
                                                                    <%--<input id="cart_address" type="text" value="" style="width:400px" name="address">--%>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="c"></div>
                                        </div>
                                    </form>
                                   
                                    <div class="c"></div>
                                </div>
                           
                        </div>
        </div>
  			<div id="step-2">
            <h2 class="StepTitle">Mua hàng</h2>	
            <div class="classic-popup-main">
                        <div class="classic-popup-content">
                                <form id="cartBuyForm" name="cartBuyForm">
                                    <div class="infoNumber">
                                        <div class="text_tit">Số lượng Quý khách cần mua:</div>
                                        <div style="padding-left:43px">
                                            <div id="formQuantity" class="jNice">
                                                <div>
                                                    <div class="jNiceWrapper" style="z-index: 100;">
                                                        <asp:DropDownList ID="DropDownListSoLuong" runat="server">
                                                            <asp:ListItem Selected>1</asp:ListItem>
                                                            <asp:ListItem>2</asp:ListItem>
                                                            <asp:ListItem>3</asp:ListItem>
                                                            <asp:ListItem>4</asp:ListItem>
                                                            <asp:ListItem>5</asp:ListItem>
                                                            <asp:ListItem>6</asp:ListItem>
                                                            <asp:ListItem>7</asp:ListItem>
                                                            <asp:ListItem>8</asp:ListItem>
                                                            <asp:ListItem>9</asp:ListItem>
                                                            <asp:ListItem>10</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>
                                                <div class="xprice">
                                                    x <asp:Label ID="price" runat="server" Text="Label"></asp:Label> đ =
                                                    <span id="numPrice"><asp:Label ID="totalprice" runat="server" Text="Label"></asp:Label> đ</span>
                                                </div>
                                                <div class="c"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="infoCart mTop10">
                                        <div class="text_tit">Hình thức nhận hàng:</div>
                                        <div class="infoShipType">
                                            <div class="mTop10">
                                                <div class="fl mRight5">
                                                    <input id="ship_coupon" class="radio_ship" type="radio" checked="" value="coupon" name="radio_ship">
                                                </div>
                                                <div id="coupon" class="fl rightInfo" style="cursor:pointer">
                                                    <div id="coupon" class="txt_tit">
                                                        MuaChung
                                                        <span class="cRed">GIAO PHIẾU</span>
                                                        mua hàng và thu tiền tận nơi
                                                        <span class="cGreen">(Miễn phí)</span>
                                                    </div>
                                                    <div class="paymentText">
                                                        Trong thời gian từ 2-7 ngày làm việc, MuaChung sẽ giao thẻ cào đến tận nơi cho Quý khách và thu tiền.
                                                        <br>
                                                        Quý khách cào thẻ và làm theo hướng dẫn trên thẻ cào để nhận được phiếu mua hàng qua Email và SMS.
                                                        <br>
                                                        Quý khách mang theo mã số phiếu nhận được để cung cấp khi sử dụng dịch vụ.
                                                    </div>
                                                    <div class="shipGuide shipGuideActive">
                                                        <div class="mTop5">
                                                            <div class="input" style="color:#472900">
                                                                <b>Vui lòng cho biết thêm Phường/Xã nơi quý khách nhận hàng:</b>
                                                            </div>
                                                            <div class="mTop5">
                                                                <asp:TextBox ID="txtdiachi" runat="server"></asp:TextBox>
                                                                <%--<input id="cart_ward2" class="nice_input" type="text" value="165/2 Trần Phú P4 Q5 TP HCM" style="width:235px" name="ward2">--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="c"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="infoTotal mTop10">
                                        <div class="text_tit">
                                            Tổng số tiền Quý khách phải thanh toán:
                                            <asp:Label ID="bgAllPrice" runat="server" Text="Label" ></asp:Label>đ
                                            
                                        </div>
                                    </div>
                                </form>
                               
                                <div class="c"></div>
                        </div>
                    </div>      
        </div>                      
  			<div id="step-3">
            <h2 class="StepTitle">Chọn hình thức thanh toán</h2>	
            <div id="popup-container" style="padding: 0px; color: black; font-size: 12px; height: 900px; display: block;">
                <div class="classic-popup">
                    <div class="classic-popup-main">
                        <form id="co-payment-form" action="">
                            <fieldset>
                                <dl id="checkout-payment-method-load" class="sp-methods">
                                    <dt>
                                        <asp:RadioButton ID="money" runat="server" />
                                        <%--<input id="p_method_checkmo" class="radio" type="radio" title="Check / Money order" name="payment[method]" value="checkmo" autocomplete="off">--%>
                                        <label for="p_method_checkmo">Check / Money order </label>
                                    </dt>
                                    <dt>
                                        <asp:RadioButton ID="credit" runat="server" />
                                        <%--<input id="p_method_ccsave" class="radio" type="radio" title="Credit Card (saved)" name="payment[method]" value="ccsave" autocomplete="off">--%>
                                        <label for="p_method_ccsave">Credit Card (saved) </label>
                                    </dt>
                                    <dd>
                                        <ul id="payment_form_ccsave" class="form-list" style="">
                                            <li>
                                                <label class="required" for="ccsave_cc_owner">
                                                    <em>*</em>
                                                    Name on Card
                                                </label>
                                                <div class="input-box">
                                                    <input id="ccsave_cc_owner" class="input-text required-entry" type="text" value="" name="payment[cc_owner]" title="Name on Card" autocomplete="off">
                                                </div>
                                            </li>
                                            <li>
                                                <label class="required" for="ccsave_cc_type">
                                                    <em>*</em>
                                                    Credit Card Type
                                                </label>
                                                <div class="input-box">
                                                    <select id="ccsave_cc_type" class="required-entry validate-cc-type-select" title="Credit Card Type" name="payment[cc_type]" autocomplete="off">
                                                        <option value="">--Please Select--</option>
                                                        <option value="AE">American Express</option>
                                                        <option value="VI">Visa</option>
                                                        <option value="MC">MasterCard</option>
                                                        <option value="DI">Discover</option>
                                                    </select>
                                                </div>
                                            </li>
                                            <li>
                                                <label class="required" for="ccsave_cc_number">
                                                    <em>*</em>
                                                    Credit Card Number
                                                </label>
                                                <div class="input-box">
                                                    <input id="ccsave_cc_number" class="input-text validate-cc-number validate-cc-type" type="text" value="" title="Credit Card Number" name="payment[cc_number]" autocomplete="off">
                                                </div>
                                            </li>
                                            <li>
                                                <label class="required" for="ccsave_expiration">
                                                    <em>*</em>
                                                    Expiration Date
                                                </label>
                                                <div class="input-box">
                                                    <div class="v-fix">
                                                        <select id="ccsave_expiration" class="month validate-cc-exp required-entry" name="payment[cc_exp_month]" autocomplete="off">
                                                            <option selected="selected" value="">Month</option>
                                                            <option value="1">01 - January</option>
                                                            <option value="2">02 - February</option>
                                                        </select>
                                                    </div>
                                                    <div class="v-fix">
                                                        <select id="ccsave_expiration_yr" class="year required-entry" name="payment[cc_exp_year]" autocomplete="off">
                                                            <option selected="selected" value="">Year</option>
                                                            <option value="2012">2012</option>
                                                            <option value="2013">2013</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </li>
                                            <li>
                                                <label class="required" for="ccsave_cc_cid">
                                                    <em>*</em>
                                                    Card Verification Number
                                                </label>
                                                <div class="input-box">
                                                    <div class="v-fix">
                                                        <input id="ccsave_cc_cid" class="input-text cvv required-entry validate-cc-cvn" type="text" value="" name="payment[cc_cid]" title="Card Verification Number" autocomplete="off">
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                    </dd>
                                </dl>
                            </fieldset>
                        </form>
                        <!--<div class="classic-popup-content">
                                <div id="cod" class="paymentChooseType sendCod">
                                    <div class="arrowRight pBottom10">
                                        <div class="radioBox">
                                            <input id="radio_cod" type="radio" value="cod" name="radio_pay">
                                        </div>
                                        <div class="paymentContent">
                                            <div class="paymentTitle">
                                                Muachung thu tiền tận nơi
                                                <span>(Miễn phí giao Phiếu)</span>
                                            </div> 
                                        </div>
                                        <div class="c"></div>
                                    </div>
                                </div> 
                                <div id="mcard" class="paymentChooseType sendGold">
                                    <div class="arrowRight">
                                        <div class="radioBox">
                                            <input id="radio_mcard" type="radio" value="mcard" name="radio_pay">
                                        </div>
                                        <div class="paymentContent">
                                            <div class="paymentTitle">
                                                Thanh toán bằng Paypal
                                            </div>
                                        </div>
                                        <div class="c"></div>
                                    </div>
                                </div>
                                <div class="c"></div>
                        </div>-->
                    </div>
                    <div class="classic-popup-bottom">
                        <div class="right">
                            <div class="bg"></div>
                        </div>
                    </div>
                </div>
           </div>             				          
        </div>
  			<div id="step-4">
            <h2 class="StepTitle">Thanh Toán</h2>	
            <div class="classic-popup-main">
                        <div class="classic-popup-content">
                                <div class="box-gradien pBottom10 pTop15" style="width:713px">
                                    <div class="title">Thông tin khách hàng</div>
                                    <div id="pTop10" class="noncontent">
                                        <div>
                                            <strong>Họ tên:</strong>
                                            <span class="cff9200">
                                                <asp:Label ID="fnhoten" runat="server" Text="Label"></asp:Label></span>
                                        </div>
                                        <div class="mTop5">
                                            <strong>Email:</strong>
                                            <span class="cff9200">
                                                <asp:Label ID="fnemail" runat="server" Text="Label"></asp:Label></span>
                                        </div>
                                        <div class="mTop5">
                                            <strong>Điện thoại di động:</strong>
                                            <span class="cff9200">
                                                <asp:Label ID="fnphone" runat="server" Text="Label"></asp:Label></span>
                                        </div>
                                        <div class="mTop5">
                                            <strong>Địa chỉ nhận hàng:</strong>
                                            <span class="cff9200">
                                                <asp:Label ID="fndiachi" runat="server" Text="Label"></asp:Label></span>
                                        </div>
                                        <div class="c"></div>
                                    </div>
                                </div>
                                <div class="box-gradien pBottom10 pTop15 mTop10">
                                    <div class="title">
                                        Hình thức thanh toán:
                                        <span style="font-size:12px;font-weight:normal;text-transform:none">
                                            <asp:Label ID="fnthanhtoan" runat="server" Text="Label"></asp:Label></span>
                                    </div>
                                    <div class="noncontent">
                                        <div class="fl"></div>
                                        <div class="fl"></div>
                                        <div class="c"></div>
                                    </div>
                                </div>
                                <div id="box-gradien2" class="box-gradien mTop10">
                                    <div class="title mTop10 mLeft10">Thông tin sản phẩm</div>
                                    <div id="pTop5" class="noncontent">
                                        <table class="cart-finish" width="100%" cellspacing="0" cellpadding="0" border="0">
                                            <thead>
                                                <tr>
                                                    <th class="head bRight" width="25">STT</th>
                                                    <th class="head bRight">Sản phẩm</th>
                                                    <th class="head bRight" width="70">Đơn vị</th>
                                                    <th class="head bRight" width="80">Đơn Giá</th>
                                                    <th class="head bRight" width="25">SL</th>
                                                    <th class="head" width="80">Thành Tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="item bRight" align="center" valign="top">1</td>
                                                    <td class="item bRight" valign="top">
                                                        <asp:Label ID="tendeal" runat="server" Text="Label"></asp:Label></td>
                                                    <td class="item bRight" align="center" valign="top">sản phẩm</td>
                                                    <td class="item bRight" align="right" valign="top">
                                                        <asp:Label ID="dongia" runat="server" Text="Label"></asp:Label> đ</td>
                                                    <td class="item bRight" align="center" valign="top">
                                                        <asp:Label ID="sodeal" runat="server" Text="Label"></asp:Label></td>
                                                    <td class="item" align="right" valign="top">
                                                        <asp:Label ID="thanhtien" runat="server" Text="Label"></asp:Label> đ</td>
                                                </tr>
                                                <tr>
                                                    <td class="item total-all" align="right" colspan="6">
                                                        Tổng tiền =
                                                        <span id="total-all">175.000 đ</span>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                        </div>
                    </div>      			
        </div>
  		</div>
    </form>
<!-- End SmartWizard Content -->
</asp:Content>
