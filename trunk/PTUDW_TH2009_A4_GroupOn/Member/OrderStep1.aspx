<%@ Page Title="" Language="C#" MasterPageFile="~/Member/Member.Master" AutoEventWireup="true" CodeBehind="OrderStep1.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Member.OrderStep1" %>
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
						<script type="text/javascript" language="javascript">
						    function checkform() {
						        if (document.teambuy.is_true.checked == false) {
						            alert('Vui lòng chọn vào check box!!');
						            return false;
						        } else {
						            return true;
						        }
						    }
			</script>
			<form action="/team/buy.php?id=3324" method="post" class="validator" name="teambuy" onsubmit="return checkform()">
				<input id="deal-per-number" value="10" type="hidden">
				<div id="deal-buy" class="box">
					<div class="box-top"></div>
					<div class="box-content">
						<div class="head">
							<h2>Giỏ hàng
								<!--Your Purchase-->
															</h2>
						</div>
						<div class="sect">
							<table class="order-table">
								<tbody><tr>
									<th width="100%" class="deal-buy-desc">Deal</th>
																											<th class="deal-buy-quantity">Số<br>lượng</th>
									<th class="deal-buy-multi"></th>
									<th class="deal-buy-price">Đơn giá<br>(<span class="money">VNĐ</span>)</th>
									<th class="deal-buy-equal"></th>
									<th class="deal-buy-total">Thành tiền<br>(<span class="money">VNĐ</span>)</th>
								</tr>
								<tr>
									<td class="deal-buy-desc">Khám Phá Vùng Đất Panduranga – Phan Rang Với Kì Nghỉ 2 Ngày 1 Đêm Tại Aniise Villa Resort, Loại  Standard Room Dành Cho 2 Người. Voucher 1.000.000Đ Còn 595.000Đ, Giảm 41%. Chỉ Có Tại Hotdeal.</td>
																											<td class="deal-buy-quantity"><input type="text" class="input-text f-input" maxlength="4" name="quantity" value="1" ff="0" id="deal-buy-quantity-input">
													     <!--<br /><span style="font-size:12px;color:gray;">													     at most 10 pieces
													     													     </span>--></td>
									<td class="deal-buy-multi">x</td>
									<td class="deal-buy-price"><span id="deal-buy-price">595.000<input id="deal-buy-price-hidden" value="595000" type="hidden"></span></td>
									<td class="deal-buy-equal">=</td>
									<td class="deal-buy-total"><span id="deal-buy-total">595.000</span><input id="deal-buy-total-hidden" value="595000" type="hidden"></td>
								</tr>
																								<tr class="order-total">
									<td class="deal-buy-desc"></td>
									<td class="deal-buy-quantity"></td>
									<td class="deal-buy-multi"></td>
									<td class="deal-buy-price" nowrap="nowrap"><strong>Tổng số tiền:</strong></td>
									<td class="deal-buy-equal">=</td>
									<td class="deal-buy-total" colspan="3"><strong id="deal-buy-total-t">595.000</strong>&nbsp;<span class="money">VNĐ</span></td>
								</tr>
							</tbody></table>
														<div style="text-align: center;  padding-bottom: 10px; font:normal 15px Arial;">Bạn sẽ nhận được voucher do A4 Groupon cung cấp sau khi thanh toán.</div>							<div align="center">
																<img src="http://images.hotdeals.vn/team/2012/0404/13335237929274.jpg" width="320">
																								<img src="http://images.hotdeals.vn/team/2012/0404/13335237922502.jpg" width="320">
															</div>
							 <div style="text-align: center;  padding-top: 10px; padding-bottom: 10px; font:bold 15px Arial; color:#ff6600">Bạn phải đem theo voucher này đến Aniise Villa Resort Ninh Chữ để sử dụng dịch vụ!</div>																					<div class="wholetip clear">
																<h3>Thông tin giao hàng</h3>
								<div align="left" style="padding-left:15px;"><strong>Ghi chú:</strong> Hiện nay <strong>HotDeal</strong> chưa thực hiện giao hàng ở một số khu vực sau: <br><strong style="color:#c40000">&nbsp;&nbsp;&nbsp;TP.HCM:</strong><br>

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Củ Chi, Hóc Môn, Bình Chánh, Quận 9, Cần Giờ, Nhà Bè, Thủ Đức, Quận 2 (phường Cát Lái), Quận 8 (P.15, P16)<br>

									<strong style="color:#c40000">&nbsp;&nbsp;&nbsp;Hà Nôi:</strong><br>

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Quận Hà Đông: gồm các xã Kiến Hưng, Yên Nghĩa, Phú Lương, Phú Lãm, Dương Nội, Biên Giang, Đồng Mai.<br>

									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- Huyện Từ Liêm: các khu vực ngoài Mỹ Đình, Mễ Trì.<br>

									 Mong các bạn thông cảm và chọn địa chỉ khác phù hợp.</div>
							</div>
							<div style="height:10px"></div>
							<div class="field username" style="background-color:#FFFFC6; padding-top:10px; border-top:#CCCCCC 1px solid; border-left:#CCCCCC 1px solid;  border-right:#CCCCCC 1px solid">
								<label>Người nhận</label>
								<input type="text" size="30" name="realname" id="settings-realname" class="f-input" value=" LÊ THỊ HIỆP " require="true" datatype="require">
								<!--<span class="hint">Receiver's name should be consistent with his/her ID name to make sure a successful delivery</span>-->
							</div>
														<link rel="stylesheet" type="text/css" href="/static/css/jquery.autocomplete.css">
							<script type="text/javascript" src="/static/js/jquery.autocomplete.js"></script>
							<script src="/static/js/jchain.js" type="text/javascript"></script>
							<script type="text/javascript">				               
								var dist_id; var ward_id;
								function getDistId(){
									return $("#dist_id").val();
								}
								function getWardId(){
									return $("#ward_id").val();
								}
								jQuery(document).ready(function() {	
									$("#dist_id").chained("#city_id"); 
									$("#ward_id").chained("#dist_id");
								});		
								function searchSuggest(){
									dist_id = getDistId();
									ward_id = getWardId();
									$("#settings-street-name").autocomplete('/team/search_address_list.php?dist_id='+dist_id+'&ward_id='+ward_id, {
										width: 308,
									});	
								}
							</script>
							<div class="field" style="background-color:#FFFFC6; border-left:#CCCCCC 1px solid;  border-right:#CCCCCC 1px solid">
								<label id="enter-address-city-label" for="signup-city">Quận/Huyện</label>
								<!--<select name="city_id" id="city_id" class="f-city" require="true" datatype="require"><option value="">---Chọn---</option><option value='437' selected>TP Hồ Chí Minh</option><option value='440' >Hà Nội</option></select>&nbsp;&nbsp;&nbsp;-->
								<select name="dist_id" id="dist_id" class="f-city" require="true" datatype="require" style="width:100px" onchange="getDistId()">
									<option value="">---Chọn---</option>
									<option value="500" class="437">Bình Tân</option><option value="501" class="437">Bình Thạnh</option><option value="492" class="437">Gò vấp</option><option value="491" class="437">Phú Nhuận</option><option value="490" selected="" class="437">Quận 1</option><option value="511" class="437">Quận 10</option><option value="512" class="437">Quận 11</option><option value="502" class="437">Quận 12</option><option value="503" class="437">Quận 2</option><option value="504" class="437">Quận 3</option><option value="505" class="437">Quận 4</option><option value="506" class="437">Quận 5</option><option value="507" class="437">Quận 6</option><option value="508" class="437">Quận 7</option><option value="509" class="437">Quận 8</option><option value="493" class="437">Tân Bình</option><option value="513" class="437">Tân Phú</option>								</select>
								&nbsp;&nbsp;&nbsp;Phường/Xã
								<select name="ward_id" id="ward_id" class="f-city" require="true" datatype="require" style="width:100px" onchange="getWardId()">
									<option value="">---Chọn---</option>
									<option value="1" class="490" title="Phường Bến Nghé">Phường Bến Nghé</option><option value="2" class="490" title="Phường Bến Thành">Phường Bến Thành</option><option value="3" class="490" title="Phường Cầu Kho">Phường Cầu Kho</option><option value="4" selected="" class="490" title="Phường Cầu Ông Lãnh">Phường Cầu Ông Lãnh</option><option value="5" class="490" title="Phường Cô Giang">Phường Cô Giang</option><option value="7" class="490" title="Phường Nguyễn Cư Trinh">Phường Nguyễn Cư Trinh</option><option value="8" class="490" title="Phường Nguyễn Thái Bình">Phường Nguyễn Thái Bình</option><option value="9" class="490" title="Phường Phạm Ngũ Lão">Phường Phạm Ngũ Lão</option><option value="10" class="490" title="Phường Tân Định">Phường Tân Định</option><option value="6" class="490" title="Phường Đa Kao">Phường Đa Kao</option>								</select>
							</div>
							<div class="field" style="background-color:#FFFFC6; border-left:#CCCCCC 1px solid;  border-right:#CCCCCC 1px solid">
								<label>Số nhà-Ngõ-Ngách</label>
																<input type="text" size="30" name="house_number" autocomplete="off" id="settings-address" class="f-input-small" value="135B" require="true" datatype="require">
								&nbsp;&nbsp;&nbsp;Tên đường
								<input type="text" name="street_name" style="width:200px;font-size:14px;padding:3px 4px;border-color:#89B4D6;border-style:solid;border-width:1px;" autocomplete="off" onfocus="searchSuggest()" id="settings-street-name" require="true" value="Trần Hưng Đạo" datatype="require">
								<!--<span class="hint">Vui lòng ghi rõ ràng (số nhà, tên đường) để chúng tôi chuyển hàng chính xác nhất.</span>-->
							</div>
							<div class="field" style="background-color:#FFFFC6; border-left:#CCCCCC 1px solid;  border-right:#CCCCCC 1px solid">
								<label>Phòng-lầu-tòa nhà</label>
								<input type="text" size="30" name="note_address" id="settings-note-address" class="f-input" value="Phòng 209 - KTX ĐH KHTN">
								<span class="hint" style="white-space:nowrap">Ví dụ: P907, Lầu 9, Cao Ốc Diamond Plaza</span> </div>
							<div class="field mobile" style="background-color:#FFFFC6; border-bottom:#CCCCCC 1px solid; border-left:#CCCCCC 1px solid;  border-right:#CCCCCC 1px solid">
								<label>Di động</label>
								<input type="text" size="30" name="mobile" id="settings-mobile" require="true" class="f-input number" value=" 01698383832 " datatype="mobile" maxlength="11">
								       								<span class="hint">Số ĐTDĐ là rất quan trọng dùng để liên lạc khi giao hàng.</span>
															</div>
														<div class="wholetip clear">
								<h3>Thông tin thêm</h3>
							</div>
														<div>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody><tr>
										<td valign="top">Ghi chú</td>
										<td><textarea name="remark" style="width:500px;height:80px;padding:2px;"></textarea></td>
									</tr>
								</tbody></table>
							</div>														<div class="field mobile">&nbsp;</div>
							<div class="form-submit">
								<input type="hidden" name="id" value=""><a href="OrderStep2.aspx"><input type="submit" class="formbutton" name="buy" value="Đồng ý mua"></a>
							</div>
						</div>
					</div>
					<div class="box-bottom"></div>
				</div>
			</form>
		</div>
</asp:Content>
