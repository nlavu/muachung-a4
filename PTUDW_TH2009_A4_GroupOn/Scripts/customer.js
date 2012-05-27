shop.customer = {
	logout:function(){
		shop.ajax_popup('act=customer&code=logout',"GET",{},
		function (j) {
			location.reload();
		});
	  return false;
	},
	password:{
		resendPassword:function(email){
			shop.show_overlay_popup('muachung-resend-password', '',
			shop.customer.password.theme.resendPassword('muachung-resend-password', email),
			{
				background: {'background-color' : 'transparent'},
				border: {
					'background-color' : 'transparent',
					'padding' : '0px'
				},
				title: {'display' : 'none'},
				content: {
					'padding' : '0px',
					'width' : shop.is_ie6() ? '325px' : '315px'
				},
				release:function(){
					shop.enter('#forgot_email', shop.customer.password.submit);
				}
			});
		},
		submit:function(){
			var email = shop.util_trim(jQuery('#forgot_email').val());
			if(email == ''){
				shop.error.set('#forgot_email', 'Chưa nhập email', 230, '.forgot_pasword');
				return false;
			}
			else if(!shop.is_email(email)){
				shop.error.set('#forgot_email', 'Email không hợp lệ', 230, '.forgot_pasword');
				return false;
			}
			else{
				shop.error.close('#forgot_email', '.forgot_pasword');
			}
			shop.ajax_popup('act=customer&code=resend-pass',"GET",{email: email},
			function (j) {
				if (j.err == 0 && j.msg == 'success') {
					shop.hide_overlay_popup('muachung-resend-password');
					alert("Thông tin hỗ trợ đã được gửi vào "+email+"\nQuý khách vui lòng làm theo hướng dẫn trong email");
				}else{
					shop.error.set('#forgot_email', j.msg, 230, '.forgot_pasword');
				}
			});
			return true;
		},
		submitFormResendPassword: function(frm){
			if(frm.pass.value == ''){
				frm.pass.focus();
				alert('Chưa nhập mật khẩu');
				return false;
			}else if(frm.pass.value.length < 6){
				frm.pass.focus();
				alert('Mật khẩu tối thiểu phải có 6 kí tự');
				return false;
			}else if(frm.pass1.value == ''){
				frm.pass1.focus();
				alert('Chưa nhập lại mật khẩu');
				return false;
			}else if(frm.pass1.value != frm.pass.value){
				frm.pass1.focus();
				alert('Nhập lại mật khẩu không chính xác');
				return false;
			}
			frm.submit();
			return true;
		},
		theme:{
			resendPassword:function(id, email){
				return shop.popupSite(id, 'Quên mật khẩu', shop.join
					('<div class="content forgot_pasword" style="padding:1px 20px 10px">')
						('<div id="cError"></div>')
						('<div class="label mTop10">Email đã đăng kí:</div>')
						('<div class="input-txt" style="width:260px">')
							('<input type="text" id="forgot_email" name="email" class="txt" style="width:250px" value="'+(email?email:'')+'" />')
						('</div>')
						('<div class="f11">Vui lòng nhập đúng email đã đăng kí để nhận thông tin hỗ trợ lấy lại mật khẩu từ MuaChung</div>')
						('<div class="mTop10">')
							('<div style="width:150px;margin:0 auto">')
								('<a id="fr" class="blueButton mLeft10" onclick="shop.hide_overlay_popup(\''+id+'\')" href="javascript:void(0)"><span><span>Hủy bỏ</span></span></a>')
								('<a id="fr" class="blueButton" onclick="shop.customer.password.submit()" href="javascript:void(0)"><span><span>Gửi đi</span></span></a>')
								('<div class="c"></div>')
							('</div>')
						('</div>')
					('</div>')()
				);
			}
		}
	},
	active:{
		phone:function(){
			if(query_string.indexOf('profile') == -1){
				shop.show_overlay_popup('muachung-active-phone', '',
				shop.customer.active.theme.phoneActiveNotify('muachung-active-phone'),
				{
					background: {'background-color' : 'transparent'},
					border: {
						'background-color' : 'transparent',
						'padding' : '0px'
					},
					title: {'display' : 'none'},
					content: {
						'padding' : '0px',
						'width' : '500px'
					}
				});
			}
		},
		phoneSendCode:function(no_reload){
			var run = false, time_load = 10; //time tinh theo giay
			if(!shop.is_exists(shop._store.variable['run_send_phone'])){
				run = true;
			}else if(shop._store.variable['run_send_phone'] == 0){
				run = true;
			}
			if(run){
				if(no_reload){}else{
					jQuery('.button_phone').hide();
					jQuery('.loading_phone').show();
				}
				shop.ajax_popup('act=customer&code=send-active-code',"GET",{resend:no_reload?1:0},
				function (j) {
					shop._store.variable['run_send_phone'] = 0;
					if (j.err == 0) {
						shop.show_loading('Đang gửi tin nhắn vào số <b>'+CUSTOMER_PHONE+'</b>...');
						setTimeout(function(){
							shop.hide_loading();
							if(no_reload){
								alert('Mã kích hoạt đã được gửi đến số điện thoại: '+CUSTOMER_PHONE);
							}else{
								shop.customer.active.phoneCode();
							}
						}, time_load*1000);
					}else{
						var msg = '';
						switch (j.msg){
							case 'not_login': msg = 'Vui lòng đăng nhập để sử dụng chức năng này!!!'; break;
							case 'no_otp': msg = 'Hệ thống đang quá tải!!!'; break;
							case 'false': msg = 'Hệ thống tin nhắn qua tải! Không gửi được mã kích hoạt'; break;
							case 'max': msg = 'Quý khách đã nhận đủ tin nhắn kích hoạt trong ngày. Vui lòng thử lại vào ngày hôm sau.'; break;
						}
						jQuery('.loading_phone').hide();
						jQuery('.button_phone').show();
						alert(msg);
					}
				},
				{
					loading: function(){
						shop.show_loading('Đang gửi tin nhắn vào số <b>'+CUSTOMER_PHONE+'</b>...');
						shop._store.variable['run_send_phone'] = 1;
					}
				});
			}
		},
		phoneCode:function(){
			shop.show_overlay_popup('muachung-phone-code', '',
			shop.customer.active.theme.phoneCode('muachung-phone-code'),
			{
				background: {'background-color' : 'transparent'},
				border: {
					'background-color' : 'transparent',
					'padding' : '0px'
				},
				title: {'display' : 'none'},
				content: {
					'padding' : '0px',
					'width' : '500px'
				}
			});
		},
		finishActivePhone:function(){
			var code = jQuery('.phone_code').val();
			if(code.length < 6){
				alert('Mã kích hoạt không hợp lệ!!!');
			}else{
				shop.ajax_popup('act=customer&code=check-active-code',"GET",{otp:code},
				function (j) {
					if (j.err == 0) {
						shop.hide_overlay_popup('muachung-phone-code');
						alert('Cám ơn Quý khách đã kích hoạt thành công số điện thoại trên MuaChung');
					}else{
						var msg = '';
						switch (j.msg){
							case 'not_login': msg = 'Vui lòng đăng nhập để sử dụng chức năng này!!!'; break;
							case 'no_otp': msg = 'Mã kích hoạt không hợp lệ!!!'; break;
							case 'expired': msg = 'Mã kích hoạt đã hết hạn!!!'; break;
							default: msg = j.msg;
						}
						alert(msg);
					}
				});
			}
		},
		send:function(email){
			shop.show_overlay_popup('muachung-resend-active', '',
			shop.customer.active.theme.sendActive('muachung-resend-active', email),
			{
				background: {'background-color' : 'transparent'},
				border: {
					'background-color' : 'transparent',
					'padding' : '0px'
				},
				title: {'display' : 'none'},
				content: {
					'padding' : '0px',
					'width' : shop.is_ie6() ? '325px' : '315px'
				},
				release:function(){
					shop.enter('#active_email', shop.customer.active.submit);
				}
			});
		},
		submit:function(){
			var email = shop.util_trim(jQuery('#active_email').val());
			if(email == ''){
				shop.error.set('#active_email', 'Chưa nhập email', 230, '.active_email');
				return false;
			}else if(!shop.is_email(email)){
				shop.error.set('#active_email', 'Email không hợp lệ', 230, '.active_email');
				return false;
			}else{
				shop.error.close('#active_email', '.active_email');
			}
			shop.ajax_popup('act=customer&code=resend-active',"GET",{email: email},
			function (j) {
				if (j.err == 0 && j.msg == 'success') {
					shop.hide_overlay_popup('muachung-resend-active');
					alert("Thông tin kích hoạt đã được gửi vào "+email+"\nQuý khách vui lòng làm theo hướng dẫn trong email");
				}else{
					shop.error.set('#active_email', j.msg, 230, '.active_email');
				}
			});
			return true;
		},
		theme:{
			sendActive:function(id, email){
				return shop.popupSite(id, 'Kích hoạt tài khoản', shop.join
					('<div class="content active_email" style="padding:1px 20px 10px">')
						('<div id="cError"></div>')
						('<div class="label mTop10">Email của Quý khách:</div>')
						('<div class="input-txt" style="width:260px">')
							('<input type="text" id="active_email" name="email" class="txt" style="width:250px" value="'+(email?email:'')+'" />')
						('</div>')
						('<div class="f11">Vui lòng nhập đúng email để nhận được thông tin kích hoạt tài khoản</div>')
						('<div class="mTop10">')
							('<div style="width:205px;margin:0 auto">')
								('<a id="fr" class="blueButton mLeft10" onclick="shop.hide_overlay_popup(\''+id+'\')" href="javascript:void(0)"><span><span>Hủy bỏ</span></span></a>')
								('<a id="fr" class="blueButton" onclick="shop.customer.active.submit()" href="javascript:void(0)"><span><span>Nhận kích hoạt</span></span></a>')
								('<div class="c"></div>')
							('</div>')
						('</div>')
					('</div>')()
				);
			},
			phoneActiveNotify:function(id){
				//show = show ? '' : '<div class="mTop15 f11"><input type="checkbox" id="no_alert_later" class="m0" /> <label for="no_alert_later" style="cursor:pointer" >Không nhận thông báo này lần sau</label></div>';
				//show = '<div class="mTop15 f11"><input type="checkbox" id="no_alert_later" class="m0" /> <label for="no_alert_later" style="cursor:pointer" >Không nhận thông báo này lần sau</label></div>';
				return shop.popupSite(id, 'Kích hoạt số điện thoại', shop.join
					('<div class="content" style="color:#000;padding:20px 35px">')
						('<div class="f14" style="padding:15px 30px;background-color: #fff7c9">')
							('<b>Quý khách đã đăng kí số điện thoại: <span style="font-size:18px;color:red">'+CUSTOMER_PHONE+'</span></b>')
						('</div>')
						('<div class="f12 mTop10" style="color:#6c6c6c;line-height:25px">')
							('<b>Số điện thoại này sẽ được dùng để MuaChung liên lạc với Quý khách và để Quý khách nhận Phiếu mua hàng điện tử qua <span class="f14">SMS</span></b>')
						('</div>')
						('<div class="mt28">')
							('<div class="fr">')
								('<a class="blueButton mLeft10 button_phone" onclick="shop.customer.active.phoneSendCode()" href="javascript:void(0)"><span><span>Tiếp tục >></span></span></a>')
								('<div class="loading_phone hidden" style="height:32px;line-height:32px;padding:0 0 0 20px;background:url(style/images/icon/loading.gif) no-repeat left center;color:#00A0DC">Đang gửi <b>SMS</b>...</div>')
							('</div>')
							('<div class="fr" style="line-height:32px;height:32px">')
								('<a href="'+BASE_URL+'/ca-nhan/dia-chi-nhan-hang.html?cphone" style="text-decoration:underline"><b>[Đổi số điện thoại khác]</b></a>')
								('<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;hoặc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>')
							('</div>')
							('<div class="c"></div>')
						('</div>')
					('</div>')()
				);
			},
			phoneCode:function(id){
				return shop.popupSite(id, 'Kích hoạt số điện thoại', shop.join
					('<div class="content" style="color:#000;padding:20px">')
						('<div>')
							('<b>Mã số kích hoạt đã được gửi đến số: &nbsp;<span style="font-size:18px;color:red">'+CUSTOMER_PHONE+'</span></b>')
						('</div>')
						('<div class="mt28 f14" style="padding:15px 25px;background-color: #fff7c9">')
							('<div><b>Vui lòng nhập mã kích hoạt nhận được qua SMS vào đây:</b></div>')
							('<div class="mTop10">')
								('<div class="fl"><input type="text" class="phone_code" style="border:1px solid #969696;height:26px;width:170px;font-weight:bold;font-size:18px;padding:1px 5px" /></div>')
								('<div class="fl f11 mLeft10" style="color:#4d4b50;height:28px;line-height:28px">(Không nhận được mã? <a href="javascript:shop.customer.active.phoneSendCode(true)" id="11" style="color:#004acf;text-decoration:underline"><b>Bấm vào đây!</b></a>)</div>')
								('<div class="c"></div>')
							('</div>')
						('</div>')
						('<div class="mt28">')
							('<a id="fr" class="blueButton mLeft10" onclick="shop.customer.active.finishActivePhone()" href="javascript:void(0)"><span><span>Tiếp tục >></span></span></a>')
							('<div class="c"></div>')
						('</div>')
					('</div>')()
				);
			}
		}
	},
	loginHeader: function(){
		shop.customer.login.submit('customer_email','customer_password','customer_save_login',false);
		return false;
	},
	loginPopup: function(){
		shop.customer.login.submit('login_email','login_pass','save_login',true);
		return false;
	},
	loginMix: function(){
		shop.customer.login.submit('login_email1','login_pass1','save_login1',true);
		return false;
	},
	login : {
		conf:{
			cb: null
		},
		show:function(){
			if(IS_CUSTOMER_LOGIN){
				alert('Quý khách đã đăng nhập thành công!');
			}else{
				shop.show_overlay_popup('muachung-login', 'Đăng nhập',
				shop.customer.login.theme.form('muachung-login', 'Đăng nhập'),
				{
					background: {
						'background-color' : 'transparent'
					},
					border: {
						'background-color' : 'transparent',
						'padding' : '0px'
					},
					title: {
						'display' : 'none'
					},
					content: {
						'padding' : '0px',
						'width' : '400px'
					}
				});
			}
		},
		cancel:function(){shop.hide_all_popup()},
		valid:function(id_email, id_pass , popup){
			var jemail = '#'+id_email;
			var jpass = '#'+id_pass;
			var email = shop.util_trim(jQuery(jemail).val());
			
			if(email == '' || email == 'email đăng nhập'){
				var $msg = 'Chưa nhập email!';
				if(!popup){
					shop.show_popup_message($msg, "Đăng nhập thất bại", -1);
				}
				else{
					shop.error.set(jemail, $msg, 300, '.login_form');
				}
				return false;
			}else if(!shop.is_email(email)){
				var $msg = 'Email không hợp lệ!';
				if(!popup){
					shop.show_popup_message($msg, "Đăng nhập thất bại", -1);
				}
				else{
					shop.error.set(jemail, $msg, 300, '.login_form');
				}
				return false;
			}else{
				shop.error.close(jemail, '.login_form');
			}
			var pass = shop.util_trim(jQuery(jpass).val());
			if(pass == ''){
				var $msg = 'Chưa nhập mật khẩu!';
				if(!popup){
					shop.show_popup_message($msg, "Đăng nhập thất bại", -1);
				}
				else{
					shop.error.set(jpass, $msg, 300, '.login_form');
				}
				return false;
			}else if(pass.length < 6){
				var $msg = 'Mật khẩu tối thiểu phải có 6 kí tự!';
				if(!popup){
					shop.show_popup_message($msg, "Đăng nhập thất bại", -1);
				}
				else{
					shop.error.set(jpass, $msg, 300, '.login_form');
				}
				return false;
			}
			return true;
		},
		submit: function(id_email, id_pass , id_save, popup){
			if(shop.customer.login.valid(id_email,id_pass,popup)){
				var jemail = '#'+id_email;
				var jpass = '#'+id_pass;
				var save = shop.get_ele(id_save);
				var cookie = save.checked ? 'on' : 'off';
				var post = {
					email: shop.util_trim(jQuery(jemail).val()),
					pass: shop.util_trim(jQuery(jpass).val()),
					save: cookie,
					city: shop.customer.login.conf.cb ? 1 : 0
				};
				shop.ajax_popup('act=customer&code=login','POST',post,
					function(j){
						if (j.err == 0 && j.msg == 'success') {
							if(shop.customer.login.conf.cb){
								shop.customer.login.conf.cb(j);
							}else{
								location.reload();
							}
						} else {
							switch(j.msg){
								case 'un_active':
									j.msg = '<font color="red">Tài khoản của Quý khách chưa được <a href="javascript:void(0)" onclick="shop.customer.active.send(\''+j.email+'\')">kích hoạt</a></font>';
								break;
								case 'blocked'  :
									j.msg = '<font color="red">Muachung đã khóa tài khoản '+j.more.block_day+' ngày</font>';
									j.msg+= '<div class="mTop5"><b><u>Lí do</u>:</b> <font color="red">'+j.more.block_reason+'</font></div>';
								break;
								case 'nodata'   : j.msg = 'Tài khoản hoặc mật khẩu không hợp lệ'; break;
								case 'err_pass' :
									j.msg = 'Mật khẩu sai, <a href="javascript:void(0)" onclick="shop.customer.password.resendPassword(\''+j.email+'\')">Quý khách đã quên mật khẩu?</a>';
								break;
								case 'err_user' : j.msg = 'Không tồn tại tên đăng nhập này'; break;
								case 'in_email' : j.msg = 'Địa chỉ mail không hợp lệ'; break;
							}
							if(!popup){
								shop.show_overlay_popup('sys-alert', '',
								shop.popupSite('sys-alert', 'Hệ thống', shop.join
														('<div class="content" style="padding:20px">')
															('<div style="color:red"><b>Đăng nhập không thành công !!!</b></div>')
															('<div class="f12 mTop10"><b><u>Nguyên nhân</u>:</b> '+j.msg+'</div>')
														('</div>')()),
								{
									background: {'background-color' : 'transparent'},
									border: {
										'background-color' : 'transparent',
										'padding' : '0px'
									},
									title: {'display' : 'none'},
									content: {
										'padding' : '0px',
										'width' : '400px'
									}
								});
							}
							else{
								shop.error.set('', j.msg, 300, '.login_form');
							}
						  
						}
					});
			}
		},
		theme:{
			form:function(id, title, close, opt, txt){
				//(' | <a class="f11" onclick="shop.customer.register.show()" href="javascript:void(0)" style="color:#006997">Đăng ký</a>')
				var html = shop.join
				('<form onsubmit="return shop.customer.loginPopup();" method="post" id="customer_login_form">')
					('<div class="content login_form" style="padding:1px 0 0">')
						('<div id="cError"></div>')
						('<div class="mTop10">')
							('<table cellpadding="0" cellspacing="5">')
								('<tr class="reg_collapse">')
									('<td align="right" width="140"><b>Email đăng nhập:</b></td>')
									('<td width="200"><input type="text" id="login_email" name="email" /></td>')
								('</tr>')
								('<tr class="mTop10 reg_collapse">')
									('<td align="right"><b>Mật khẩu:</b></td>')
									('<td><input type="password" id="login_pass" name="pass" /></td>')
								('</tr>')
								('<tr>')
									('<td></td>')
									('<td align="left">')
										('<div class="mTop10">')
											('<input type="checkbox" id="save_login" class="m0" />')
											('<span class="login_oke f11 pLeft5" onclick="shop.customer.login.theme.check()" style="color:#006997">Ghi nhớ đăng nhập</span>')
										('</div>')
									('</td>')
								('</tr>')
							('</table>')
						('</div>')
						('<div class="mTop10">')
							('<div style="width:205px;margin:0 auto">')
								('<a id="fr" class="closeButtonLogin mLeft15" onclick="shop.customer.login.cancel()" href="javascript:void(0)">[X] Hủy bỏ</a>')
								('<a id="fr" class="blueButton" onclick="shop.customer.loginPopup()" href="javascript:void(0)"><span><span>Đăng nhập</span></span></a>')
								('<input type="submit" onclick="shop.customer.loginPopup();" value="" class="hidden" />')
								('<div class="c"></div>')
							('</div>')
						('</div>')
						('<div class="mTop15" style="padding:15px 0;background:#fefbc4;border-top:1px solid #d5d0cd" align="center">')
							('<div class="f14"><b style="color:#006aa6">Bạn chưa có tài khoản MuaChung.vn?</b></div>')
							('<table class="mTop10"><tr><td><a class="orangeButtonRegis" onclick="shop.customer.register.show()" href="javascript:void(0)"><span></span></a></td></tr></table>')
							('<div class="c"></div>')
						('</div>')
					('</div>')
				('</form>')();
				if(txt){
					return html;
				}
				return shop.popupSite(id, title, html, close, opt);
			},
			check:function(){
				var c = shop.get_ele('save_login');
				if(c){
					c.checked = !c.checked
				}
			}
		}
	},
	register : {
		show:function(){
			shop.show_overlay_popup('muachung-register', 'Đăng kí',
			shop.customer.register.theme.form('muachung-register', 'Đăng kí'),
			{
				background: {
					'background-color' : 'transparent'
				},
				border: {
					'background-color' : 'transparent',
					'padding' : '0px'
				},
				title: {
					'display' : 'none'
				},
				content: {
					'padding' : '0px',
					'width' : '500px',
					'font-size': '12px'
				},
				release:function(){
					shop.enter('#reg_full_name', shop.customer.register.submit);
					shop.enter('#reg_email', shop.customer.register.submit);
					shop.enter('#reg_pass', shop.customer.register.submit);
					shop.enter('#reg_pass1', shop.customer.register.submit);
				}
			});
		},
		cancel:function(){shop.hide_all_popup()},
		valid:function(){
			var reg_oke = shop.get_ele('reg_oke');
			if(reg_oke && !reg_oke.checked){
				shop.error.set('#reg_oke', 'Vui lòng chấp nhận các điều khoản & quy định của Muachung.vn', 430, '.register_form');
				return false;
			}
			var email = shop.util_trim(jQuery('#reg_email').val());
			if(email == ''){
				shop.error.set('#reg_email', 'Chưa nhập email', 430, '.register_form');
				return false;
			}else if(!shop.is_email(email)){
				shop.error.set('#reg_email', 'Email không hợp lệ', 430, '.register_form');
				return false;
			}else{
				shop.error.close('#reg_email', '.register_form');
			}
	
			var pass = jQuery('#reg_pass').val();
			if(pass.length < 6){
				shop.error.set('#reg_pass', 'Mật khẩu tối thiểu phải có 6 kí tự', 430, '.register_form');
				jQuery('#reg_pass #reg_pass1').val('');
				return false;
			}
			if(pass == ''){
				shop.error.set('#reg_pass', 'Chưa nhập mật khẩu hoặc có chỉ có ký tự trắng', 430, '.register_form');
				jQuery('#reg_pass #reg_pass1').val('');
				return false;
			}
			if(shop.util_trim(pass) == ''){
				shop.error.set('#reg_pass', 'Không được bỏ trống trường mật khẩu hoặc dùng ký tự cách', 430, '.register_form');
				jQuery('#reg_pass #reg_pass1').val('');
				return false;
			}
			//pass = shop.util_trim(pass);
			shop.error.close('#reg_pass', '.register_form');
			var pass1 = jQuery('#reg_pass1').val();
			if(pass1 == ''){
				shop.error.set('#reg_pass1', 'Chưa nhập lại mật khẩu', 430, '.register_form');
				return false;
			}else if(pass != pass1){
				shop.error.set('#reg_pass1', 'Mật khẩu không khớp', 430, '.register_form');
				return false;
			}else{
				shop.error.close('#reg_pass1', '.register_form');
			}
	
			var reg_phone = shop.util_trim(jQuery('#reg_phone').val());
			if(reg_phone == ''){
				shop.error.set('#reg_phone', 'Chưa nhập số điện thoại', 430, '.register_form');
				return false;
			}else if(!shop.is_phone(reg_phone)){
				shop.error.set('#reg_phone', 'Số điện thoại di động không hợp lệ', 430, '.register_form');
				return false;
			}else{
				shop.error.close('#reg_phone', '.register_form');
			}
			return true;
		},
		submit: function(){
			if(shop.customer.register.valid()){
				var post = {
					email: shop.util_trim(jQuery('#reg_email').val()),
					pass: shop.util_trim(jQuery('#reg_pass').val()),
					phone: shop.util_trim(jQuery('#reg_phone').val()),
					uname: shop.util_trim(jQuery('#reg_full_name').val()),
					address: shop.util_trim(jQuery('#reg_address').val()),
					district: shop.util_trim(jQuery('#reg_listDistrict').val()),
					city: shop.util_trim(jQuery('#city').val())
				};
	
				shop.ajax_popup('act=customer&code=valid_reg','GET',{email: post.email, phone: post.phone},function(json){
					if(json.email){
						var msg = json.email;
						if(json.block >= 1){
							msg = 'Email này đã được sử dụng và đang bị khóa. Nếu có bất cứ thắc mắc nào, xin Quý khách vui lòng liên hệ với Muachung.';
						}else if(json.active == 1){
							msg = 'Email này đã được sử dụng! Quý khách đã <a href="javascript:void(0)" onclick="shop.customer.register.showPassForm(\''+post.email+'\')">quên mật khẩu</a> ?';
						}else if(json.active == 0){
							msg = 'Email này đã được dùng và đang trong trạng thái chưa kích hoạt. Nếu quý khách đã dùng email này mua hàng trên Muachung.vn, vui lòng kiểm tra hòm thư hoặc <a href="javascript:void(0)" onclick="shop.customer.register.sendActiveEmail(\''+post.email+'\')">nhấn vào đây</a> để nhận lại email kích hoạt';
						}
						shop.error.set('#reg_email', msg, 430, '.register_form');
					}else if(json.phone){
						shop.error.set('#reg_phone', json.phone, 430, '.register_form');
					}else{
						shop.ajax_popup('act=customer&code=register','POST',post,
							function(json){
								if(json.err >= 0){
									shop.customer.register.cancel();
									if(json.active){
										alert(json.msg);
										window.location.reload();
									}else{
										shop.show_overlay_popup('alert-register', 'Kích hoạt tài khoản qua Email',
											shop.popupSite('alert-register', 'Kích hoạt tài khoản qua Email',shop.join
											('<div class="p20" style="padding-bottom:5px">')
												('<div style="font-size:16px"><b>Cám ơn Quý khách đã đăng kí tài khoản trên MuaChung</b></div>')
												('<div class="mTop10">Email kích hoạt đã được gửi vào hòm thư <b style="font-size:16px;color:red">'+json.email+'</b></div>')
												('<div class="mTop10">Vui lòng kiểm tra và <span style="color:red">bấm link kích hoạt</span>. Nếu Quý khách không thấy trong <b>Inbox</b> hãy kiểm tra <b>Thư rác/Spam/Junk mail</b></div>')
												('<div class="mTop15" align="center"><table><tr><td><a class="blueButton" onclick="shop.hide_overlay_popup(\'alert-register\')" href="javascript:void(0)"><span><span>Đóng cửa sổ</span></span></a></td></tr></table></div>')
											('</div>')()),
											{
												background: {
													'background-color' : 'transparent'
												},
												border: {
													'background-color' : 'transparent',
													'padding' : '0px'
												},
												title: {
													'display' : 'none'
												},
												content: {
													'padding' : '0px',
													'width' : '510px'
												}
											}
										);
									}
								}else{
									if(shop.is_exists(json.email)){
										var msg = json.email;
										if(json.block >= 1){
											msg = 'Email này đã được sử dụng và đang bị khóa. Nếu có bất cứ thắc mắc nào, xin Quý khách vui lòng liên hệ với Muachung.';
										}else if(json.active == 1){
											msg = 'Email này đã được sử dụng! Quý khách đã <a href="javascript:void(0)" onclick="shop.customer.register.showPassForm(\''+post.email+'\')">quên mật khẩu</a> ?';
										}else if(json.active == 0){
											msg = 'Email này đã được dùng và đang trong trạng thái chưa kích hoạt. Nếu quý khách đã dùng email này mua hàng trên Muachung.vn, vui lòng kiểm tra hòm thư hoặc <a href="javascript:void(0)" onclick="shop.customer.register.sendActiveEmail(\''+post.email+'\')">nhấn vào đây</a> để nhận lại email kích hoạt';
										}
										shop.error.set('#reg_email', msg, 430, '.register_form');
									}else if(shop.is_exists(json.phone)){
										shop.error.set('#reg_phone', json.phone, 430, '.register_form');
									}
								}
							}
						);
					}
				});
			}
		},
		showPassForm:function(email){
			shop.hide_overlay_popup('muachung-register');
			shop.customer.password.resendPassword(email);
		},
		sendActiveEmail:function(email, active){
			active = active ? active : 0;
			shop.ajax_popup('act=customer&code=email-active','GET',{email: email, active: active},function(j){
				if(j.err == 0){
					shop.hide_overlay_popup('muachung-register');
					alert('Email kích hoạt đã được gửi vào hòm thư:\n'+email+'\nVui lòng kiểm tra và kích hoạt tài khoản.');
				}else{
					alert('Có lỗi xảy ra! Vui lòng thực hiện lại thao tác.');
				}
			});
		},
		theme:{
			form:function(id, title, close, opt, txt){
				var html = '', city = '<select name="city" id="city" onchange="shop.district.loadDistrictDropdown(this.value, \'reg_listDistrict\');">';
				city += '<option value="0"> Chọn tỉnh thành phố </option>';
				for(var i in city_list){
					city += '<option value="'+city_list[i].id+'">'+city_list[i].title+'</option>';
				}
				city += '</select>';
				html = shop.join
				('<form id="bm_register_form">')
					('<div class="content register_form" style="padding:1px 0 10px">')
						('<div id="cError"></div>')
						('<div class="reg_collapse">')
							('<div class="title">Thông tin tài khoản:</div>')
							('<table cellpadding="0" cellspacing="5">')
								('<tr>')
									('<td align="right" width="160">Email đăng nhập:</td>')
									('<td width="200"><input type="text" id="reg_email" name="email" /></td>')
									('<td>(<font color="red">*</font>)</td>')
								('</tr>')
								('<tr>')
									('<td align="right">Mật khẩu:</td>')
									('<td><input type="password" id="reg_pass" name="pass" /></td>')
									('<td>(<font color="red">*</font>)</td>')
								('</tr>')
								('<tr>')
									('<td align="right">Nhập lại mật khẩu:</td>')
									('<td><input type="password" id="reg_pass1" name="pass1" /></td>')
									('<td>(<font color="red">*</font>)</td>')
								('</tr>')
							('</table>')
						('</div>')
						('<div class="reg_collapse mTop5">')
							('<div class="title">')
								('<div class="fl">Thông tin cá nhân, địa chỉ chuyển hàng:</div>')
								('<a href="javascript:void(0)" class="fr" onclick="jQuery(\'#more_info\').slideToggle()">[mở rộng - thu gọn]</a>')
								('<div class="c"></div>')
							('</div>')
							('<table cellpadding="0" cellspacing="5" id="more_info" class="hidden">')
								('<tr>')
									('<td align="right" width="160">Họ tên:</td>')
									('<td width="200"><input type="text" id="reg_full_name" name="full_name" /></td>')
								('</tr>')
								('<tr>')
									('<td align="right">Địa chỉ nhận hàng:</td>')
									('<td><input type="text" id="reg_address" name="address" /></td>')
								('</tr>')
								('<tr>')
									('<td align="right">Tỉnh/Thành phố:</td>')
									('<td>'+city+'</td>')
								('</tr>')
								('<tr>')
									('<td align="right">Quận/Huyện/Phường:</td>')
									('<td class="customerRegister"><select id="reg_listDistrict" class="w290" name="district"></select></div></td>')
								('</tr>')
							('</table>')
						('</div>')
						('<div class="reg_collapse mTop5">')
							('<div class="title">Thông tin xác thực thanh toán:</div>')
							('<table cellpadding="0" cellspacing="5">')
								('<tr>')
									('<td align="right" width="160">Điện thoại di động:</td>')
									('<td width="200"><input type="text" id="reg_phone" name="phone" onkeypress="return shop.numberOnly(this,event)" /></td>')
									('<td>(<font color="red">*</font>)</td>')
								('</tr>')
								('<tr>')
									('<td>&nbsp;</td>')
									('<td colspan="2"><div style="color:#787878;font-size:11px;width:260px">(Quý khách phải nhập chính xác số điện thoại để nhận mã số phiếu mua hàng qua tin nhắn SMS)</div></td>')
								('</tr>')
							('</table>')
						('</div>')
						('<div class="mTop10 mLeft15">')
							('<input type="checkbox" id="reg_oke" />')
							('<span class="reg_oke" onclick="shop.customer.register.theme.check()">Tôi đã đọc và chấp nhận các <a href="trang-the-le.html" target="_blank">điểu khoản</a> và <a href="trang-quy-dinh-refund.html" target="_blank">quy định</a> của Muachung.vn</span>')
						('</div>')
						('<div class="mTop15">')
							('<div style="width:150px;margin:0 auto">')
								('<a id="fr" class="blueButton mLeft10" onclick="shop.customer.register.cancel()" href="javascript:void(0)"><span><span>Hủy bỏ</span></span></a>')
								('<a id="fr" class="blueButton" onclick="shop.customer.register.submit()" href="javascript:void(0)"><span><span>Đăng kí</span></span></a>')
								('<div class="c"></div>')
							('</div>')
						('</div>')
					('</div>')
				('</form>')();
				if(txt){
					return html;
				}
				return shop.popupSite(id, title, html, close, opt);
			},
			check:function(){
				var c = shop.get_ele('reg_oke');
				if(c){
					c.checked = !c.checked
				}
			}
		}
	},
	loginMixReg:{
		show:function(){
			shop.customer.login.show();
		}
	}
};
jQuery(document).ready(function(){
	if(IS_ACTIVE_PHONE != 1){
		shop.customer.active.phone();
	}
});

