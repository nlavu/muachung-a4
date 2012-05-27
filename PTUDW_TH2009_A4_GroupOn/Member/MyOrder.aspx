<%@ Page Title="" Language="C#" MasterPageFile="~/Member/Member.Master" AutoEventWireup="true" CodeBehind="MyOrder.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Member.MyOrder" %>
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
<div id="content" class="mainwide">
		<div class="box clear">
            <div class="box-top"></div>
            <div class="box-content">
                <div class="head">
                    <h2>Đơn hàng của tôi<!--My order--></h2>
                    <ul class="filter">
						<li class="label"> </li>
						<li class="current"><a href="#">Tất cả</a></li><li><a href="#">Chưa thanh toán</a></li><li><a href="#">Đã thanh toán</a></li>					</ul>
				</div>
                <div class="sect1">
                	<div style="padding-right:20px;">
					<table border="0" cellpadding="0" cellspacing="0" class="coupons-table" id="orders-list">
					  <tbody><tr>
						<th>Deal</th>
						<th width="60">Số lượng</th><th nowrap="nowrap">Thành tiền<!--Total--></th>
					  <th width="80">Trạng thái</th>
					  <th width="80">Operation</th>
					  </tr>
											<tr class="alt">
							<td style="text-align:left;"><a class="deal-title" href="#" target="_blank">Khám Phá Vùng Đất Panduranga – Phan Rang Với Kì Nghỉ 2 Ngày 1 Đêm Tại Aniise Villa Resort, Loại  Standard Room Dành Cho 2 Người. Voucher 1.000.000Đ Còn 595.000Đ, Giảm 41%. Chỉ Có Tại Hotdeal.</a></td>
							<td align="center">1</td>
							<td align="right" style="font-weight:bold">595.000</td>
							<td align="right">Mới đặt<br>
                                                        </td>
							<td class="op"><a href="#" title="Xem chi tiết">Chi tiết</a></td>
						</tr>
											<tr>
							<td style="text-align:left;"><a class="deal-title" href="#" target="_blank">Quần Legging 2 Lớp Co Giãn 4 Chiều Vừa Thời Trang, Vừa Giúp Giữ Ấm Đôi Chân Những Ngày Sài Gòn Se Lạnh. Voucher Giảm 68% Chỉ Còn 65.000 Đồng Cho Giá Trị Sử Dụng 200.000 Đồng. Chỉ Có Tại Hotdeal.</a></td>
							<td align="center">1</td>
							<td align="right" style="font-weight:bold">65.000</td>
							<td align="right">Đã giao<br>
                                                        </td>
							<td class="op"><a href="#" title="Xem chi tiết">Chi tiết</a></td>
						</tr>
											<tr><td colspan="5"><ul class="paginator"><li>(2)</li><li class="current">1</li></ul></td></tr>
                    </tbody></table></div>
			  </div>
              <div align="left" style="padding-left:20px;">
              	<ul><strong>Chú thích:</strong>
                    <li>- Mới đặt: Đã đặt hàng online nhưng chưa nhận được điện thoại xác nhận từ hotdeal.vn.</li>
                    <li>- Đã xác nhận: Đặt hàng và đã được xác nhận từ Hotdeal. Hotdeal đang lên kế hoạch giao hàng.</li>
                    <li>- Đang giao hàng: Hotdeal đang trên đường giao.</li>
                    <li>- Đã giao: Đã giao cho khách hàng.</li></ul>
              </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
     <div class="clear"></div>
</asp:Content>
