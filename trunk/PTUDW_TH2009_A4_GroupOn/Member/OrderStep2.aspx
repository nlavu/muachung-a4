<%@ Page Title="" Language="C#" MasterPageFile="~/Member/Member.Master" AutoEventWireup="true" CodeBehind="OrderStep2.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Member.OrderStep2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <p>
        <asp:SiteMapPath runat="server">
        </asp:SiteMapPath>
    </p>
<link rel="stylesheet" href="css/index.css" type="text/css" media="screen" charset="utf-8" />
	<script type="text/javascript" src="/js/jquery.js"></script>
	<script src="/js/index.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div id="content">
			<div id="deal-buy" class="box">
				<div class="box-top"></div>
				<div class="box-content">
					<div class="head"><h2>Đơn hàng của bạn<!--your order--></h2></div>
					<div class="sect">
						<table class="order-table">
							<tbody><tr>
								<th class="deal-buy-desc">Deal</th>
																								<th class="deal-buy-quantity">Số lượng <!--quantity--></th>
								<th class="deal-buy-multi"></th>
								<th class="deal-buy-price">Đơn giá (<span class="money">VNĐ</span>)<!--price--></th>
								<th class="deal-buy-equal"></th>
								<th class="deal-buy-total">Thành tiền (<span class="money">VNĐ</span>)<!--total--></th>
							</tr>
							<tr>
								<td class="deal-buy-desc">Khám Phá Vùng Đất Panduranga – Phan Rang Với Kì Nghỉ 2 Ngày 1 Đêm Tại Aniise Villa Resort, Loại  Standard Room Dành Cho 2 Người. Voucher 1.000.000Đ Còn 595.000Đ, Giảm 41%. Chỉ Có Tại Hotdeal.</td>
																								<td class="deal-buy-quantity">1</td>
								<td class="deal-buy-multi">x</td>
								<td class="deal-buy-price" id="deal-buy-price">595.000</td>
								<td class="deal-buy-equal">=</td>
								<td class="deal-buy-total" id="deal-buy-total">595.000</td>
							</tr>
																					
							<tr class="order-total">
								<td class="deal-buy-desc"><!--<strong>total to be paid：</strong>--></td>
								<td class="deal-buy-quantity"></td>
								<td class="deal-buy-multi"></td>
								<td class="deal-buy-price" nowrap="nowrap"><strong>Tổng số tiền:</strong></td>
								<td class="deal-buy-equal">=</td>
								<td class="deal-buy-total" nowrap="nowrap">595.000<span class="money">VNĐ</span></td>
							</tr>
						</tbody></table>
						<div class="paytype">
							<form action="/order/pay.php" method="post" class="validator">
																<div class="clear"></div>
								<p class="check-act">
									<input type="hidden" name="order_id" value="1774376">
									<input type="hidden" name="service" value="cashdelivery">
									<input type="hidden" name="team_id" value="3324">
									<input type="hidden" name="cardcode" value="">
									<input type="hidden" name="quantity" value="1">
									<input type="hidden" name="address" value="135B Trần Hưng Đạo">
									<input type="hidden" name="express" value="N">
									<input type="hidden" name="remark" value="">
									<a href="OrderStep3.aspx"><input type="submit" value="Xác nhận đơn hàng, đặt mua" class="formbutton"></a>
																		&nbsp;&nbsp;&nbsp;<a href="OrderStep1.aspx" ><input type="button" value="Quay về" class="formbutton" onclick="#"></a>
																		<a href="OrderStep1.aspx" style="margin-left:1em;">Sửa đơn đặt hàng<!--back to edit order--></a></p>
															</form>
						</div>
					</div>
				</div>
				<div class="box-bottom"></div>
			</div>
		</div>
</asp:Content>
