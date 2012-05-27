<%@ Page Title="" Language="C#" MasterPageFile="~/Member/Member.Master" AutoEventWireup="true" CodeBehind="OrderStep3.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Member.OrderStep3" %>
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
			<div id="order-pay-return" class="box">
				<div class="box-top"></div>
				<div class="box-content">
					<div class="success"><h2>Đơn hàng của bạn đặt mua thành công<!--Your order has been paid successfully!--></h2> </div>
					<div class="sect">
						<div id="divOrderMess">
							<h4>Cám ơn bạn đã đặt hàng. Sẽ có nhân viên của A4 Groupon liên hệ và giao sản phẩm tận nơi cho bạn trong vòng 24 đến 72 giờ sau khi chương trình kết thúc.<br>
								<strong>Lưu ý:</strong> Nếu bạn đã từng mua ít nhất 1 lần tại Hotdeal, bạn đã trở thành khách hàng quen thuộc, chúng tôi xin bỏ qua bước xác nhận đơn hàng và sẽ tiến hành giao hàng luôn cho bạn.</h4>
							<div>Bạn cần đem theo thẻ của Hotdeal.vn đến nơi cung cấp sản phẩm/dịch vụ để được nhận sản phẩm/dịch vụ giảm giá.</div>
						</div>
						<div id="deal-buy" style="padding-top:15px;">
							<div class="head"><h2>Đơn hàng của bạn<!--your order--></h2></div>
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
						</div>
						<p class="error-tip">Kiểm tra deal của bạn:&nbsp;<a href="MyOrder.aspx">Khám Phá Vùng Đất Panduranga – Phan Rang Với Kì Nghỉ 2 Ngày 1 Đêm Tại Aniise Villa Resort, Loại  Standard Room Dành Cho 2 Người. Voucher 1.000.000Đ Còn 595.000Đ, Giảm 41%. Chỉ Có Tại Hotdeal.</a></p>  
					</div>
				</div>
				<div class="box-bottom"></div>
			</div>
		</div>
</asp:Content>
