<%@ Page Title="" Language="C#" MasterPageFile="~/Member/Member.Master" AutoEventWireup="true" CodeBehind="AccountInfo.aspx.cs" Inherits="PTUDW_TH2009_A4_GroupOn.Member.AccountInfo" %>
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
<div id="content" class="clear settings-box">
		<div class="box clear">
            <div class="box-top"></div>
            <div class="box-content">
                <div class="head"><h2>Thông tin cá nhân<!--Account setting--></h2></div>
                <div class="sect">
                    <form id="settings-form" method="post" action="/account/settings.php" enctype="multipart/form-data" class="validator">
						<div class="wholetip clear"><h3>1. Thông tin cơ bản<!--Basic--></h3></div>
                        <div class="field email">
                            <label>Email</label>
                            <input type="text" size="30" name="email" id="settings-email-address" class="f-input readonly" readonly="" value="lethihiep171090@gmail.com">
                        </div>
                        
                       <!-- <div class="field username">
                            <label>Tên đăng nhập</label>
                            <input type="text" size="30" name="username" id="settings-username" class="f-input " value="lethihiep171090@gmail.com" require="true" datatype="limit" min="2" max="16" maxLength="16"  />
                        </div>-->
                        <div class="field password">
                            <label>Đổi mật khẩu</label>
                            <input type="password" size="30" name="password" id="settings-password" class="f-input">
                            <span class="hint">Để trống nếu không muốn thay đổi.</span>
                        </div>
                        <div class="field password">
                            <label>Xác nhận mật khẩu</label>
                            <input type="password" size="30" name="password2" id="settings-password-confirm" class="f-input">
                        </div>
                        <div class="field password">
						
						<script type="text/javascript" language="javascript">						    function SetYear(begin, end, selectYear, object_id) {
						        var str = "<select require='true' datatype='require' name='" + object_id + "' id='" + object_id + "' onchange='Leap_year();'>";
						        str += "<option value='0' >" + "-" + "</option>";

						        for (i = begin; i < end + 1; i++) {
						            if (i == selectYear) {
						                selectedValue = " selected='selected' ";
						            }
						            else
						                selectedValue = "";
						            str += "<option value='" + i + "' " + selectedValue + ">";
						            str += i;
						            str += "</option>";
						        }
						        str += "</select>";
						        return str;
						    }

						    function SetMonth(begin, end, selectMonth, object_id) {
						        var str = "<select require='true' datatype='require' name='" + object_id + "' id='" + object_id + "' onchange='Leap_year();'>";
						        str += "<option value='' >" + "-" + "</option>";

						        for (i = begin; i < end + 1; i++) {
						            if (i == selectMonth) {
						                selectedValue = " selected='selected' ";
						            }
						            else
						                selectedValue = "";
						            str += "<option value='" + i + "' " + selectedValue + ">";
						            str += i;
						            str += "</option>";
						        }
						        str += "</select>";
						        return str;
						    }

						    function Leap_year() {
						        year = document.getElementById("dob_y").value;
						        var month = document.getElementById("dob_m").value;

						        var leap_year;

						        leap_year = year % 100;

						        var x = document.getElementById("dob_d");

						        var y_29, y_30, y_31;

						        switch (month) {
						            case "4":
						            case "6":
						            case "9":
						            case "11":
						                {
						                    if (x.length == 32) {
						                        x.remove(31);
						                    }

						                    try {

						                        if (x.length == 29) {
						                            y_29 = document.createElement('option');
						                            y_29.value = '29';
						                            y_29.id = 'dob_day_29';
						                            y_29.text = '29';
						                            x.add(y_29, null);
						                        }

						                        if (x.length == 30) {
						                            y_30 = document.createElement('option');
						                            y_30.value = '30';
						                            y_30.id = 'dob_day_30';
						                            y_30.text = '30';
						                            x.add(y_30, null);
						                        }
						                    }
						                    catch (ex) {
						                        if (x.length == 29) {
						                            y_29 = document.createElement('option');
						                            y_29.value = '29';
						                            y_29.id = 'dob_day_29';
						                            y_29.text = '29';
						                            x.add(y_29);
						                        }

						                        if (x.length == 30) {
						                            y_30 = document.createElement('option');
						                            y_30.value = '30';
						                            y_30.id = 'dob_day_30';
						                            y_30.text = '30';
						                            x.add(y_30);
						                        }
						                    }


						                    break;

						                }
						            case "2":
						                {

						                    if (x.length > 31)
						                        x.remove(31);

						                    if (x.length > 30)
						                        x.remove(30);

						                    if (x.length > 29)
						                        x.remove(29);

						                    if (leap_year % 4 == 0) {
						                        try {
						                            y_29 = document.createElement('option');
						                            y_29.value = '29';
						                            y_29.id = 'dob_day_29';
						                            y_29.text = '29';
						                            x.add(y_29, null);
						                        }
						                        catch (ex) {
						                            y_29 = document.createElement('option');
						                            y_29.value = '29';
						                            y_29.id = 'dob_day_29';
						                            y_29.text = '29';
						                            x.add(y_29);
						                        }
						                    }
						                    break;
						                }
						            case "1":
						            case "3":
						            case "5":
						            case "6":
						            case "7":
						            case "8":
						            case "10":
						            case "12":
						                {
						                    try {
						                        if (x.length == 29) {
						                            y_29 = document.createElement('option');
						                            y_29.value = '29';
						                            y_29.id = 'dob_day_29';
						                            y_29.text = '29';
						                            x.add(y_29, null);
						                        }

						                        if (x.length == 30) {
						                            y_30 = document.createElement('option');
						                            y_30.value = '30';
						                            y_30.id = 'dob_day_30';
						                            y_30.text = '30';
						                            x.add(y_30, null);
						                        }

						                        if (x.length == 31) {
						                            y_31 = document.createElement('option');
						                            y_31.value = '31';
						                            y_31.id = 'dob_day_31';
						                            y_31.text = '31';
						                            x.add(y_31, null);
						                        }
						                    }
						                    catch (ex) {
						                        if (x.length == 29) {
						                            y_29 = document.createElement('option');
						                            y_29.value = '29';
						                            y_29.id = 'dob_day_29';
						                            y_29.text = '29';
						                            x.add(y_29);

						                        }

						                        if (x.length == 30) {
						                            y_30 = document.createElement('option');
						                            y_30.value = '30';
						                            y_30.id = 'dob_day_30';
						                            y_30.text = '30';
						                            x.add(y_30);
						                        }

						                        if (x.length == 31) {
						                            y_31 = document.createElement('option');
						                            y_31.value = '31';
						                            y_31.id = 'dob_day_31';
						                            y_31.text = '31';
						                            x.add(y_31);
						                        }
						                    }

						                    break;
						                }
						            default:
						                break;
						        }


						    }

						    function SetDay(begin, end, selectDay, object_id) {
						        var str = "<select require='true' datatype='require' name='" + object_id + "' id='" + object_id + "'>";
						        str += "<option value='' >" + "-" + "</option>";

						        for (i = begin; i <= end; i++) {
						            if (i == selectDay) {
						                selectedValue = " selected='selected' ";
						            }
						            else
						                selectedValue = "";
						            str += "<option value='" + i + "' " + "id='dob_day_" + i + "' " + selectedValue + ">";
						            str += i;
						            str += "</option>";
						        }
						        str += "</select>";
						        return str;
						    }</script>
                            <label>Ngày sinh</label>							<table cellspacing="0" cellpadding="0">
                                <tbody><tr>
                                    <td>  
                                    <script language="javascript">
                                        //<![CDATA[
                                        document.write(SetDay(1, 31, 17, 'dob_d'));
                                        //]]>	
                                    </script><select require="true" datatype="require" name="dob_d" id="dob_d"><option value="">-</option><option value="1" id="dob_day_1">1</option><option value="2" id="dob_day_2">2</option><option value="3" id="dob_day_3">3</option><option value="4" id="dob_day_4">4</option><option value="5" id="dob_day_5">5</option><option value="6" id="dob_day_6">6</option><option value="7" id="dob_day_7">7</option><option value="8" id="dob_day_8">8</option><option value="9" id="dob_day_9">9</option><option value="10" id="dob_day_10">10</option><option value="11" id="dob_day_11">11</option><option value="12" id="dob_day_12">12</option><option value="13" id="dob_day_13">13</option><option value="14" id="dob_day_14">14</option><option value="15" id="dob_day_15">15</option><option value="16" id="dob_day_16">16</option><option value="17" id="dob_day_17" selected="selected">17</option><option value="18" id="dob_day_18">18</option><option value="19" id="dob_day_19">19</option><option value="20" id="dob_day_20">20</option><option value="21" id="dob_day_21">21</option><option value="22" id="dob_day_22">22</option><option value="23" id="dob_day_23">23</option><option value="24" id="dob_day_24">24</option><option value="25" id="dob_day_25">25</option><option value="26" id="dob_day_26">26</option><option value="27" id="dob_day_27">27</option><option value="28" id="dob_day_28">28</option><option value="29" id="dob_day_29">29</option><option value="30" id="dob_day_30">30</option><option value="31" id="dob_day_31">31</option></select>
                                    </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td>
                                    <script language="javascript">
                                        //<![CDATA[
                                        document.write(SetMonth(1, 12, 10, 'dob_m'));
                                        //]]>	
                                    </script><select require="true" datatype="require" name="dob_m" id="dob_m" onchange="Leap_year();"><option value="">-</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10" selected="selected">10</option><option value="11">11</option><option value="12">12</option></select>
                                    </td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                    <td>
                                    <script language="javascript">
										//<![CDATA[
                                        /*dtime = new Date();
                                        begin = dtime.getFullYear()-80;
                                        end = dtime.getFullYear()-1;*/
                                        document.write(SetYear(1932, 2011, 1990, 'dob_y'));
                                        //]]>	
                                    </script><select require="true" datatype="require" name="dob_y" id="dob_y" onchange="Leap_year();"><option value="0">-</option><option value="1932">1932</option><option value="1933">1933</option><option value="1934">1934</option><option value="1935">1935</option><option value="1936">1936</option><option value="1937">1937</option><option value="1938">1938</option><option value="1939">1939</option><option value="1940">1940</option><option value="1941">1941</option><option value="1942">1942</option><option value="1943">1943</option><option value="1944">1944</option><option value="1945">1945</option><option value="1946">1946</option><option value="1947">1947</option><option value="1948">1948</option><option value="1949">1949</option><option value="1950">1950</option><option value="1951">1951</option><option value="1952">1952</option><option value="1953">1953</option><option value="1954">1954</option><option value="1955">1955</option><option value="1956">1956</option><option value="1957">1957</option><option value="1958">1958</option><option value="1959">1959</option><option value="1960">1960</option><option value="1961">1961</option><option value="1962">1962</option><option value="1963">1963</option><option value="1964">1964</option><option value="1965">1965</option><option value="1966">1966</option><option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option><option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option><option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option><option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option><option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option><option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option><option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option><option value="1988">1988</option><option value="1989">1989</option><option value="1990" selected="selected">1990</option><option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option><option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option><option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option><option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option><option value="2003">2003</option><option value="2004">2004</option><option value="2005">2005</option><option value="2006">2006</option><option value="2007">2007</option><option value="2008">2008</option><option value="2009">2009</option><option value="2010">2010</option><option value="2011">2011</option></select>
                                    </td>												
                                </tr>
                                </tbody></table>	
                        </div>
                        
                        <div class="field password">
                            <label>Giới tính</label>
							<select name="gender" class="f-input" require="true" datatype="require"><option value="">---Chọn---</option><option value="F" selected="">Nữ</option><option value="M">Nam</option></select>
                        </div>
                        <div class="field">
                            <label>Hình (Avatar)</label>
							                            <input type="file" size="30" name="upload_image" id="settings-avatar" class="f-input">
                            <span class="hint">Vui lòng upload tập tin hình ảnh có dung lượng &lt;512kb </span>
                        </div>
                        
						<!--<div class="wholetip clear"><h3>2. Liên hệ</h3></div>-->
                        
                        <!--<div class="field password">
                            <label>QQ</label>
                            <input type="text" size="30" name="qq" id="settings-qq" class="number" value="" />
                        </div>-->
						
						<div class="wholetip clear"><h3>2. Thông tin giao hàng</h3></div>
                        <div class="field username">
                            <label>Họ tên</label>
                            <input type="text" size="30" name="realname" id="settings-realname" class="f-input" value="LÊ THỊ HIỆP">
							<!--<span class="hint">Real name should be consistent with your ID name to make sure of a successful delivery.</span>-->
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
                                          
                        
                        <div class="field city">
                            <label>Thành phố</label>
							<select name="city_id" id="city_id" class="f-input"><option value="437" selected="">TP Hồ Chí Minh</option><option value="440">Hà Nội</option></select>
                        </div>
                        <div class="field">
                    	<label id="enter-address-dist-label" for="signup-dist">Quận/Huyện</label>
							<select name="dist_id" id="dist_id" class="f-input" style="width:100px" require="true" datatype="require">
                            <option value="">---Chọn---</option><option value="500" class="437">Bình Tân</option><option value="501" class="437">Bình Thạnh</option><option value="492" class="437">Gò vấp</option><option value="491" class="437">Phú Nhuận</option><option value="490" selected="" class="437">Quận 1</option><option value="511" class="437">Quận 10</option><option value="512" class="437">Quận 11</option><option value="502" class="437">Quận 12</option><option value="503" class="437">Quận 2</option><option value="504" class="437">Quận 3</option><option value="505" class="437">Quận 4</option><option value="506" class="437">Quận 5</option><option value="507" class="437">Quận 6</option><option value="508" class="437">Quận 7</option><option value="509" class="437">Quận 8</option><option value="493" class="437">Tân Bình</option><option value="513" class="437">Tân Phú</option></select>
                    	<label id="enter-address-ward-label" for="ward-dist">Phường/Xã</label>
							<select name="ward_id" id="ward_id" class="f-input" style="width:150px" require="true" datatype="require"><option value="">---Chọn---</option><option value="1" class="490" title="Phường Bến Nghé">Phường Bến Nghé</option><option value="2" class="490" title="Phường Bến Thành">Phường Bến Thành</option><option value="3" class="490" title="Phường Cầu Kho">Phường Cầu Kho</option><option value="4" selected="" class="490" title="Phường Cầu Ông Lãnh">Phường Cầu Ông Lãnh</option><option value="5" class="490" title="Phường Cô Giang">Phường Cô Giang</option><option value="7" class="490" title="Phường Nguyễn Cư Trinh">Phường Nguyễn Cư Trinh</option><option value="8" class="490" title="Phường Nguyễn Thái Bình">Phường Nguyễn Thái Bình</option><option value="9" class="490" title="Phường Phạm Ngũ Lão">Phường Phạm Ngũ Lão</option><option value="10" class="490" title="Phường Tân Định">Phường Tân Định</option><option value="6" class="490" title="Phường Đa Kao">Phường Đa Kao</option></select></div> 
						<div class="field">
                            <label>Địa chỉ</label>
                            <input type="text" name="address" id="settings-address" readonly="readonly" class="f-input" value="135B Trần Hưng Đạo">
                        </div>
                       <div class="field username">
                            <label>Số nhà</label>
                            <input type="text" style="width:100px" name="house_number" id="settings-house-number" class="f-input" value="135B">
                            <!--<span class="hint">For a timely delivery, please type your detailed address. </span>-->
                            <label>Tên đường</label>
                            <input type="text" style="width:200px" autocomplete="off" onfocus="searchSuggest()" name="street_name" id="settings-street-name" class="f-input" value="Trần Hưng Đạo">
                        </div>
						<div class="field">
                        <label>Phòng-lầu-tòa nhà</label>
                        <input type="text" name="note_address" value="Phòng 209 - KTX ĐH KHTN" id="settings-note-address" class="f-input">
                        	<span class="hint">Ví dụ: P907, Lau 9, Cao Oc Diamond Plaza</span>
                    	</div>
                         <div class="field mobile">
                            <label>Di động</label>
                            <input type="text" size="30" name="mobile" id="settings-mobile" class="number" value="01698383832" datatype="mobile|ajax" url="/ajax/validator.php" vname="signupmobile" msg="Incorrect mobile number|The number has been registered"><!--<span class="inputtip">Mobile number is very inportant, please type it correctly.</span>-->
                        </div>
                        
                        <div class="clear"></div>
                        <div class="act">
                            <a href="UpdateInfo.aspx"><input type="submit" value="Cập nhật" name="commit" id="settings-submit" class="formbutton"></a>
                        </div>
                        <br>
                    </form>
                </div>
            </div>
            <div class="box-bottom"></div>
        </div>
    </div>
</asp:Content>
