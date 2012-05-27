shop.cart_pro = {
//	--------------------------------- config -------------------------------- //
	conf:{
		extra:{},
		user:{fullname:'',email:'',mobile_phone:'',type:'guest',address:'',city:0,district:'',note:''},
		customer:{},
		userInfo:1,
		userAddress:1,
		cart:null,
		loto:false,
		card:[50000,100000,200000,300000,500000],
		card_rate: 9/10,
		shipping:{active:false, COD:false, fee:0, fee_f:'0 đ', note:'', check: false, code:'SHIP', codNote: '', codShipType:'card'},
		province: 0,
		addbook: false,
		office: null,
		office_id: 0,
		gold_only: false
	},

//	--------------------------------- main action -------------------------------- //
	addItem: function (id, start, end, buyer, buyer_need, type, extra) {
		var msg = '';
		if(buyer >= buyer_need){
			msg = '<span style="font-size:14px;color:red">Rất tiếc! Sản phẩm đã được mua hết<br />Xin Quý khách vui lòng chọn sản phẩm khác.</span>';
		}else if(end < TIME_NOW){
			msg = '<span style="font-size:14px;color:red">Rất tiếc! Đã quá thời hạn bán sản phẩm.<br />Xin Quý khách vui lòng chọn sản phẩm khác.</span>';
		}else if(start > TIME_NOW){
			var d = new Date(start*1000),
				hour= d.getHours(),
				min = d.getMinutes(),
				day = d.getDate(),
				month = d.getMonth()+1;
			msg = '<span style="font-size:14px;color:red">Rất tiếc! Chưa đến thời hạn bán sản phẩm.<br />Sản phẩm sẽ được bán vào lúc</span> <b style="font-size:16px">'+((hour>9?'':'0')+(hour>0?hour:0)+'h'+(min>9?'':'0')+(min>0?min:0)+' ngày '+(day>9?'':'0')+(day>0?day:0)+'/'+(month>9?'':'0')+(month>0?month:0)+'/'+d.getFullYear())+'</b>';
		}
		if(msg != ''){
			shop.cTheme.systemAlert(msg);
		}else{
			shop.cart_pro.doAddItem(id, type);
		}
	},
	doAddItem:function(id, type, idx){
		shop.cLib.guest.restore(shop.cart_pro);
		shop.ajax_popup("act=cart_promotion&code=order",'POST',{id: id, number: 1, extra: idx},
		function(json){
			if(json.err == 0){
				//check loto
				shop.cart_pro.conf.loto = json.order.cart.is_loto == 1;
				shop.cart_pro.conf.province = json.order.cart.province_id;
				if(shop.cart_pro.conf.loto && json.user.type != 'customer'){
					shop.customer.loginMixReg.show();
				}else{
					shop.cart_pro.conf.shipping = {
						fee: parseInt(json.order.cart.fee_shipping),
						fee_f: json.order.cart.fee_shipping_f,
						code:'SHIP',
						note: json.order.cart.note,
						active: false,
						COD: true,
						check: false,
						codShipType: '',
						codNote: json.order.cart.note_cod
					};
					shop.cart_pro.conf.shipping.active = (shop.cart_pro.conf.shipping.fee >= 0) && (shop.cart_pro.conf.shipping.note != '');
					shop.cart_pro.conf.cart = json.order;
					
					//cap nhat lai thong tin nguoi mua hang
					shop.cLib.guest.update(json.user, shop.cart_pro);
					if(json.user.type == 'customer'){
						shop.cart_pro.conf.customer = json.user;
						shop.cart_pro.conf.customer.gold = parseInt(shop.cart_pro.conf.customer.gold);
						shop.cart_pro.conf.card_rate = json.card_rate;
					}
					shop.cart_pro.conf.cart.payment_id = 'mcard';
					shop.cart_pro.conf.cart.payment = 2;
					//kiem tra kich hoat
					if(shop.cart_pro.conf.customer.active == 0){
						alert('Quý khách vui lòng kích hoạt Email trước khi chọn mua hàng bằng Ví MuaChung');
						shop.hide_overlay_popup('cart-regulations');
						shop.customer.register.sendActiveEmail(shop.cart_pro.conf.customer.email, 1);
						return;
					}else if(shop.cart_pro.conf.customer.active_phone == 0){
						shop.cTheme.showActivePhoneWarning(shop.cart_pro.conf.customer.active,shop.cart_pro.conf.customer.active_phone);
						return;
					}
					shop.cart_pro.stepOne();
				}
			}else{
				switch(json.msg){
					case 'full':
						shop.cTheme.systemAlert('<span style="font-size:14px;color:red">Rất tiếc! Sản phẩm đã được mua hết hoặc thời hạn bán sản phẩm không hợp lệ.<br />Xin Quý khách vui lòng chọn sản phẩm khác.</span>');
					break;
					case 'miss':
						if(shop.is_exists(json.miss.phone)){
							miss += '<br /><b>- Số điện thoại</b>';
						}
						shop.cTheme.systemAlert('<span style="font-size:14px"><span style="color:red">Rất tiếc! Quý khách chưa điền đủ thông tin cá nhân nên không thể tiếp tục mua hàng.</span><br /><br />Xin Quý khách vui lòng vào <a href="'+json.link_profile+'">sửa thông tin cá nhân</a> và bổ sung thêm: '+miss+'</span>');
					break;
					case 'loto_overflow':
						shop.cTheme.systemAlert('<span style="font-size:14px"><span style="color:red">Rất tiếc! Hôm nay, Quý khách đã mua đủ số lượng phiếu dự thưởng.</span></span>');
					break;
				}
			}
		});
	},

//	--------------------------------- showing popup -------------------------------- //

	stepOne:function(add){
		if(add){
			shop.cart_pro.conf.addbook = true;
		}
		var tpl = shop.cart_pro.theme.stepOne('cart-check-out-step1', 'Nhập thông tin cá nhân');
		if(tpl != ''){
			shop.show_overlay_popup('cart-check-out-step1', 'Nhập thông tin cá nhân',
			tpl,
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
					'width' : '660px',
					'font-size': '12px'
				},
				release:function(){
					if(!shop.cart_pro.conf.addbook){
						shop.district.loadDistrictDropdown(shop.cart_pro.conf.user.city, 'listDistrict', function(def){
							if(shop.is_exists(shop.district.listDistrictDropdown[def].in_area)){
								shop.cart_pro.conf.shipping.in_area = shop.district.listDistrictDropdown[def].in_area;
							}
						}, shop.cart_pro.conf.user.district);
					}
				}
			});
		}
	},
	stepTwo:function(district_id, city_id){
		//valid lai truong text tranh undefined
		if(shop.cart_pro.conf.user.address == '' || shop.cart_pro.conf.user.address == null || shop.cart_pro.conf.user.address == 'undefined' || shop.cart_pro.conf.user.address == undefined ||
		   shop.cart_pro.conf.user.street == '' || shop.cart_pro.conf.user.street == null || shop.cart_pro.conf.user.street == 'undefined' || shop.cart_pro.conf.user.street == undefined)
		{
			if(district > 0){
				alert('Thông tin địa chỉ chưa chính xác! Quý khách vui lòng nhập lại');
				return;
			}
		}

		var tpl = shop.cart_pro.theme.stepTwo('cart-check-out-step2', 'Mua hàng');
		if(tpl != ''){
			shop.show_overlay_popup('cart-check-out-step2', 'Mua hàng',
			tpl,
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
					'width' : '660px',
					'font-size': '12px'
				},
				release:function(){
					jQuery('#formQuantity').jNice();
					if(shop.cart_pro.conf.cart.payment_id != 'coo'){
						jQuery('.radio_ship').click(function(){shop.cart_pro.theme.newPrice(this.value, true)});
					}else{
						shop.JT_init();
					}
					jQuery('.rightInfo').hover(
						function(){
							jQuery(this).addClass('rightInfoActive');
						},
						function(){
							jQuery(this).removeClass('rightInfoActive');
						}
					).click(function(){
						if(shop.cart_pro.conf.cart.payment_id != 'coo'){
							shop.cart_pro.theme.newPrice(this.id, false)
						}else{
							jQuery('#office'+this.id).attr('checked', 'checked');
						}
						if(!jQuery(this).hasClass('rightInfoClicked')){
							jQuery('.rightInfoClicked').removeClass('rightInfoClicked');
							jQuery(this).addClass('rightInfoClicked');
						}
					});
				}
			});
		}
	},
	stepThree: function(){
		shop.show_overlay_popup('cart-confirm','Thanh Toán',
		shop.cart_pro.theme.confirmProduct('cart-confirm','Thanh Toán'),
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
				'width' : '815px',
				'font-size': '12px'
			}
		});
	},
	stepFinish: function(){
		shop.show_overlay_popup('cart-step-finish','Cám ơn Quý khách đã mua hàng',
		shop.cart_pro.theme.finish('cart-step-finish','Cám ơn Quý khách đã mua hàng'),
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
				'width' : '415px',
				'font-size': '12px'
			}
		});
	},

//	--------------------------------- process cart -------------------------------- //

	processStepOne:function(){
		var frm = document.cartRegisterForm, fname = '',tel  = '',email = '',address = '', city = 0, district = '', street = '', ward = '';
		//ho va ten
		if(frm.cart_fullname){
			fname = shop.util_trim(frm.cart_fullname.value);
			if(fname == ''){
				shop.error.set('#'+frm.cart_fullname.id, 'Chưa nhập họ tên', 550, '.reg_cart_form');return;
			}else if(fname.length < 3){
				shop.error.set('#'+frm.cart_fullname.id, 'Họ tên tối thiểu là 3 kí tự', 550, '.reg_cart_form');return;
			}
			else if(fname.match(/[',",>,<,=,&,?,!,~,%,+,{,},\[,\],|,`,(,),@,#,$,^,*,-,\/,\\,\,]/i) != null){
				shop.error.set('#'+frm.cart_fullname.id, 'Họ tên không chứa các kí tự đặc biệt', 550, '.reg_cart_form');return;
			}
			else{
				shop.error.close('#'+frm.cart_fullname.id, '.reg_cart_form');
			}
		}
		//so dien thoai
		if(frm.cart_tel){
			tel = shop.util_trim(frm.cart_tel.value);
			if(tel == ''){
				shop.error.set('#'+frm.cart_tel.id, 'Chưa nhập Số điện thoại', 550, '.reg_cart_form');return;
			}
			else if(!shop.is_phone(frm.cart_tel.value)){
				shop.error.set('#'+frm.cart_tel.id, 'Số điện thoại di động không hợp lệ', 550, '.reg_cart_form');return;
			}
			else{
				shop.error.close('#'+frm.cart_tel.id, '.reg_cart_form');
			}
		}
		//email
		if(frm.cart_email){
			email = shop.util_trim(frm.cart_email.value);
			if(email == ''){
				shop.error.set('#'+frm.cart_email.id, 'Chưa nhập địa chỉ email', 550, '.reg_cart_form');return;
			}else if(!shop.is_email(email)){
				shop.error.set('#'+frm.cart_email.id, 'Địa chỉ email không hợp lệ', 550, '.reg_cart_form');return;
			}
			else{
				shop.error.close('#'+frm.cart_email.id, '.reg_cart_form');
			}
		}
		//dia chi nhan hang
		if(frm.cart_address){
			address = shop.util_trim(frm.cart_address.value);
			if(address == '' || address == null || address == 'undefined' || address == undefined){
				shop.error.set('#'+frm.cart_address.id, 'Chưa nhập Địa chỉ', 550, '.reg_cart_form'); return;
			}else if(address.match(/[<>]/i) != null){
				shop.error.set('#'+frm.cart_address.id, 'Kí tự "<" & ">" không hợp lệ, vui lòng nhập lại', 550, '.reg_cart_form');
				return;
			}else{
				shop.error.close('#'+frm.cart_address.id, '.reg_cart_form');
			}
		}
		//thong tin duong pho
		if(frm.cart_street){
			street = shop.util_trim(frm.cart_street.value);
			if(street == '' || street == null || street == 'undefined' || street == undefined){
				shop.error.set('#'+frm.cart_street.id, 'Chưa nhập Đường/Phố', 550, '.reg_cart_form'); return;
			}else if(street.match(/[<>]/i) != null){
				shop.error.set('#'+frm.cart_street.id, 'Kí tự "<" & ">" không hợp lệ, vui lòng nhập lại', 550, '.reg_cart_form');return;
			}else{
				shop.error.close('#'+frm.cart_street.id, '.reg_cart_form');
			}
		}
		//thong tin tinh thanh pho
		if(frm.cart_city){
			city = parseInt(frm.cart_city.value);
			if(city <= 0){
				shop.error.set('#'+frm.cart_city.id, 'Chưa chọn Tỉnh/Thành', 550, '.reg_cart_form');return;
			}else{
				shop.error.close('#'+frm.cart_city.id, '.reg_cart_form');
			}
		}
		//thong tin quan/huyen
		if(frm.district){
			district = shop.util_trim(frm.district.value);
			if(district <= 0){
				shop.error.set('#'+frm.district.id, 'Chưa chọn Quận/Huyện', 550, '.reg_cart_form');return;
			}else{
				shop.error.close('#'+frm.district.id, '.reg_cart_form');
			}
		}

		//save user info by cookie
		shop.cart_pro.conf.user.email = email;
		shop.cart_pro.conf.user.fullname = fname;
		shop.cart_pro.conf.user.mobile_phone = tel;
		shop.cart_pro.conf.user.address = address;
		shop.cart_pro.conf.user.street = street;
		shop.cart_pro.conf.user.city = city;
		shop.cart_pro.conf.user.district_id = district;
		shop.cart_pro.conf.user.district = frm.district.options[frm.district.selectedIndex].innerHTML;
		shop.cLib.guest.save(shop.cart_pro.conf.user, shop.cart);
		
		//go to next step
		if(shop.cart_pro.conf.addbook){
			shop.ajax_popup('cart_promotion&code=addbook',"POST",shop.cart_pro.conf.user,
			function (j) {
				if (j.err != 0) {
					switch(j.msg){
						case 'db':
							j.msg = 'Cập nhật thất bại';
						break;
						case 'login':
							j.msg = 'Quý khách phải đăng nhập để thực hiện chức năng này';
						break;
						case 'no_need':
							j.msg = 'Thông tin địa chỉ này đã tồn tại trong danh sách';
						break;
					}
				}else{
					j.msg = 'Thông tin địa chỉ đã được thêm vào danh sách';
				}
				alert(j.msg);
				shop.cart_pro.conf.addbook = false;
				shop.cart_pro.stepTwo();
			});
		}else{
			shop.cart_pro.stepTwo();
		}
	},
	processStepTwo:function(){
		var is_cod = shop.cart_pro.conf.cart.payment_id == 'cod',
		is_office = shop.cart_pro.conf.cart.payment_id == 'coo',
		number_buy = 0,
		note = '';

		//check so luong neu gan het san pham
		shop.ajax_popup('act=cart_promotion&code=register',"POST",{
			quantity: shop.cart_pro.conf.cart.numberOtp,
			item_id: shop.cart_pro.conf.cart.cart.id
		},
		function (j) {
			if (j.err != 0) {
				switch(j.msg){
					case 'invalid_min':
						j.msg = 'Bạn phải mua tối thiểu '+shop.cart_pro.conf.cart.cart.min_order+' sản phẩm';
					break;
					case 'invalid_quantity':
						j.msg = 'Sản phẩm đã bán hết';
						if(j.quantity > 0){
							j.msg = 'Chỉ còn '+j.quantity+' sản phẩm';
						}
					break;
					case 'loto_overflow':
						j.msg = 'Quý khách đã mua '+j.loto_now+' vé số.\nDo đó Quý khách chỉ được mua thêm '+j.loto_valid+' vé số.';
					break;
				}
				alert(j.msg);return;
			}else{
				shop.cart_pro.conf.cart.cart.free_item = j.free_item;
				shop.cart_pro.stepThree();
			}
		});
	},
	processStepThree:function(){
		var post, card = shop.cart_pro.conf.cart.payment, note =  '', city = 0, street = '', ward = '', district = '', address = '', g_note = '';

		post = {
			fullname: shop.cart_pro.conf.user.fullname,
			tel: shop.cart_pro.conf.user.mobile_phone,
			email: shop.cart_pro.conf.user.email,
			item_id: shop.cart_pro.conf.cart.cart.id,
			paymentType: card,
			adminNote:note,
			quantity:shop.cart_pro.conf.cart.numberOtp,
			city: city,
			district: district,
			address: address,
			street: street,
			ward: ward,
			note: g_note,
			shipping: shop.cart_pro.conf.shipping.check ? shop.cart_pro.conf.shipping.fee : -1,
			ship_active: (shop.cart_pro.conf.shipping.active || shop.cart_pro.conf.shipping.COD) ? 1 : 0,
			ship_code: shop.cart_pro.conf.shipping.code,
			codShipType: shop.cart_pro.conf.shipping.codShipType
		};
		//submit
		shop.cart_pro.finishSubmit(post);
	},
	finishSubmit:function(post){
		shop.ajax_popup('act=cart_promotion&code=finish',"POST",post,
		function(j){
			if(j.err == 0)	{
				shop.cart_pro.conf.cart.payment == 2
				if(shop.is_exists(j.more_gold)){
					shop.cart_pro.conf.card_post = post;
					shop.cart_pro.conf.customer.gold = j.gold;
					shop.cart_pro.conf.customer.more_gold = j.more_gold;
					shop.cart_pro.conf.cart.total = j.total;
				}else{
					shop.cart_pro.stepFinish();
					shop.redirect(j.url);
				}
			}else{
				switch(j.msg){
					case 'invalid_min': j.msg = 'Bạn phải mua tối thiểu '+shop.cart_pro.conf.cart.cart.min_order+' sản phẩm'; break;
					case 'invalid_quantity':
						j.msg = 'Sản phẩm đã bán hết';
						if(j.quantity > 0){
							j.msg = 'Chỉ còn '+j.quantity+' sản phẩm';
						}
					break;
					case 'cus_not_found': j.msg = 'Hiện tại bạn đang không đăng nhập.<br />Vui lòng tắt cửa sổ, mua lại'; break;
					case 'loto_overflow':
						j.msg = 'Quý khách đã mua '+j.loto_now+' vé số.<br />Do đó Quý khách chỉ được mua thêm '+j.loto_valid+' vé số';
					break;
					case 'active_phone':case 'active_email':
						shop.hide_overlay_popup('cart-confirm');
						if(shop.cart_pro.conf.cart.payment_id == 'cod'){
							var email = (j.msg == 'active_email' ? 0 : 1),
							phone = (j.msg == 'active_phone' ? 0 : 1);
							shop.cTheme.showActivePhoneWarning(email,phone);
						}else if(j.msg == 'active_email' && shop.cart_pro.conf.cart.payment_id == 'mcard'){
							alert('Quý khách vui lòng kích hoạt Email trước khi chọn mua hàng bằng Ví MuaChung');
							shop.customer.register.sendActiveEmail(shop.cart_pro.conf.customer.email, 1);
						}
					break;
				}
				shop.show_popup_message(j.msg,'Thông báo lỗi',-1);
			}
		});
	},

//	--------------------------------- cart theme -------------------------------- //

	theme:{
		stepOne:function(id, title){
			var fname = shop.join
			('<tr>')
				('<td width="85" class="bold">Họ và tên:</td>')
				('<td><input type="text" id="cart_fullname" name="fullname" value="'+(shop.cart_pro.conf.user.fullname&&!shop.cart_pro.conf.addbook ? shop.cart_pro.conf.user.fullname : '')+'" /></td>')
			('</tr>')(),
			phone = shop.join
			('<tr>')
				('<td class="bold">ĐT di động:</td>')
				('<td><input type="text" id="cart_tel" name="tel" value="'+(shop.cart_pro.conf.user.mobile_phone&&!shop.cart_pro.conf.addbook ? shop.cart_pro.conf.user.mobile_phone : '')+'" maxlength="20" onkeypress="return shop.numberOnly(this, event)" readonly="readonly" disabled="disabled" /></td>')
			('</tr>')(),
			email = shop.join
			('<tr>')
				('<td class="bold">Email:</td>')
				('<td><input type="text" id="cart_email" name="email" value="'+(shop.cart_pro.conf.user.email&&!shop.cart_pro.conf.addbook ? shop.cart_pro.conf.user.email : '')+'" readonly="readonly" disabled="disabled" /></td>')
			('</tr>')(),
			address = shop.join
			('<tr>')
				('<td width="85" class="bold">Địa chỉ:</td>')
				('<td><input type="text" id="cart_address" name="address" style="width:445px" value="'+(shop.cart_pro.conf.user.address&&!shop.cart_pro.conf.addbook ? shop.cart_pro.conf.user.address : '')+'" /></td>')
			('</tr>')(),
			street = shop.join
			('<tr>')
				('<td class="bold">Đường/Phố:</td>')
				('<td><input type="text" id="cart_street" name="street" value="'+(shop.cart_pro.conf.user.street&&!shop.cart_pro.conf.addbook ? shop.cart_pro.conf.user.street : '')+'" /></td>')
			('</tr>')(),
			city = '',
			district = shop.join
			('<tr>')
				('<td class="bold" id="disTitle">Quận/Huyện:</td>')
				('<td><select id="listDistrict" name="district"></select></td>')
			('</tr>')(),
			cityList = '<select name="city" id="cart_city" onchange="shop.district.loadDistrictDropdown(this.value, \'listDistrict\', shop.cart_pro.theme.changeCity, \''+((shop.cart_pro.conf.user.type == 'customer') ? shop.cart_pro.conf.customer.district : shop.cart_pro.conf.user.district)+'\')">';
			
			//make city list
			var opt1 = '', opt2 = '';
			for(var i in city_list){
				if(city_list[i].status == 1){
					opt1 += '<option value="'+city_list[i].id+'"'+(shop.cart_pro.conf.user.city==i&&!shop.cart_pro.conf.addbook?' selected':'')+'>'+city_list[i].title+'</option>';
				}else{
					opt2 += '<option value="'+city_list[i].id+'"'+(shop.cart_pro.conf.user.city==i&&!shop.cart_pro.conf.addbook?' selected':'')+'>'+city_list[i].title+'</option>';
				}
			}
			cityList += shop.join
				('<option value="0">--- Chọn Tỉnh/Thành ---</option>')
				('<optgroup label="Tỉnh/Thành có VP MuaChung">'+opt1+'</optgroup>')
				('<optgroup label="Các Tỉnh/Thành khác">'+opt2+'</optgroup>')
			('</select>')();
			
			city = shop.join
			('<tr>')
				('<td class="bold">Tỉnh/Thành:</td>')
				('<td>'+cityList+'</td>')
			('</tr>')();

			return shop.popupSite(id, title, shop.join
			('<div class="content" style="padding:15px">')
				('<div class="reg_cart_form">')
					('<form name="cartRegisterForm" id="cartRegisterForm">')
						('<div class="cartNewForm">')
							('<div id="cError"></div>')
							('<div class="infoUser">')
								//('<a href="javascript:shop.cAddress.stepAddress(shop.cart)" class="addBookCtrl fr">Lấy trong danh bạ</a>')
								('<div class="text_tit">Thông tin mua hàng của Quý khách:</div>')
								('<div style="padding-left:35px">')
									('<table cellpadding="3" cellspacing="0" border="0">'+fname+phone+email+'</table>')
								('</div>')
							('</div>')
							('<div class="infoAddress mTop20">')
								('<div class="text_tit">Địa chỉ:</div>')
								('<div style="padding-left:35px">')
									('<table cellpadding="3" cellspacing="0" border="0">'+address+street+city+district+'</table>')
								('</div>')
							('</div>')
							('<div class="c"></div>')
						('</div>')
					('</form>')
					('<div class="mTop10">')
						('<a href="javascript:void(0)" onclick="shop.cart_pro.processStepOne()" class="blueButton mLeft10" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>')
						('<div class="c"></div>')
					('</div>')
					('<div class="c"></div>')
				('</div>')
			('</div>')());
		},
		stepTwo:function(id, title){
			var allPrice = '', quantity = '', price = parseInt(shop.cart_pro.conf.cart.cart.price), num = 0, ship_fee = 0, gold_reward = 0, real_ship = shop.cLib.getShipFee(shop.cart);
			//mac dinh so luong = min order 
			if(!shop.is_exists(shop.cart_pro.conf.cart.numberOtp)){
				shop.cart_pro.conf.cart.numberOtp = parseInt(shop.cart_pro.conf.cart.cart.min_order);
			}
			num = shop.cart_pro.conf.cart.numberOtp;
			//quantity theme
			quantity = shop.join
			('<div id="formQuantity" class="jNice">')
				('<div>')
					('<select style="width: 70px" id="quantity" name="select" onchange="shop.cart_pro.theme.price(this.value)">')();
			for(var i = parseInt(shop.cart_pro.conf.cart.cart.min_order);i<=shop.cart_pro.conf.cart.cart.max_order;i++){
				quantity += '<option value="'+i+'"'+(num == i ? ' selected':'')+'>'+i+'</option>';
			}
				quantity += shop.join
					('</select>')
				('</div>')
				('<div class="xprice">')
					('x '+shop.numberFormat(price)+' đ = <span id="numPrice">'+shop.numberFormat(price*num)+' đ</span>')
				('</div>')
				('<div class="c"></div>')
			('</div>')();
			
			var ship_type = '', type = shop.cart_pro.conf.shipping.codShipType,
			is_cod = shop.cart_pro.conf.cart.payment_id == 'cod',
			is_office = shop.cart_pro.conf.cart.payment_id == 'coo',
			is_ship = shop.cart_pro.conf.shipping.active,
			note_title = 'Vui lòng cho chúng tôi biết thời gian nhận hàng trong ngày hoặc Ghi chú thêm...';

			ship_type+= shop.join
			('<div class="mTop10">')
				('<div class="fl mRight5"><input type="radio" name="radio_ship" class="radio_ship" id="ship_coupon" value="coupon" checked /></div>')
				('<div class="fl rightInfo" id="coupon" style="cursor:pointer">')
					('<div class="txt_tit" id="coupon">Nhận mã số dự thưởng qua Email <span class="cGreen">(Miễn phí)</span></div>')
					('<div class="paymentText">Quý khách sẽ nhận được mã số dự thưởng qua Email ngay sau khi quý khách thanh toán thành công.<br />Quý khách dùng mã số này để tham dự trương trình may mắn trên MuaChung.</div>')
					('<div class="shipGuide shipGuideActive">')('</div>')
				('</div>')
				('<div class="c"></div>')
			('</div>')();

			if(ship_type != ''){
				ship_type = shop.join
				('<div class="infoCart mTop10">')
					('<div class="text_tit">Hình thức tham gia:</div>')
					('<div class="infoShipType">'+ship_type+'</div>')
				('</div>')();
			}

			return shop.popupSite(id, title, shop.join
			('<div class="content buy_cart_form" style="padding:0">')
				('<form name="cartBuyForm" id="cartBuyForm">')
					('<div class="infoNumber">')
						('<div class="text_tit">Số lượng Quý khách cần mua:</div>')
						('<div style="padding-left:43px">'+quantity+'</div>')
					('</div>'+ship_type)
					('<div class="infoTotal mTop10"><div class="text_tit">')
						('Tổng số tiền Quý khách phải thanh toán: ')
						('<span id="bgAllPrice">'+shop.numberFormat(num*(price+ship_fee))+' đ</span>')
					('</div></div>')
				('</form>')
				('<div style="padding:50px 20px 10px">')
					('<a href="javascript:void(0)" onclick="shop.cart_pro.processStepTwo()" class="blueButton mLeft10" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>')
					('<a href="javascript:void(0)" onclick="shop.cart_pro.stepOne()" class="blueButton" id="fr"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
					('<div class="c"></div>')
				('</div>')
				('<div class="c"></div>')
			('</div>')());
		},
		confirmProduct:function(id, title){
			var data = shop.cart_pro.conf.cart.cart, note = '', t = '', logo = '', bt_checkout = 'ĐẶT HÀNG', moreGold = '', suggest = '',
			address = '<a href="javascript:void(0)" onclick="shop.cart_pro.stepOne()" class="blueButton" id="fr"><span><span>SỬA THÔNG TIN CÁ NHÂN</span></span></a>',
			free = (shop.cart_pro.conf.cart.cart.free_item > 0 && ((shop.cart_pro.conf.cart.numberOtp - shop.cart_pro.conf.cart.cart.free_item) >= 1)) ? shop.join
			('<tr>')
				('<td valign="top" align="center" class="item bRight">2</td>')
				('<td valign="top" class="item bRight">'+data.title+'</td>')
				('<td valign="top" align="center" class="item bRight">'+data.code+'</td>')
				('<td valign="top" align="right" class="item bRight">Miễn phí</td>')
				('<td valign="top" align="center" class="item bRight">'+shop.cart_pro.conf.cart.cart.free_item+'</td>')
				('<td valign="top" align="right" class="item">Miễn phí</td>')
			('</tr>')() : '',
			num = (free != '') ? (shop.cart_pro.conf.cart.numberOtp - shop.cart_pro.conf.cart.cart.free_item) : shop.cart_pro.conf.cart.numberOtp,
			total = num*data.price,
			total_fix = total - total/100;

			if(shop.cart_pro.conf.customer.gold < total_fix){
				moreGold = total_fix - shop.cart_pro.conf.customer.gold;
				moreGold = shop.numberFormat(moreGold, 0, '', '.');
				moreGold = 'Quý khách phải nạp thêm: <b style="color:red">'+moreGold+'</b> đ';
				suggest = 'nap them';
				bt_checkout = '';
			}else{
				moreGold = shop.cart_pro.conf.customer.gold-total;
				moreGold = shop.numberFormat(moreGold, 0, '', '.');
				moreGold = 'Sau khi thanh toán Quý khách còn: <b style="color:red">'+moreGold+'</b> đ';
				bt_checkout = 'THANH TOÁN';
			}
			t = "Thanh toán bằng Ví MuaChung";
			note = shop.join
			('<div class="mLeft25" style="width:720px">')
				('<div>- Hiện tại của Quý khách đang có: <b>'+shop.numberFormat(shop.cart_pro.conf.customer.gold, 0, '', '.')+'</b> đ</div>')
				('<div class="mTop5">- Đơn hàng này có giá trị tương ứng với: <b>'+shop.numberFormat(total, 0, '', '.')+'</b> đ</div>')
				('<div class="mTop5 mBottom10">- '+moreGold+'</div>'+(suggest != '' ? '<a href="javascript:void(0)" onclick="shop.gold.rechargeStep1()" id="fl" class="blueButton"><span><span>NẠP TIỀN</span></span></a><div class="c"></div>' : ''))
			('</div>')();

			return shop.popupSite(id, title, shop.join
			('<div class="content" style="padding:10px 20px">')
				('<div class="box-gradien pBottom10 pTop15" style="*width:713px">')
					('<div class="title">Thông tin khách hàng</div>')
					('<div class="content" id="pTop10">')
						('<div><strong>Họ tên:</strong> <span class="cff9200">'+shop.cart_pro.conf.user.fullname+'</span></div>')
						('<div class="mTop5"><strong>Email:</strong> <span class="cff9200">'+shop.cart_pro.conf.user.email+'</span></div>')
						('<div class="mTop5"><strong>Điện thoại di động:</strong> <span class="cff9200">'+shop.cart_pro.conf.user.mobile_phone+'</span></div>')
						(address+'<div class="c"></div>')
					('</div>')
				('</div>')
				('<div class="box-gradien pBottom10 pTop15 mTop10">')
					('<div class="title">Hình thức thanh toán: <span style="font-size:12px;font-weight:normal;text-transform:none">'+t+'</span></div>')
					('<div class="content">')
						('<div class="fl">'+logo+'</div>')
						('<div class="fl">'+note+'</div>')
						('<div class="c"></div>')
					('</div>')
				('</div>')
				('<div class="box-gradien mTop10" id="box-gradien2">')
					('<div class="title mTop10 mLeft10">Thông tin sản phẩm</div>')
					('<div class="content" id="pTop5">')
						('<table class="cart-finish" cellpadding="0" cellspacing="0" width="100%" border="0">')
						('<thead><tr>')
							('<th class="head bRight" width="25">STT</th>')
							('<th class="head bRight">Sản phẩm</th>')
							('<th class="head bRight" width="70">Đơn vị</th>')
							('<th class="head bRight" width="80">Đơn Giá</th>')
							('<th class="head bRight" width="25">SL</th>')
							('<th class="head" width="80">Thành Tiền</th>')
						('</tr></thead>')
						('<tr>')
							('<td valign="top" align="center" class="item bRight">1</td>')
							('<td valign="top" class="item bRight">'+data.title+'</td>')
							('<td valign="top" align="center" class="item bRight">'+data.code+'</td>')
							('<td valign="top" align="right" class="item bRight">'+(total > 0 ? data.price_f : 'Miễn phí')+'</td>')
							('<td valign="top" align="center" class="item bRight">'+num+'</td>')
							('<td valign="top" align="right" class="item">'+(total > 0 ? (shop.numberFormat(total)+' đ') : 'Miễn phí')+'</td>')
						('</tr>')
						(free+'<tr>')
							('<td align="right" class="item total-all" colspan="6">Tổng tiền = <span id="total-all">'+(shop.numberFormat(total)+' đ')+'</span></td>')
						('</tr></table>')
					('</div>')
				('</div>')
				('<div align="center" class="mTop10">'+(bt_checkout != '' ? '<a href="javascript:void(0)" onclick="shop.cart_pro.processStepThree()" class="blueButton  mLeft10" id="fr"><span><span>'+bt_checkout+'</span></span></a>' : ''))
					('<a href="javascript:void(0)" onclick="shop.cart_pro.stepTwo()" id="fr" class="blueButton"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
					('<div class="c"></div>')
				('</div>')
			('</div>')());
		},
		finish:function(id, title){
			return shop.popupSite(id, title, shop.join
			('<div class="content" style="padding:15px 20px 25px;font-size:18px" align="center">')
				('<b>Hệ thống đang cập nhật đơn hàng... </b><br /><br />')
				('Quý khách vui lòng <b style="color:red">không tắt trình duyệt</b>')
			('</div>')());
		},
		paymentViSa:function(){
			return shop.join
			('<form id="checkoutSoHa" method="post" action="'+shop.cart_pro.conf.cart.url+'">')
				('<input type="hidden" value="'+shop.cart_pro.conf.cart.quantity+'" name="quantity" />')
				('<input type="hidden" value="'+shop.cart_pro.conf.cart.order_id+'" name="id" />')
				('<input type="hidden" value="'+shop.cart_pro.conf.cart.total+'" name="total" />')
				('<input type="hidden" value="'+shop.cart_pro.conf.cart.good_name+'" name="good" />')
				('<input type="hidden" value="'+shop.cart_pro.conf.cart.item_ids+'" name="item_ids" />')
				('<input type="hidden" value="'+shop.cart_pro.conf.user.fullname+'" name="fullname" />')
				('<input type="hidden" value="'+shop.cart_pro.conf.user.mobile_phone+'" maxlength="50" name="mobiphone" />')
				('<input type="hidden" value="'+shop.cart_pro.conf.user.email+'" maxlength="50" name="email" />')
				('<input type="hidden" value="'+shop.cart_pro.conf.user.id+'" maxlength="50" name="uid" />')
			('</form>')();
		},
		newPrice:function(obj){
			var checked = false, price = parseInt(shop.cart_pro.conf.cart.cart.price);
			if(obj && obj.checked == true){
				shop.cart_pro.conf.cart.priceAndShip = shop.cart_pro.conf.cart.numberOtp*(price+parseInt(shop.cart_pro.conf.cart.cart.fee_shipping));
				checked = true;
			}
			if(checked == false){
				shop.cart_pro.conf.cart.priceAndShip = shop.cart_pro.conf.cart.numberOtp*price;
			}
			if(shop.cart_pro.conf.cart.payment_id == 'cod'){
				shop.cart_pro.conf.shipping.codShipType = checked ? 'product' : 'card';
			}
			shop.cart_pro.conf.shipping.check = checked;
			jQuery('#bgAllPrice').html(shop.numberFormat(shop.cart_pro.conf.cart.priceAndShip)+' đ');
		},
		price:function(number){
			shop.cart_pro.conf.cart.numberOtp = number;
			var limit = 1, price = parseInt(shop.cart_pro.conf.cart.cart.price);
			
			//doi gia tien
			if(shop.cart_pro.conf.shipping.fee > 0){
				jQuery('#feePrice').html(shop.numberFormat(number*shop.cart_pro.conf.shipping.fee)+' đ');
			}
			jQuery('#numPrice').html(shop.numberFormat(number*price)+" đ");
			shop.cart_pro.theme.newPrice(document.getElementById('shipping-check'));
		}
	}
};