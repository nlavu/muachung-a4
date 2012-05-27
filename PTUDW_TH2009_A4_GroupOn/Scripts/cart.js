shop.cart = {
//	--------------------------------- config -------------------------------- //
	conf:{
		extra:{},
		user:{fullname:'',email:'',mobile_phone:'',type:'guest',address:'',city:0,district:'',note:''},
		customer:{},
		userInfo:1,
		userAddress:1,
		cart:null,
		card:[50000,100000,200000,300000,500000],
		card_rate: 9/10,
		shipping:{active:false, COD:false, fee:0, fee_f:'0 đ', note:'', check: false, code:'SHIP', codShipType:'', office: '', in_area: 1, more_fee: 20000},
		addbook: false,
		office: null,
		office_id: 0,
		gold_only: false,
		no_cod: false,
		province_active:{},
		error_city: false
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
			if(shop.cLib.isMultiPrice(id, shop.cart)){
				shop.cart.showExtra(id, shop.cart.conf.extra[id]);
			}else{
				shop.cart.doAddItem(id, type);
			}
		}
	},
	doAddItem:function(id, type, idx){
		shop.cLib.guest.restore(shop.cart);
		shop.ajax_popup("act=cart&code=order",'POST',{id: id, number: 1, extra: idx},
		function(json){
			if(json.err == 0){
				//tinh toan shipping
				var office = json.order.cart.cod_office;
				shop.cart.conf.shipping.fee = parseInt(json.order.cart.fee_shipping);
				shop.cart.conf.shipping.fee_f = json.order.cart.fee_shipping_f;
				shop.cart.conf.shipping.note = json.order.cart.note;
				shop.cart.conf.shipping.office = office.split(',');
				shop.cart.conf.shipping.active = (shop.cart.conf.shipping.fee >= 0) && (shop.cart.conf.shipping.note != '');
				
				//gold only
				shop.cart.conf.gold_only = (json.order.cart.is_gold == 1);
				
				//no cod
				shop.cart.conf.no_cod = (json.order.cart.no_cod == 1);
				
				//gan lai bien
				shop.cart.conf.cart = json.order;
				
				//thong tin van phong
				shop.cart.conf.office = json.office;
				
				//cap nhat lai thong tin nguoi mua hang
				shop.cLib.guest.update(json.user, shop.cart);
				if(json.user.type == 'customer'){
					shop.cart.conf.customer = json.user;
					shop.cart.conf.customer.gold = parseInt(shop.cart.conf.customer.gold);
					shop.cart.conf.card_rate = json.card_rate;
				}
				if((type == 'visa') ||
				   (type == 'atmOnline') ||
				   (type == 'cod') ||
				   (type == 'coo') ||
				   (type == 'mcard' && shop.cLib.isGOLD(shop.cart))
				){
					shop.cart.conf.cart.payment_id = type;
				}
				shop.cart.stepZero();
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
				}
			}
		});
	},

//	--------------------------------- showing popup -------------------------------- //

	showExtra:function(id, extra){
		shop.show_overlay_popup('cart-extra','Chọn mua',
		shop.cart.theme.extra('cart-extra','Chọn mua',extra,id),
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
				'width'   : '650px',
				'font-size': '12px'
			}
		});
	},
	stepZero:function(){
		shop.show_overlay_popup('cart-regulations','Chọn hình thức thanh toán',
		shop.cart.theme.stepZero('cart-regulations','Chọn hình thức thanh toán'),
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
				'width'   : '710px',
				'height'  : '900px',
				'font-size': '12px'
			},
			release: function(){
				jQuery('.paymentChooseType').click(function(){shop.cTheme.choosePayment(this, shop.cart)})
				.hover(
					function(){
						if(!jQuery(this).hasClass(this.id+'NoActive')){
							jQuery('.pay_active').removeClass('pay_active');
							jQuery(this).addClass('pay_active');
							jQuery('.clicked').addClass('pay_active');
						}
					},
					function(){
						if(!jQuery(this).hasClass(this.id+'NoActive')){
							jQuery('.pay_active').removeClass('pay_active');
							jQuery('.clicked').addClass('pay_active');
						}
					}
				);
			}
		});
	},
	stepOne:function(add){
		if(add){
			shop.cart.conf.addbook = true;
		}
		var tpl = shop.cart.theme.stepOne('cart-check-out-step1', 'Nhập thông tin cá nhân');
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
					if(!shop.cart.conf.addbook){
						shop.district.loadDistrictDropdown(shop.cart.conf.user.city, 'listDistrict', function(def){
							if(shop.is_exists(shop.district.listDistrictDropdown[def]) && shop.is_exists(shop.district.listDistrictDropdown[def].in_area)){
								shop.cart.conf.shipping.in_area = shop.district.listDistrictDropdown[def].in_area;
							}
						}, shop.cart.conf.user.district);
					}
				}
			});
		}
	},
	stepTwo:function(district_id, city_id){
		//valid lai truong text tranh undefined
		if(shop.cart.conf.user.address == '' || shop.cart.conf.user.address == null || shop.cart.conf.user.address == 'undefined' || shop.cart.conf.user.address == undefined ||
		   shop.cart.conf.user.street == '' || shop.cart.conf.user.street == null || shop.cart.conf.user.street == 'undefined' || shop.cart.conf.user.street == undefined)
		{
			if(district > 0){
				alert('Thông tin địa chỉ chưa chính xác! Quý khách vui lòng nhập lại');
				return;
			}
		}
		if(district_id > 0){
			//Neu chon nhan hang tai van phong thi phai kiem tra xem tinh thanh co ho tro khong
			if(shop.cart.conf.cart.payment_id == 'coo'){
				var district = district_id;
				for(var i in shop.cart.conf.shipping.office){
					if(shop.cart.conf.shipping.office[i] == district){
						district = 0; break;
					}
				}
				if(district > 0){
					alert('Quận/Huyện Quý khách đã chọn không hỗ trợ hình thức nhận hàng tại Văn Phòng');
					return;
				}
			}
			
			//Neu chon nhan hang tai nha thi phai chon dung tinh thanh
			var dealCity = shop.cLib.getCity(true, shop.cart.conf.cart.cart.province_id);
			if(shop.cart.conf.cart.payment_id == 'cod' && dealCity != city_id){
				alert('Sản phẩm này không áp dụng thu tiền tận nơi tại địa chỉ của Quý khách.\nVui lòng chọn hình thức thanh toán khác.');
				return;
			}

			//tinh lai noi vung, ngoai vung
			if(!shop.is_exists(shop.district.listDistrictDropdown[district_id])){
				shop.district.loadDistrict(city_id,function(){
					shop.cart.conf.shipping.in_area = shop.district.listDistrictDropdown[district_id].in_area;
					shop.cart.stepTwo();
				});
				return;
			}else{
				shop.cart.conf.shipping.in_area = shop.district.listDistrictDropdown[district_id].in_area;
			}
		}
		//check neu san pham chi chap nhan coupon thi ko cho COD ngoai vung
		if(!shop.cart.conf.shipping.active && shop.cart.conf.cart.payment_id == 'cod' && shop.cart.conf.shipping.in_area == 0){
			alert("Quận/Huyện Quý khách đang ở không hỗ trợ hình thức giao phiếu tận nơi");
			return;
		}
		
		shop.cart.conf.error_city = false;
		if(shop.cart.conf.cart.cart.disable_province.length > 0 && shop.cart.conf.user.city > 0){
			for(var i=0;i<shop.cart.conf.cart.cart.disable_province.length;i++){
				if(shop.cart.conf.user.city == shop.cart.conf.cart.cart.disable_province[i]){
					var province_notice = '';
					for(var i in shop.cart.conf.province_active){
						if(province_notice != ''){
							province_notice += ', ';
						}
						province_notice += shop.cart.conf.province_active[i];
					}
					if(province_notice != ''){
						var confirm_msg = shop.join
						('Quý khách đã chọn: '+city_list[shop.cart.conf.user.city].title)
						('\nDeal này chỉ áp dụng cho: '+province_notice)();
						if(shop.cart.conf.cart.payment_id == 'coo'){
							confirm_msg += '\nDo đó MuaChung không hỗ trợ hình thức Nhận hàng tại văn phòng';
							alert(confirm_msg);return;
						}else if(shop.cart.conf.cart.payment_id == 'cod'){
							confirm_msg += '\nDo đó MuaChung không hỗ trợ hình thức Thu tiền tận nơi';
							alert(confirm_msg);return;
						}else{
							confirm_msg += shop.join
							('\nDo đó đơn hàng của Quý khách có thể không hợp lệ & MuaChung có thể hủy hóa đơn hoặc hoàn tiền')
							('\nQuý khách vẫn quyết định tiếp tục mua hàng?')
							();
						}
						if(confirm(confirm_msg)){
							shop.cart.conf.error_city = true;
							//ko lam j vi khach da chap nhan rui ro
						}else{
							shop.hide_overlay_popup('cart-check-out-step1');
							return;
						}
					}
					break;
				}
			}
		}

		var tpl = shop.cart.theme.stepTwo('cart-check-out-step2', 'Mua hàng');
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
					if(shop.cart.conf.cart.payment_id != 'coo'){
						jQuery('.radio_ship').click(function(){shop.cart.theme.newPrice(this.value, true)});
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
						if(shop.cart.conf.cart.payment_id != 'coo'){
							shop.cart.theme.newPrice(this.id, false)
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
		shop.cart.theme.stepThree('cart-confirm','Thanh Toán'),
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
		shop.cTheme.finish('cart-step-finish','Cám ơn Quý khách đã mua hàng'),
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

	processExtra:function(id, idx){
		if(shop.cLib.isMultiPrice(id, shop.cart)){
			shop.cart.doAddItem(id, '', idx);
		}
	},
	processStepZero:function(){
		if(!jQuery('.paymentChooseType').hasClass('clicked')){
			alert('Quý khách chưa chọn hình thức thanh toán');
			return;
		}
		shop.cart.conf.cart.payment_id = jQuery('.clicked').attr('id');
		if(shop.cart.conf.cart.payment_id=='visa' || shop.cart.conf.cart.payment_id=='atmOnline'){
			shop.cart.conf.cart.payment = 1;
		}else if(shop.cart.conf.cart.payment_id=='mcard'){
			shop.cart.conf.cart.payment = 2;
			if(shop.cart.conf.customer.active == 0){
				alert('Quý khách vui lòng kích hoạt Email trước khi chọn mua hàng bằng Ví MuaChung');
				shop.hide_overlay_popup('cart-regulations');
				shop.customer.register.sendActiveEmail(shop.cart.conf.customer.email, 1);
				return;
			}
		}else{
			shop.cart.conf.cart.payment = 0;
			if((shop.cart.conf.cart.payment_id=='cod' || shop.cart.conf.cart.payment_id=='coo')  && (shop.cart.conf.customer.active == 0 || shop.cart.conf.customer.active_phone == 0)){
				shop.hide_overlay_popup('cart-regulations');
				shop.cTheme.showActivePhoneWarning(shop.cart.conf.customer.active, shop.cart.conf.customer.active_phone, shop.cart);
				return;
			}
			if(shop.cart.conf.cart.payment_id=='coo'){
				shop.cart.conf.shipping.codShipType = 'office';
				shop.cart.conf.shipping.check = false;
			}
		}
		
		shop.cart.stepOne();
	},
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
		shop.cart.conf.user.email = email;
		shop.cart.conf.user.fullname = fname;
		shop.cart.conf.user.mobile_phone = tel;
		shop.cart.conf.user.address = address;
		shop.cart.conf.user.street = street;
		shop.cart.conf.user.city = city;
		shop.cart.conf.user.district_id = district;
		shop.cart.conf.user.district = frm.district.options[frm.district.selectedIndex].innerHTML;
		shop.cLib.guest.save(shop.cart.conf.user, shop.cart);
		
		//Neu chon nhan hang tai nha thi phai chon dung tinh thanh
		var dealCity = shop.cLib.getCity(true, shop.cart.conf.cart.cart.province_id);
		if(shop.cart.conf.cart.payment_id == 'cod' && dealCity != city){
			alert('Sản phẩm này không áp dụng thu tiền tận nơi tại địa chỉ của Quý khách.\nVui lòng chọn hình thức thanh toán khác.');
			return;
		}
		
		//tinh lai noi vung, ngoai vung
		if(shop.is_exists(shop.district.listDistrictDropdown[district].in_area)){
			shop.cart.conf.shipping.in_area = shop.district.listDistrictDropdown[district].in_area;
			/*if(dealCity != city){
				shop.cart.conf.shipping.in_area = 0;
			}*/
		}
		
		//Neu chon nhan hang tai van phong thi phai kiem tra xem tinh thanh co ho tro khong
		if(shop.cart.conf.cart.payment_id == 'coo'){
			for(var i in shop.cart.conf.shipping.office){
				if(shop.cart.conf.shipping.office[i] == district){
					district = 0; break;
				}
			}
			if(district > 0){
				alert('Quận/Huyện Quý khách đã chọn không hỗ trợ hình thức nhận hàng tại Văn Phòng');
				return;
			}
		}

		//go to next step
		if(shop.cart.conf.addbook){
			shop.ajax_popup('act=cart&code=addbook',"POST",shop.cart.conf.user,
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
				shop.cart.conf.addbook = false;
				shop.cart.stepTwo();
			});
		}else{
			shop.cart.stepTwo();
		}
	},
	processStepTwo:function(){
		var is_cod = shop.cart.conf.cart.payment_id == 'cod',
		is_office = shop.cart.conf.cart.payment_id == 'coo',
		number_buy = 0,
		note = '';
		if(is_office){
			shop.cart.conf.office_id = 0;
			jQuery('.radio_ship').each(function(){
				if(this.checked && shop.cart.conf.office_id == 0){
					shop.cart.conf.office_id = this.value;
				}
			});
			if(shop.cart.conf.office_id <= 0){
				alert('Quý khách vui lòng chọn địa điểm văn phòng đến nhận hàng');return;
			}
			office = shop.cLib.getOffice(shop.cart.conf.office_id, shop.cart)
			if(!office){
				alert('Quý khách vui lòng chọn địa điểm văn phòng đến nhận hàng');return;
			}
		}else if(shop.cart.conf.shipping.active || is_cod){
			var obj = null, ward = null, delta = 100, checked = false;
			jQuery('.radio_ship').each(function(){
				if(!checked && this.checked){
					checked = true;
				}
			});
			if(!checked){
				alert('Quý khách chưa chọn hình thức nhận hàng');return;
			}
			if(shop.cart.conf.shipping.codShipType == 'product'){
				obj = jQuery('#cart_note');
				ward = jQuery('#cart_ward');
			}else if(shop.cart.conf.shipping.codShipType == 'coupon'){
				obj = jQuery('#cart_note2');
				ward = jQuery('#cart_ward2');
			}
			if(shop.cart.conf.user.city == 29){ //neu thanh pho HCM thi bat nhap Phuong/Xa
				var ward_info = shop.util_trim(ward.val());
				if(ward_info == '' || ward_info == 'undefined' || ward_info == undefined || ward_info == null){
					alert('Cám ơn Quý khách đã sử dụng dịch vụ của MuaChung\nQuý khách vui lòng nhập thông tin Phường/Xã để MuaChung dễ dàng chuyển hàng/phiếu đến tay Quý khách nhanh nhất');
					ward.focus();
					ward.select();
					return;
				}
				//luu lai phuong/xa
				shop.cart.conf.user.ward = ward_info;
				shop.cLib.guest.save({ward: ward_info}, shop.cart);
			}
			if(obj){
				note = shop.util_trim(obj.val());
				if(note.match(/[<>]/i) != null){
					alert('Kí tự "<" & ">" không hợp lệ, vui lòng nhập lại');
					obj.focus();
					obj.select();
					return;
				}
				//luu lai ghi chu
				shop.cart.conf.user.note = note;
				shop.cLib.guest.save({note: note}, shop.cart);
			}
			//kiem tra neu la thanh pho HCM thi cho mua deal o Ha Noi nhung ko ho tro chuyen hang
			if(shop.cart.conf.shipping.codShipType == 'product'){
				var deal_city = shop.cart.conf.cart.cart.province_id;
				if(deal_city > 0 && deal_city != shop.cart.conf.user.city){
					alert('Quý khách đã chọn địa chỉ tại '+city_list[shop.cart.conf.user.city].title+'.\nVới deal này, MuaChung chỉ hỗ trợ chuyển hàng tại '+city_list[deal_city].title+'.\nXin Quý khách vui lòng xem lại chi tiết Deal');return;
				}
			}
		}
		//check so luong neu gan het san pham
		number_buy = parseInt(shop.cart.conf.cart.cart.buyer) + shop.cart.conf.cart.numberOtp;
		if(number_buy + delta >= shop.cart.conf.cart.cart.buyer_need){
			shop.ajax_popup('act=cart&code=register',"POST",{
				quantity: shop.cart.conf.cart.numberOtp,
				item_id: shop.cart.conf.cart.cart.id
			},
			function (j) {
				if (j.err != 0) {
					switch(j.msg){
						case 'invalid_min':
							j.msg = 'Bạn phải mua tối thiểu '+shop.cart.conf.cart.cart.min_order+' sản phẩm';
						break;
						case 'invalid_quantity':
							j.msg = 'Sản phẩm đã bán hết';
							if(j.quantity > 0){
								j.msg = 'Chỉ còn '+j.quantity+' sản phẩm';
							}
						break;
					}
					alert(j.msg);return;
				}else{
					shop.cart.stepThree();
				}
			});
		}else{
			shop.cart.stepThree();
		}
	},
	processStepThree:function(){
		if(shop.cart.conf.user.type == 'guest' && !shop.get_ele('check-regulations').checked){
			alert('Quý khách chưa tích vào mục đã đọc và đồng ý các điều khoản và quy định của MuaChung.vn');
			return;
		}
		var post, card = shop.cart.conf.cart.payment, note =  '',		 
		city = shop.cart.conf.user.city,
		district = shop.cart.conf.user.district,
		address = shop.cart.conf.user.address,
		street = shop.cart.conf.user.street,
		ward = city == 29 ? shop.cart.conf.user.ward : '',
		g_note = shop.cart.conf.user.note,
		ship_fee = shop.cLib.getShipFee(shop.cart);
		
		if(city == 0 || district == '' || address == ''){
			alert('Vui lòng kiểm tra lại thông tin giao hàng.\nHiện tại đang thiếu thông tin: '+(address==''?' Địa chỉ.':'')+(district==''?' Quận/Huyện/Phường.':'')+(city<=0?' Tỉnh/Thành phố.':''));
			return;
		}

		if(shop.cart.conf.cart.payment_id == 'cod'){
			note = 'Ch%E1%BB%8Dn+h%C3%ACnh+th%E1%BB%A9c+chuy%E1%BB%83n+';
			if(shop.cart.conf.shipping.codShipType != 'coupon'){
				note += 's%E1%BA%A3n+ph%E1%BA%A9m';
			}else{
				note += 'th%E1%BA%BB+c%C3%A0o';
			}
		}else if(shop.cart.conf.cart.payment_id == 'coo'){
			var office = shop.cLib.getOffice(shop.cart.conf.office_id, shop.cart);
			g_note = office.name+' - ĐC: '+office.address+' - ĐT: '+office.tel;
			note = 'Ch%E1%BB%8Dn+h%C3%ACnh+th%E1%BB%A9c+chuy%E1%BB%83n+';
		}

		post = {
			fullname: shop.cart.conf.user.fullname,
			tel: shop.cart.conf.user.mobile_phone,
			email: shop.cart.conf.user.email,
			item_id: shop.cart.conf.cart.cart.id,
			paymentType: card,
			adminNote:note,
			quantity:shop.cart.conf.cart.numberOtp,
			city: city,
			district: district,
			address: address,
			street: street,
			ward: ward,
			note: g_note,
			shipping: shop.cart.conf.shipping.check ? ship_fee : -1,
			ship_active: (shop.cart.conf.shipping.active || shop.cart.conf.shipping.COD) ? 1 : 0,
			ship_code: shop.cart.conf.shipping.code,
			codShipType: shop.cart.conf.shipping.codShipType,
			office_id: shop.cart.conf.office_id
		};
		//submit
		shop.cart.finishSubmit(post);
	},
	finishSubmit:function(post){
		shop.ajax_popup('act=cart&code=finish',"POST",post,
		function(j){
			if(j.err == 0)	{
				if(j.soha_gold == 1){
					post.paymentType = 1;
				}
				switch(post.paymentType){
					case 0:
						shop.cart.stepFinish();
						shop.redirect(j.url);
						break;
					case 1:
						shop.cart.conf.cart = j;
						jQuery('body').append(shop.cart.theme.paymentViSa());
						jQuery('#checkoutSoHa').submit();
						break;
					case 2:
						if(shop.is_exists(j.more_gold)){
							shop.cart.conf.card_post = post;
							shop.cart.conf.customer.gold = j.gold;
							shop.cart.conf.customer.more_gold = j.more_gold;
							shop.cart.conf.cart.total = j.total;
						}else{
							shop.cart.stepFinish();
							shop.redirect(j.url);
						}
						break;
				}
			}else{
				switch(j.msg){
					case 'invalid_quantity':
						j.msg = 'Sản phẩm đã bán hết';
						if(j.quantity > 0){
							j.msg = 'Chỉ còn '+j.quantity+' sản phẩm';
						}
					break;
					case 'invalid_info': j.msg = 'Thông tin không hợp lệ! Quý khách vui lòng kiểm tra lại các thông tin Họ tên, Email, Số điện thoại'; break;
					case 'invalid_min': j.msg = 'Quý khách phải mua tối thiểu '+shop.cart.conf.cart.cart.min_order+' sản phẩm'; break;
					case 'invalid_max': j.msg = 'Quý khách chỉ được mua tối đa '+shop.cart.conf.cart.cart.max_order+' sản phẩm'; break;
					case 'active_phone':case 'active_email':
						shop.hide_overlay_popup('cart-confirm');
						if(shop.cart.conf.cart.payment_id == 'cod'){
							var email = (j.msg == 'active_email' ? 0 : 1),
							phone = (j.msg == 'active_phone' ? 0 : 1);
							shop.cTheme.showActivePhoneWarning(email, phone, shop.cart);
						}else if(j.msg == 'active_email' && shop.cart.conf.cart.payment_id == 'mcard'){
							alert('Quý khách vui lòng kích hoạt Email trước khi chọn mua hàng bằng Ví MuaChung');
							shop.customer.register.sendActiveEmail(shop.cart.conf.customer.email, 1);
						}
					break;
					case 'cus_not_found': j.msg = 'Hiện tại Quý khách đang không đăng nhập.<br />Vui lòng tắt cửa sổ, mua lại'; break;
				}
				shop.show_popup_message(j.msg,'Thông báo lỗi',-1);
			}
		});
	},

//	--------------------------------- cart theme -------------------------------- //

	theme:{
		extra:function(id, title, extra, item_id){
			if(extra){
				var extra_html = '';
				for(var i=0;i<extra.length;i++){
					extra_html += shop.join
					('<div class="'+(i%2==0?'bgBuyPop':'bgBuyPopOdd')+'">')
						('<div class="contentBuyPop fl">')
							('<div class="newTitle">'+extra[i].price_title+'</div>')
							('<div class="detailBuyPop">Giá gốc <b>'+shop.numberFormat(extra[i].price, 0, '', '.')+'đ</b> - Giảm <strong>'+shop.numberFormat(extra[i].price_promotion, 0, '', '.')+'%</strong> - Tiết kiệm <strong>'+shop.numberFormat(extra[i].price_save_money, 0, '', '.')+'đ</strong></div>')
						('</div>')
						('<div class="fr">')
							('<a href="javascript:void(0)" class="buyPopBlock" onclick="shop.cart.processExtra('+item_id+','+i+')"><span><span>Giá <b>'+shop.numberFormat(extra[i].price_save, 0, '', '.')+'đ</b></span></span></a>')
							('<div class="c"></div>')
						('</div>')
						('<div class="c"></div>')
					('</div>')();
				}
				return shop.popupSite(id, title, '<div class="content" style="padding:20px">'+extra_html+'</div>');
			}
			return '';
		},
		stepZero:function(id, title){
			var gold_only = shop.cart.conf.gold_only,
			no_cod = shop.cart.conf.no_cod,
			type = shop.is_exists(shop.cart.conf.cart.payment_id)?shop.cart.conf.cart.payment_id:'',
			item_id = shop.cart.conf.cart.cart.id,
			notActive = '<div class="notActive"></div>',
			gold_reward = parseInt(shop.cart.conf.cart.cart.price)/100,
			gold_f = shop.numberFormat(gold_reward , 0, '', '.'),
			title_gold = '<span>(Được tặng '+gold_f+' đ/'+shop.cart.conf.cart.cart.unit+' vào Ví MuaChung)</span>',
			visaCard = shop.join
			('<div class="paymentChooseType amtOnline'+(type=='visa'?' pay_active clicked':'')+(gold_only?' visaNoActive':'')+'" id="visa">')
				('<div class="arrowRight">')
					('<div class="radioBox"><input type="radio" name="radio_pay" id="radio_visa" value="visa" '+(type=='visa'?'checked':'')+' /></div>')
					('<div class="paymentContent">')
						('<div class="paymentTitle">Qua thẻ hoặc Tài khoản ngân hàng '+title_gold+'</div>')
						('<div class="paymentText">Thanh toán nhanh gọn và có thể mua hàng hoặc sử dụng ngay dịch vụ sau khi thanh toán.</div>')
						('<div class="creditPay bankPay">')
							('<span id="visa"></span>')
							('<span id="master"></span>')
							('<a class="fl" href="javascript:void(0)"><span id="vcb"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="donga"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="techcom"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="vietin"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="vib"></span></a>')
							('<div class="c"></div>')
							('<div class="mTop10">')
								('<a class="fl" href="javascript:void(0)"><span id="hd"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="tp"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="shb"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="exim"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="mari"></span></a>')
								('<div class="c"></div>')
							('</div>')
							('<div class="mTop10">')
								('<a class="fl" href="javascript:void(0)"><span id="vieta"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="mb"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="nama"></span></a>')
								('<div class="c"></div>')
							('</div>')
						('</div>')
					('</div>')
					('<div class="c"></div>')
					('<ul class="paymentText paymentGuide'+(type=='visa' ? '' : ' hidden')+'">')
						('<li>Không mất phí thanh toán</li>')
						('<li>Thẻ của Quý khách phải được kích hoạt chức năng thanh toán trực tuyến hoặc đã đăng ký Internet Banking</li>')
						('<li>Thanh toán nhanh gọn và có thể sử dụng dịch vụ ngay sau khi thanh toán.</li>')
					('</ul>')
				('</div>')
			('</div>')(),
			mcard = shop.join
			('<div class="paymentChooseType sendGold'+(type=='mcard'?' pay_active clicked':'')+'" id="mcard">')
				('<div class="arrowRight">')
					('<div class="radioBox"><input type="radio" name="radio_pay" id="radio_mcard" value="mcard" '+(type=='mcard'?'checked':'')+' /></div>')
					('<div class="paymentContent">')
						('<div class="paymentTitle">Thanh toán bằng Ví MuaChung '+title_gold+'</div>')
						('<div class="paymentText">Dùng tiền có trong Ví MuaChung để thanh toán. Quý khách có thể <a onclick="shop.gold.rechargeStep1(false,false,true)" href="javascript:void(0)">nạp vào Ví</a> để mua hàng được nhanh chóng và dễ dàng hơn.</div>')
					('</div>')
					('<div class="c"></div>')
					('<ul class="paymentText paymentGuide'+((type=='mcard'&&shop.cLib.isGOLD(shop.cart)) ? '' : ' hidden')+'">')
						('<li>Tiền trong Ví MuaChung có được do Quý khách đã mua sản phẩm trước đó hoặc sử dụng chức năng loan tin.</li>')
						('<li>Quý khách có thể nhờ người khác <a onclick="shop.gold.rechargeStep1(true)" href="javascript:void(0)">nạp hộ tiền</a> vào Ví của Quý khách bằng chức năng <a onclick="shop.gold.rechargeStep1()" href="javascript:void(0)">Nạp Tiền</a> trong trang cá nhân.</li>')
					('</ul>')
				('</div>')
			('</div>')(),
			cod = shop.join
			('<div class="paymentChooseType sendCod'+(type=='cod'?' pay_active clicked':'')+((gold_only||no_cod)?' codNoActive':'')+'" id="cod">')
				('<div class="arrowRight pBottom10">')
					('<div class="radioBox"><input type="radio" name="radio_pay" id="radio_cod" value="cod" '+(type=='cod'?'checked':'')+' /></div>')
					('<div class="paymentContent">')
						('<div class="paymentTitle">Muachung thu tiền tận nơi <span>(Miễn phí giao Phiếu)</span></div>')
						('<div class="paymentText">Trong thời gian từ 2-7 ngày làm việc, nhân viên MuaChung sẽ giao phiếu đến tận nơi cho Quý khách và thu tiền.</div>')
					('</div>')
					('<div class="c"></div>')
					('<ul class="paymentText paymentGuide'+(type=='cod' ? '' : ' hidden')+'">')
						('<li>Quý khách có thể bị mất phí khi chọn hình thức này.</li>')
						('<li>Nhân viên giao phiếu của MuaChung sẽ liên hệ với Quý khách trước khi giao</li>')
						('<li>Quý khách chỉ được sử dụng dịch vụ sau khi đã thanh toán tiền cho nhân viên giao phiếu.</li>')
					('</ul>')
				('</div>')
			('</div>')(),
			coo = shop.join
			('<div class="paymentChooseType sendCoo'+(type=='coo'?' pay_active clicked':'')+(gold_only?' cooNoActive':'')+'" id="coo">')
				('<div class="arrowRight pBottom10">')
					('<div class="radioBox"><input type="radio" name="radio_pay" id="radio_coo" value="coo" '+(type=='coo'?'checked':'')+' /></div>')
					('<div class="paymentContent">')
						('<div class="paymentTitle">Đến văn phòng MuaChung nộp tiền '+title_gold+'</div>')
						('<div class="paymentText">Sau khi đặt hàng thành công, Quý khách vui lòng qua văn phòng MuaChung để thanh toán và nhận hàng.</div>')
					('</div>')
					('<div class="c"></div>')
					('<ul class="paymentText paymentGuide'+(type=='coo' ? '' : ' hidden')+'">')
						('<li>Vui lòng chọn đúng văn phòng gần địa chỉ nhà của Quý khách</li>')
					('</ul>')
				('</div>')
			('</div>')(),
			payment = visaCard + mcard + cod + coo;

			var btBack = '';
			if(item_id > 0 && shop.cLib.isMultiPrice(item_id, shop.cart)){
				btBack = '<a href="javascript:void(0)" onclick="shop.cart.showExtra('+item_id+', shop.cart.conf.extra['+item_id+'])" id="fr" class="blueButton mRight20"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>';
			}
			return shop.popupSite(id, title, shop.join
			('<div class="content" style="padding:0 0 10px">'+payment)
				('<div class="c"></div>')
				('<div align="center" class="mRight20 mTop10">')
					('<a href="javascript:void(0)" onclick="shop.cart.processStepZero()" class="blueButton" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>'+btBack)
					('<div class="c"></div>')
				('</div>')
			('</div>')());
		},
		stepOne:function(id, title){
			var province_notice = '', province_active = {},
			fname = shop.join
			('<tr>')
				('<td width="85" class="bold">Họ và tên:</td>')
				('<td><input type="text" id="cart_fullname" name="fullname" value="'+(shop.cart.conf.user.fullname&&!shop.cart.conf.addbook ? shop.cart.conf.user.fullname : '')+'" /></td>')
			('</tr>')(),
			phone = shop.join
			('<tr>')
				('<td class="bold">ĐT di động:</td>')
				('<td><input type="text" id="cart_tel" name="tel" value="'+(shop.cart.conf.user.mobile_phone&&!shop.cart.conf.addbook ? shop.cart.conf.user.mobile_phone : '')+'" maxlength="20" onkeypress="return shop.numberOnly(this, event)" /></td>')
			('</tr>')(),
			email = shop.join
			('<tr>')
				('<td class="bold">Email:</td>')
				('<td><input type="text" id="cart_email" name="email" value="'+(shop.cart.conf.user.email&&!shop.cart.conf.addbook ? shop.cart.conf.user.email : '')+'" /></td>')
			('</tr>')(),
			address = shop.join
			('<tr>')
				('<td width="85" class="bold">Địa chỉ:</td>')
				('<td><input type="text" id="cart_address" name="address" style="width:445px" value="'+(shop.cart.conf.user.address&&!shop.cart.conf.addbook ? shop.cart.conf.user.address : '')+'" /></td>')
			('</tr>')(),
			street = shop.join
			('<tr>')
				('<td class="bold">Đường/Phố:</td>')
				('<td><input type="text" id="cart_street" name="street" value="'+(shop.cart.conf.user.street&&!shop.cart.conf.addbook ? shop.cart.conf.user.street : '')+'" /></td>')
			('</tr>')(),
			city = '',
			district = shop.join
			('<tr>')
				('<td class="bold" id="disTitle">Quận/Huyện:</td>')
				('<td><select id="listDistrict" name="district"></select></td>')
			('</tr>')(),
			cityList = '<select name="city" id="cart_city" onchange="shop.district.loadDistrictDropdown(this.value, \'listDistrict\', shop.cart.theme.changeCity, \''+((shop.cart.conf.user.type == 'customer') ? shop.cart.conf.customer.district : shop.cart.conf.user.district)+'\')">';
			
			//make city list
			var opt1 = '', opt2 = '';
			for(var i in city_list){
				if(city_list[i].status == 1){
					opt1 += '<option value="'+city_list[i].id+'"'+(shop.cart.conf.user.city==i&&!shop.cart.conf.addbook?' selected':'')+'>'+city_list[i].title+'</option>';
					province_active[i] = city_list[i].title;
				}else{
					opt2 += '<option value="'+city_list[i].id+'"'+(shop.cart.conf.user.city==i&&!shop.cart.conf.addbook?' selected':'')+'>'+city_list[i].title+'</option>';
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
			
			
			if(shop.cart.conf.cart.cart.disable_province.length > 0){
				for(var i=0;i<shop.cart.conf.cart.cart.disable_province.length;i++){
					if(shop.is_exists(province_active[shop.cart.conf.cart.cart.disable_province[i]])){
						province_active[shop.cart.conf.cart.cart.disable_province[i]] = null;
						delete province_active[shop.cart.conf.cart.cart.disable_province[i]];
					}
				}
				for(var i in province_active){
					if(province_notice != ''){
						province_notice += ', ';
					}
					province_notice += '<span>'+province_active[i]+'</span>';
				}
				if(province_notice != ''){
					shop.cart.conf.province_active = province_active;
					province_notice = '<div class="province_notice">Chỉ áp dụng tại: '+province_notice+'</div>';
				}
			}

			return shop.popupSite(id, title, shop.join
			(province_notice+'<div class="content" style="padding:15px">')
				('<div class="reg_cart_form">')
					('<form name="cartRegisterForm" id="cartRegisterForm">')
						('<div class="cartNewForm">')
							('<div id="cError"></div>')
							('<div class="infoUser">')
								('<a href="javascript:shop.cAddress.stepAddress(shop.cart)" class="addBookCtrl fr">Lấy trong danh bạ</a>')
								('<div class="text_tit">Thông tin mua hàng của Quý khách:</div>')
								('<div style="padding-left:35px">')
									('<table cellpadding="3" cellspacing="0" border="0">'+fname+phone+email+'</table>')
								('</div>')
							('</div>')
							('<div class="infoAddress mTop20">')
								('<div class="text_tit">Địa chỉ'+((shop.cart.conf.cart.payment_id!='coo')?' nhận hàng':'')+':</div>')
								('<div style="padding-left:35px">')
									('<table cellpadding="3" cellspacing="0" border="0">'+address+street+city+district+'</table>')
								('</div>')
							('</div>')
							('<div class="c"></div>')
						('</div>')
					('</form>')
					('<div class="mTop10">')
						('<a href="javascript:void(0)" onclick="shop.cart.processStepOne()" class="blueButton mLeft10" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>')
						('<a href="javascript:void(0)" onclick="shop.cart.stepZero()" class="blueButton" id="fr"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
						('<div class="c"></div>')
					('</div>')
					('<div class="c"></div>')
				('</div>')
			('</div>')());
		},
		stepTwo:function(id, title){
			var allPrice = '', quantity = '', price = parseInt(shop.cart.conf.cart.cart.price), num = 0, ship_fee = 0, gold_reward = 0, real_ship = shop.cLib.getShipFee(shop.cart);
			//mac dinh so luong = min order 
			if(!shop.is_exists(shop.cart.conf.cart.numberOtp)){
				shop.cart.conf.cart.numberOtp = parseInt(shop.cart.conf.cart.cart.min_order);
			}
			num = shop.cart.conf.cart.numberOtp;
			//quantity theme
			quantity = shop.join
			('<div id="formQuantity" class="jNice">')
				('<div>')
					('<select style="width: 70px" id="quantity" name="select" onchange="shop.cart.theme.price(this.value)">')();
			for(var i = parseInt(shop.cart.conf.cart.cart.min_order);i<=shop.cart.conf.cart.cart.max_order;i++){
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
			
			var ship_type = '', type = shop.cart.conf.shipping.codShipType,
			is_cod = shop.cart.conf.cart.payment_id == 'cod',
			is_office = shop.cart.conf.cart.payment_id == 'coo',
			is_ship = shop.cart.conf.shipping.active,
			note_title = 'Vui lòng cho chúng tôi biết thời gian nhận hàng trong ngày hoặc Ghi chú thêm...';
			if(is_office){
				//fix rieng cho Nha Trang
				var uCity = shop.cLib.getCity(true, shop.cart.conf.cart.cart.province_id),
				office = shop.cart.conf.office[uCity],map = '',
				def = shop.cart.conf.office_id;
				for(var i in office){
					if(shop.is_exists(office[i].id)){
						map = '';
						if(office[i].map){
							map = ' - <a href="javascript:void(0)" class="jTip" id="'+office[i].id+'">Xem bản đồ</a>';
							map += '<span class="content'+office[i].id+' hidden"><img src="'+office[i].map+'" width="550" /></span>';
						}
						ship_type+= shop.join
						('<div class="mTop10">')
							('<div class="fl mRight5"><input type="radio" name="radio_ship" class="radio_ship" id="office'+office[i].id+'" value="'+office[i].id+'"'+(def==office[i].id?' checked':'')+' /></div>')
							('<div class="fl rightInfo" id="'+office[i].id+'" style="cursor:pointer">')
								('<div class="txt_tit">'+office[i].name+'</div>')
								('<div class="shipGuide shipGuideActive">')
									('<div class="paymentText">'+office[i].address+' - ĐT: '+office[i].tel+map+'</div>')
								('</div>')
							('</div>')
							('<div class="c"></div>')
						('</div>')();
					}
				}
			}else if(is_ship || is_cod){
				var unit = is_ship ? 'hàng' : 'phiếu',
				ward = '', ward2 = '';
				
				if(shop.cart.conf.user.city == 29){ //chi co HCM moi co phuong
					ward = shop.join
					('<div class="mTop5">')
						('<div class="input" style="color:#472900"><b>Vui lòng cho biết thêm Phường/Xã nơi quý khách nhận hàng:</b></div>')
						('<div class="mTop5"><input type="text" id="cart_ward" name="ward" class="nice_input" style="width:235px" value="'+(shop.cart.conf.user.ward ? shop.cart.conf.user.ward : '')+'" /></div>')
						('<div class="input mTop5" style="color:#472900"><b>Thời giao hàng, Ghi chú thêm:</b></div>')
					('</div>')();
					ward2 = shop.join
					('<div class="mTop5">')
						('<div class="input" style="color:#472900"><b>Vui lòng cho biết thêm Phường/Xã nơi quý khách nhận hàng:</b></div>')
						('<div class="mTop5"><input type="text" id="cart_ward2" name="ward2" class="nice_input" style="width:235px" value="'+(shop.cart.conf.user.ward ? shop.cart.conf.user.ward : '')+'" /></div>')
						('<div class="input mTop5" style="color:#472900"><b>Thời giao hàng, Ghi chú thêm:</b></div>')
					('</div>')();
				}
				//tinh gia ship
				if(is_ship){
					if(type == 'product'){
						ship_fee = real_ship;
					}
					ship_type = shop.join
					('<div class="mTop10">')
						('<div class="fl mRight5"><input type="radio" name="radio_ship" class="radio_ship" id="ship_product" value="product" '+(type=='product'?'checked':'')+' /></div>')
						('<div class="fl rightInfo" id="product" style="cursor:pointer">')
							('<div class="txt_tit" id="product">MuaChung <span class="cRed">GIAO HÀNG</span> '+(is_cod?'và thu tiền ':'')+'tận nơi '+(shop.cart.conf.shipping.fee > 0 ? ('<span class="cRed">(Phí <span id="feePrice">'+ shop.numberFormat(real_ship*num) +'đ</span>)</span>') : '<span class="cGreen">Miễn phí</span>')+'</div>')
							('<div class="paymentText">Trong thời gian từ 2-7 ngày làm việc, nhân viên MuaChung sẽ giao hàng đến tận nơi cho Quý khách'+(is_cod?' và thu tiền':'')+'</div>')
							('<div class="shipGuide'+(type=='product'?' shipGuideActive':' hidden')+'">')
								(ward+'<div class="mTop5">')
									('<textarea id="cart_note" name="note" title="'+note_title+'" onblur="if(this.value==\'\') this.value=this.title;jQuery(this).removeClass(\'black\')" onfocus="if(this.value==this.title) this.value=\'\';jQuery(this).addClass(\'black\')">'+(shop.cart.conf.user.note != '' ? shop.cart.conf.user.note : note_title)+'</textarea>')
								('</div>')
							('</div>')
						('</div>')
						('<div class="c"></div>')
					('</div>')();
				}
				if(shop.cLib.inArea(shop.cart) && !shop.cart.conf.error_city){
					ship_type+= shop.join
					('<div class="mTop10">')
						('<div class="fl mRight5"><input type="radio" name="radio_ship" class="radio_ship" id="ship_coupon" value="coupon" '+(type=='coupon'?'checked':'')+' /></div>')
						('<div class="fl rightInfo" id="coupon" style="cursor:pointer">')
							('<div class="txt_tit" id="coupon">MuaChung '+(is_cod?('<span class="cRed">GIAO PHIẾU</span> mua hàng và thu tiền tận nơi'+((shop.cart.conf.shipping.note != '' || is_cod) ? (is_ship ? ', Quý khách tự đi lấy hàng' : '') : '')):'<span class="cRed">GỬI PHIẾU</span> mua hàng qua Email và SMS, Quý khách tự đi lấy hàng')+' <span class="cGreen">(Miễn phí)</span></div>')
							('<div class="paymentText">'+(is_cod?'Trong thời gian từ 2-7 ngày làm việc, MuaChung sẽ giao thẻ cào đến tận nơi cho Quý khách và thu tiền.<br />Quý khách cào thẻ và làm theo hướng dẫn trên thẻ cào để nhận được phiếu mua hàng qua Email và SMS.<br />':'Quý khách sẽ nhận được mã số phiếu mua hàng qua SMS và Email ngay sau khi quý khách thanh toán thành công.')+' Quý khách mang theo mã số phiếu nhận được để cung cấp khi sử dụng dịch vụ.</div>')
							('<div class="shipGuide'+(type=='coupon'?' shipGuideActive':' hidden')+'">')
								(ward2+'<div class="mTop5">')
									('<textarea id="cart_note2" name="note" title="'+note_title+'" onblur="if(this.value==\'\') this.value=this.title;jQuery(this).removeClass(\'black\')" onfocus="if(this.value==this.title) this.value=\'\';jQuery(this).addClass(\'black\')">'+(shop.cart.conf.user.note != '' ? shop.cart.conf.user.note : note_title)+'</textarea>')
								('</div>')
							('</div>')
						('</div>')
						('<div class="c"></div>')
					('</div>')();
				}
			}else{
				ship_type+= shop.join
				('<div class="mTop10">')
					('<div class="fl mRight5"><input type="radio" name="radio_ship" class="radio_ship" id="ship_coupon" value="coupon" checked /></div>')
					('<div class="fl rightInfo" id="coupon" style="cursor:pointer">')
						('<div class="txt_tit" id="coupon">Nhận mã số phiếu qua Email, SMS <span class="cGreen">(Miễn phí)</span></div>')
						('<div class="paymentText">Quý khách sẽ nhận được mã số phiếu qua SMS và Email ngay sau khi quý khách thanh toán thành công.<br />Quý khách mang theo mã số phiếu nhận được để cung cấp khi sử dụng dịch vụ.</div>')
						('<div class="shipGuide shipGuideActive">')('</div>')
					('</div>')
					('<div class="c"></div>')
				('</div>')();
			}
			if(ship_type != ''){
				ship_type = shop.join
				('<div class="infoCart mTop10">')
					('<div class="text_tit">'+(is_office?'Nhận hàng tại văn phòng MuaChung':'Hình thức nhận hàng:')+'</div>')
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
					('<a href="javascript:void(0)" onclick="shop.cart.processStepTwo()" class="blueButton mLeft10" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>')
					('<a href="javascript:void(0)" onclick="shop.cart.stepOne()" class="blueButton" id="fr"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
					('<div class="c"></div>')
				('</div>')
				('<div class="c"></div>')
			('</div>')());
		},
		stepThree:function(id, title){
			var paymentViSa = '', data = shop.cart.conf.cart.cart, note='', t='', logo='', bt_checkout='ĐẶT HÀNG',
			shipping_fee = shop.cLib.getShipFee(shop.cart),
			shipping_fee_f = shop.numberFormat(shipping_fee)+' đ',
			ship = '',
			num = shop.cart.conf.cart.numberOtp,
			total = num*data.price;
			if((shop.cart.conf.shipping.active || shop.cart.conf.shipping.COD) && shop.cart.conf.shipping.check && shipping_fee > 0){
				ship = shop.join
				('<tr>')
					('<td valign="top" align="center" class="item bRight">2</td>')
					('<td valign="top" class="item bRight" colspan="2">Phí giao tận nơi</td>')
					('<td valign="top" align="right" class="item bRight">'+shipping_fee_f+'</td>')
					('<td valign="top" align="center" class="item bRight">'+num+'</td>')
					('<td valign="top" align="right" class="item">'+shop.numberFormat(num*shipping_fee)+' đ</td>')
				('</tr>')();
				total += num*shipping_fee;
			}

			if(shop.cart.conf.cart.payment == 1){
				t = "Thanh toán Online";
				logo = '<a href="'+PAY_GATE_SITE+'" target="_blank" title="'+PAY_GATE_SITE_NAME+'"><img src="style/images/logo/'+PAY_GATE_LOGO+'" width="215" height="48" border="0" /></a>';
				note = shop.join
				('<div class="mLeft25" style="width:470px">')
					('<div>')
						('<div><strong style="color:red">Chú ý:</strong> Quý khách phải có <b>thẻ Visa/Master</b> đã kích hoạt thanh toán online</div>')
						('<div class="mTop5">hoặc <b>thẻ ATM đã đăng kí sử dụng internet banking</b> với ngân hàng phát hành thẻ</div>')
					('</div>')
					('<div class="mTop10">Thanh toán Online được đảm bảo bởi <a href="'+PAY_GATE_SITE+'" target="_blank" title="'+PAY_GATE_SITE_NAME+'">'+PAY_GATE+'</a></div>')
				('</div>')();
				bt_checkout='THANH TOÁN';
			}else if(shop.cart.conf.cart.payment == 2){
				var moreGold = '', suggest = '',total_fix = total - total/100;
				if(shop.cart.conf.customer.gold < total_fix){
					moreGold = total_fix - shop.cart.conf.customer.gold;
					moreGold = shop.numberFormat(moreGold, 0, '', '.');
					moreGold = 'Quý khách phải nạp thêm: <b style="color:red">'+moreGold+'</b> đ';
					suggest = 'nap them';
					bt_checkout = '';
				}else{
					moreGold = shop.cart.conf.customer.gold-total;
					moreGold = shop.numberFormat(moreGold, 0, '', '.');
					moreGold = 'Sau khi thanh toán Quý khách còn: <b style="color:red">'+moreGold+'</b> đ';
					bt_checkout = 'THANH TOÁN';
				}
				t = "Thanh toán bằng Ví MuaChung";
				note = shop.join
				('<div class="mLeft25" style="width:720px">')
					('<div>- Hiện tại của Quý khách đang có: <b>'+shop.numberFormat(shop.cart.conf.customer.gold, 0, '', '.')+'</b> đ</div>')
					('<div class="mTop5">- Đơn hàng này có giá trị tương ứng với: <b>'+shop.numberFormat(total, 0, '', '.')+'</b> đ</div>')
					('<div class="mTop5">- Khi thanh toán, Quý khách sẽ được cộng vào ví: <b>'+shop.numberFormat(total/100, 0, '', '.')+'</b> đ</div>')
					('<div class="mTop5 mBottom10">- '+moreGold+'</div>'+(suggest != '' ? '<a href="javascript:void(0)" onclick="shop.gold.rechargeStep1()" id="fl" class="blueButton"><span><span>NẠP TIỀN</span></span></a><div class="c"></div>' : ''))
				('</div>')();
			}else if(shop.cart.conf.cart.payment_id == 'cod'){
				t = "MuaChung giao hàng và thu tiền tận nơi";
				if(shop.cart.conf.shipping.codShipType == 'office'){
					t = "Lên văn phòng MuaChung nhận hàng/phiếu và trả tiền"
				}else if(shop.cart.conf.shipping.codShipType == 'coupon'){
					t = "MuaChung giao phiếu và thu tiền tận nơi"
				}
			}else if(shop.cart.conf.cart.payment_id == 'coo'){
				var office = shop.cLib.getOffice(shop.cart.conf.office_id, shop.cart)
				t = "Lên văn phòng MuaChung nhận hàng/phiếu và trả tiền";
				note = shop.join
				('<div style="width:720px"><b style="color:red">Văn Phòng: </b>'+office.name+' - ĐC: '+office.address+' - ĐT: '+office.tel+'</div>')();
			}

			var regulations = shop.cart.conf.user.type == 'guest' ? shop.join
			('<div class="mTop10" style="font-size:16px;width:758px">')
				('<input type="checkbox" id="check-regulations" class="checkbox" checked />')
				('<label for="check-regulations">')
					('<strong>Tôi đã đọc và đồng ý với các <a href="trang-the-le.html" target="_blank">điều khoản</a> và <a href="trang-quy-dinh-refund.html"  target="_blank">quy định</a> của MuaChung.vn</strong>')
				('</label>')
			('</div>')() : '';
			var address = '<div class="mTop5"><strong>Địa chỉ '+(shop.cart.conf.cart.payment_id == 'coo'? 'đăng kí' : 'nhận hàng')+':</strong> <span class="cff9200">'+shop.cart.conf.user.address+' ('+shop.cart.conf.user.street+'/'+shop.cart.conf.user.district+'/'+city_list[shop.cart.conf.user.city].title+')'+'</span>';
			if(shop.cart.conf.user.note!='' && shop.cart.conf.cart.payment_id != 'coo'){
				address+= '</div><div class="mTop5"><strong>Ghi chú nhận hàng:</strong> <span class="cff9200">'+shop.cart.conf.user.note+'</span>';
			}
			address += '<a href="javascript:void(0)" onclick="shop.cart.stepOne()" class="blueButton" id="fr"><span><span>SỬA THÔNG TIN CÁ NHÂN</span></span></a></div>';
			
			if(shop.cLib.isMultiPrice(shop.cart.conf.cart.cart.id, shop.cart) && shop.is_exists(data.extra)){
				data.title += ' ('+shop.cart.conf.extra[shop.cart.conf.cart.cart.id][data.extra].price_title+')';
			}
			return shop.popupSite(id, title, shop.join
			('<div class="content" style="padding:10px 20px">')
				('<div class="box-gradien pBottom10 pTop15" style="*width:713px">')
					('<div class="title">Thông tin khách hàng</div>')
					('<div class="content" id="pTop10">')
						('<div><strong>Họ tên:</strong> <span class="cff9200">'+shop.cart.conf.user.fullname+'</span></div>')
						('<div class="mTop5"><strong>Email:</strong> <span class="cff9200">'+shop.cart.conf.user.email+'</span></div>')
						('<div class="mTop5"><strong>Điện thoại di động:</strong> <span class="cff9200">'+shop.cart.conf.user.mobile_phone+'</span></div>')
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
							('<td valign="top" align="right" class="item bRight">'+data.price_f+'</td>')
							('<td valign="top" align="center" class="item bRight">'+num+'</td>')
							('<td valign="top" align="right" class="item">'+shop.numberFormat(num*data.price, 0, '', '.')+' đ</td>')
						('</tr>')
						(ship+'<tr>')
							('<td align="right" class="item total-all" colspan="6">Tổng tiền = <span id="total-all">'+shop.numberFormat(total, 0, '', '.')+' đ</span></td>')
						('</tr></table>')
					('</div>')
				('</div>'+regulations)
				('<div align="center" class="mTop10">'+(bt_checkout != '' ? '<a href="javascript:void(0)" onclick="shop.cart.processStepThree()" class="blueButton  mLeft10" id="fr"><span><span>'+bt_checkout+'</span></span></a>' : ''))
					('<a href="javascript:void(0)" onclick="shop.cart.stepTwo()" id="fr" class="blueButton"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
					('<div class="c"></div>')
				('</div>')
			('</div>')());
		},
		paymentViSa:function(){
			return shop.join
			('<form id="checkoutSoHa" method="post" action="'+shop.cart.conf.cart.url+'">')
				('<input type="hidden" value="'+shop.cart.conf.cart.quantity+'" name="quantity" />')
				('<input type="hidden" value="'+shop.cart.conf.cart.order_id+'" name="id" />')
				('<input type="hidden" value="'+shop.cart.conf.cart.total+'" name="total" />')
				('<input type="hidden" value="'+shop.cart.conf.cart.good_name+'" name="good" />')
				('<input type="hidden" value="'+shop.cart.conf.cart.item_ids+'" name="item_ids" />')
				('<input type="hidden" value="'+shop.cart.conf.user.fullname+'" name="fullname" />')
				('<input type="hidden" value="'+shop.cart.conf.user.mobile_phone+'" maxlength="50" name="mobiphone" />')
				('<input type="hidden" value="'+shop.cart.conf.user.email+'" maxlength="50" name="email" />')
				('<input type="hidden" value="'+shop.cart.conf.user.id+'" maxlength="50" name="uid" />')
			('</form>')();
		},
		newPrice:function(id, r){
			var price = parseInt(shop.cart.conf.cart.cart.price), num = shop.cart.conf.cart.numberOtp,
			radio = shop.get_ele("ship_"+id), check = false, ship_fee = shop.cLib.getShipFee(shop.cart);
			if(radio && radio.checked){
				check = true;
			}else if(!r){
				check = true;
				radio.checked = true;
			}
			shop.cart.conf.shipping.codShipType = id;
			shop.cart.conf.cart.priceAndShip = num*price;
			if(id == 'product'){
				shop.cart.conf.shipping.check = true;
				shop.cart.conf.cart.priceAndShip += num*parseInt(ship_fee);
			}else{
				shop.cart.conf.shipping.check = false;
			}
			var p = jQuery(radio).parent().parent();
			if(!jQuery('.rightInfo',p).hasClass('rightInfoClicked')){
				jQuery('.shipGuideActive').addClass('hidden').removeClass('shipGuideActive').hide();
				jQuery('.shipGuide',p).slideDown().removeClass('hidden').addClass('shipGuideActive');
			}
			jQuery('#bgAllPrice').html(shop.numberFormat(shop.cart.conf.cart.priceAndShip)+" đ");
			jQuery('#moneyOffice').html(shop.numberFormat(num*price/100)+" đ");
		},
		price:function(number){
			shop.cart.conf.cart.numberOtp = number;
			var price = parseInt(shop.cart.conf.cart.cart.price);
			shop.cart.conf.cart.priceAndShip = number*price,
			real_ship = shop.cLib.getShipFee(shop.cart);
			//doi gia tien
			if(shop.cart.conf.shipping.fee > 0){
				jQuery('#feePrice').html(shop.numberFormat(number*real_ship)+' đ');
				if(shop.cart.conf.shipping.check){
					shop.cart.conf.cart.priceAndShip += number*real_ship;
				}
			}
			jQuery('#numPrice').html(shop.numberFormat(number*price)+" đ");
			jQuery('#bgAllPrice').html(shop.numberFormat(shop.cart.conf.cart.priceAndShip)+" đ");
			jQuery('#moneyOffice').html(shop.numberFormat(number*price/100)+" đ");
		},
		changeCity:function(district, city){
			var cityTitle = 'Quận/Huyện:';
			if(city == 67 || city == 68 || city == 30){ //Nha Trang, Khanh Hoa, Vung Tau
				cityTitle = 'Quận/Phường:';
			}
			jQuery('#disTitle').html(cityTitle);
		}
	}
};

shop.cAddress = {
	conf:{o:null, book: null},
	stepAddress:function(cart){
		shop.cAddress.conf.o = cart;
		shop.ajax_popup('act=cart&code=loadbook',"GET",{},
		function (j) {
			if (j.err != 0) {
				alert('Quý khách phải đăng nhập để thực hiện chức năng này');
			}else{
				shop.cAddress.conf.book = j.data;
				shop.show_overlay_popup('customer-address', 'Quản lý thông tin mua hàng',
				shop.cAddress.theme.stepAddress('customer-address', 'Quản lý thông tin mua hàng'),
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
					}
				});
			}
		});
	},
	doStepAddress:function(back){
		var cart = shop.cAddress.conf.o;
		if(back){
			cart.stepOne();
		}else{
			//xu li thong tin user tai day
			var check = 0, book = shop.cAddress.conf.book;
			jQuery(".radio_book").each(function(){
				if(check == 0 && this.checked){
					check = this.value;
				}
			});
			if(check == 0){
				alert('Qúy khách chưa chọn thông tin mua hàng'); return;
			}
			if(shop.is_exists(book[check])){
				//luu thong tin
				cart.conf.user.email = book[check].email;
				cart.conf.user.fullname = book[check].fullname;
				cart.conf.user.mobile_phone = book[check].phone;
				cart.conf.user.address = book[check].address;
				cart.conf.user.street = book[check].street;
				cart.conf.user.city = book[check].city;
				cart.conf.user.district_id = book[check].district_id;
				cart.conf.user.district = book[check].district;
				shop.cLib.guest.save(cart.conf.user, shop.cart);
				//den voi buoc tiep theo
				cart.stepTwo(cart.conf.user.district_id, cart.conf.user.city);
			}else{
				alert('Không xác nhận được thông tin! Quý khách vui lòng tắt cửa sổ và thao tác lại');
			}
		}
	},
	doAddNew:function(){
		shop.cAddress.conf.o.stepOne(true);
	},
	removeUI:function(id){
		jQuery('.event'+id).remove();
		shop.cAddress.conf.book[id] = null;
		delete shop.cAddress.conf.book[id];
	},
	removeBook:function(id){
		if(confirm('Quý khách thực sự muốn xóa thông tin này ?')){
			shop.ajax_popup('act=cart&code=delBook',"GET",{id:id},
			function (j) {
				if (j.err != 0) {
					switch(j.msg){
						case 'not_login': alert('Quý khách phải đăng nhập để thực hiện chức năng này'); break;
						case 'not_existed':
							alert('Không tìm thấy thông tin này');
							shop.cAddress.removeUI(id);
						break;
						case 'db': alert('Xóa không thành công, vui lòng thử lại'); break;
					}
				}else{
					shop.cAddress.removeUI(id);
				}
			});
		}
	},
	theme:{
		stepAddress:function(id, title, cart){
			var book = shop.cAddress.conf.book, html = '';
			if(book){
				html = '<table cellpadding="0" cellspacing="0" border="0">';
				for(var i in book){
					if(shop.is_exists(city_list[book[i].city])){
						html += shop.join
						('<tr class="event'+i+'">')
							('<td valign="top"><input type="radio" name="radio_book" class="radio_book" id="radio_book'+book[i].id+'" value="'+book[i].id+'" /></td>')
							('<td valign="top" width="585" style="padding:0 0 7px;color:#000">')
								('<div style="border-bottom:2px solid #ccc;padding:0 0 7px">')
									('<a href="javascript:void(0)" onclick="shop.cAddress.removeBook('+i+')" class="blueButton mTop5" id="fr"><span><span> Xóa </span></span></a>')
									('<table cellpadding="0" cellspacing="2" border="0">')
										('<tr>')
											('<td><b>Họ tên: </b></td>')
											('<td>'+book[i].fullname+'</td>')
										('</tr>')
										('<tr>')
											('<td><b>ĐT di động: </b></td>')
											('<td>'+book[i].phone+'</td>')
										('</tr>')
										('<tr>')
											('<td><b>Email: </b></td>')
											('<td>'+book[i].email+'</td>')
										('</tr>')
										('<tr>')
											('<td><b>Địa chỉ: </b></td>')
											('<td>'+book[i].address+'</td>')
										('</tr>')
										('<tr>')
											('<td><b>Đường/Phố: </b></td>')
											('<td>'+book[i].street+'</td>')
										('</tr>')
										('<tr>')
											('<td><b>Quận/Huyện: </b></td>')
											('<td>'+book[i].district+'</td>')
										('</tr>')
										('<tr>')
											('<td><b>Tỉnh/Thành</b></td>')
											('<td>'+city_list[book[i].city].title+'</td>')
										('</tr>')
									('</table>')
									('<div class="c"></div>')
								('</div>')
							('</td>')
						('</tr>')();
					}
				}
				html += '</table>';
			}
			
			return shop.popupSite(id, title, shop.join
			('<div class="content p20">')
				(html+'<div class="mTop10">')
					('<a href="javascript:shop.cAddress.doAddNew()" class="addBookCtrl fl">Thêm thông tin mới</a>')
					('<a href="javascript:void(0)" onclick="shop.cAddress.doStepAddress()" class="blueButton mLeft10" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>')
					('<a href="javascript:void(0)" onclick="shop.cAddress.doStepAddress(true)" class="blueButton" id="fr"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
					('<div class="c"></div>')
				('</div>')
				('<div class="c"></div>')
			('</div>')());
		}
	}
};
shop.cTheme = {
	showMap:function(map, obj){},
	labelMe:{
		mousedown: false,
		mouseDIV:{
			over: function(obj){jQuery(obj).addClass('over-bg')},
			out:  function(obj){jQuery(obj).removeClass('over-bg')},
			down: function(obj, ckb, cb){
				ckb = ckb ? ckb : '.checkbox';
				if(!shop.cTheme.labelMe.mousedown){
					var check = jQuery(ckb, obj).attr("checked");
					jQuery(ckb, obj).attr("checked", !check);
					if(cb) cb();
				}
			},
			up: function(){shop.cTheme.labelMe.mousedown = false}
		},
		mouseCheckboxDown: function(){shop.cTheme.labelMe.mousedown = true}
	},
	choosePayment:function(obj, cart){
		if(!jQuery(obj).hasClass(obj.id+'NoActive')){
			if(cart.conf.user.type == 'guest' && (obj.id == 'mcard' || obj.id == 'cod' || obj.id == 'coo')){
				shop.get_ele('radio_'+obj.id).checked = false;
				var title = (obj.id == 'mcard') ? 'Ví MuaChung' : 'COD';
				shop.customer.loginMixReg.show();
			}else{
				//kich hoat
				jQuery('.pay_active').removeClass('pay_active').removeClass('clicked');
				jQuery(obj).addClass('pay_active clicked');
				//khoi tao lai chieu cao
				if(obj.id == 'atm'){
					jQuery('.bank').slideDown();
				}else{
					jQuery('.bank').slideUp();
				}
				//select radio
				shop.get_ele('radio_'+obj.id).checked = true;
				jQuery('.paymentGuide').hide();
				jQuery('.paymentGuide', obj).show();
			}
		}else{
			shop.get_ele('radio_'+obj.id).checked = false;
			var id = jQuery('.clicked').attr('id');
			if(id){
				shop.get_ele('radio_'+id).checked = true;
			}
		}
	},
	finish:function(id, title){
		return shop.popupSite(id, title, shop.join
		('<div class="content" style="padding:15px 20px 25px;font-size:18px" align="center">')
			('<b>Hệ thống đang cập nhật đơn hàng... </b><br /><br />')
			('Quý khách vui lòng <b style="color:red">không tắt trình duyệt</b>')
		('</div>')());
	},
	showActivePhoneWarning:function(email, phone, cart){
		if(phone == 0){
			shop.customer.active.phone(true);
		}else{
			var msg = '';
			if(email == 0){
				msg += '<div>- <b style="color:red">Kích hoạt Email</b>,  bấm <a href="javascript:shop.customer.register.sendActiveEmail(\''+cart.conf.customer.email+'\', 1)">vào đây</a> để nhận Email kích hoạt.</div>';
			}
			if(phone == 0){
				msg += '<div class="mTop5">- <b style="color:red">Kích hoạt số điện thoại</b>, vui lòng nhắn tin theo cú pháp: <b style="color:red">CHUNG</b> gửi <b style="color:red">8001</b> (500đ/sms)</div>';
			}
			shop.show_overlay_popup('mc-comment-result', 'Hệ thống',
				shop.popupSite('mc-comment-result', 'Hệ thống',shop.join
					('<div class="content" style="padding:10px">')
						('<div><b>Cám ơn Quý khách đã chọn mua hàng!</b></div>')
						('<div class="mTop10 mBottom5">Để mua hàng qua <b>COD</b>, Quý khách cần hoàn thiện các bước sau: </div>')
						('<div class="f11" style="margin:10px 10px 0;background-color: #FFFEDE;border: 1px solid #FFEDBE;padding: 5px">'+msg+'</div>')
						('<div class="mTop15">')
							('<div style="width:60px;margin:0 auto">')
								('<a id="fr" class="blueButton mLeft10" onclick="shop.hide_overlay_popup(\'mc-comment-result\')" href="javascript:void(0)"><span><span>Đóng</span></span></a>')
								('<div class="c"></div>')
							('</div>')
						('</div>')
					('</div>')()
				),
				{
					background: {'background-color' : 'transparent'},
					title: {'display' : 'none'},
					border: {
						'background-color' : 'transparent',
						'padding' : '0px'
					},
					content: {
						'padding' : '0px',
						'width' : '500px'
					}
				}
			);
		}
	},
	systemAlert:function(msg, title){
		var key = shop.get_uuid();
		title = title ? title : 'Thông báo từ hệ thống';
		shop._active_popup(key, "", "",
		{
			type: "overlay",
			auto_hide: 8900,
			overlay : {
				'opacity' : 0.3,
				'background-color' : '#000'
			}
		});
		shop._active_popup('system-alert',title,
		shop.popupSite('system-alert',title,shop.join
		('<div class="content" style="padding:20px">')
				('<div class="box-gradien" id="site-regulations" style="padding:20px 10px;width:435px;overflow:hidden">'+msg+'</div>')
		('</div>')(), key),
		{
			type: 'one-time',
			auto_hide: 9000,
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
				'width' : '500px'
			}
		});
	}
};

shop.cLib = {
	getAllCity:function(type, cart){
		//default: lay city khach nhap tren form
		//1: city khach chon khi vao site
		//2: city cua deal
		//3: city hoat dong
		switch(type){
			case 1:  return shop.cookie.get(shop.header.city.conf.city_cookie);
			case 2:  return cart.conf.user.city;
			case 3:  return jQuery('.currentBg').attr('id');
			default: return cart.conf.cart.cart.province_id;
		}
	},
	getCity:function(deal_city, province){
		var cookie_city = shop.cookie.get(shop.header.city.conf.city_cookie),
		url_city = jQuery('.currentBg').attr('id');
		if(province == 0){
			return cookie_city;
		}
		if(deal_city){
			return url_city;
		}
		return cookie_city;
	},
	getOffice:function(oid, cart){
		var city = shop.cLib.getCity(true, cart.conf.cart.cart.province_id);
		if(cart.conf.office && shop.is_exists(cart.conf.office[city])){
			var office = cart.conf.office[city];
			for(var i in office){
				if(office[i].id == oid){
					return office[i];
				}
			}
		}
		return false;
	},
	getShipFee:function(cart){
		var ship = parseInt(cart.conf.shipping.fee);
		if(ship > 0 && cart.conf.shipping.in_area == 0){
			ship += parseInt(cart.conf.shipping.more_fee);
		}
		return ship;
	},
	inArea:function(cart){return cart.conf.shipping.in_area == 1},
	isCOD:function(cart){ return cart.conf.shipping.COD},
	isGOLD:function(cart){ return cart.conf.user.type == 'customer' },
	isMultiPrice:function(id, cart){
		return shop.is_exists(cart.conf.extra[id]) && cart.conf.extra[id].length > 1;
	},
	guest:{
		cookie_name:{
			fullname: 'guest_fullname',
			email: 'guest_email',
			mobile_phone: 'guest_mobile_phone',
			address: 'guest_address',
			street: 'guest_street',
			ward: 'guest_ward',
			district: 'guest_district',
			city: 'guest_city',
			note: 'guest_note'
		},
		update:function(u,cart){
			if(u){
				if(shop.is_exists(u.fullname) && u.fullname != ''){
					cart.conf.user.fullname = u.fullname;
				}
				if(shop.is_exists(u.email) && u.email != ''){
					cart.conf.user.email = u.email;
				}
				if(shop.is_exists(u.mobile_phone) && u.mobile_phone != ''){
					cart.conf.user.mobile_phone = u.mobile_phone;
				}
				if(shop.is_exists(u.type) && (u.type == 'guest' || u.type == 'customer')){
					cart.conf.user.type = u.type;
				}
				if(shop.is_exists(u.address) && u.address != ''){
					cart.conf.user.address = u.address;
				}
				if(shop.is_exists(u.district) && u.district != ''){
					cart.conf.user.district = u.district;
				}
				if(shop.is_exists(u.street) && u.street != ''){
					cart.conf.user.street = u.street;
				}
				if(shop.is_exists(u.ward) && u.ward != ''){
					cart.conf.user.ward = u.ward;
				}
				if(shop.is_exists(u.note) && u.note != ''){
					cart.conf.user.note = u.note;
				}
				if(shop.is_exists(u.city) && u.city != ''){
					cart.conf.user.city = u.city;
				}
			}
		},
		restore:function(cart){
			var guest = shop.cLib.guest.cookie_name,
			u = {
				fullname: shop.cookie.get(guest.fullname),
				email: shop.cookie.get(guest.email),
				mobile_phone: shop.cookie.get(guest.mobile_phone),
				address: shop.cookie.get(guest.address),
				street: shop.cookie.get(guest.street),
				ward: shop.cookie.get(guest.ward),
				district: shop.cookie.get(guest.district),
				city: shop.cookie.get(guest.city),
				note: shop.cookie.get(guest.note)
			};
			shop.cLib.guest.update(u,cart);
		},
		save:function(u,cart){
			if(u){
				var year = 86400*30*12, guest=shop.cLib.guest.cookie_name;
				if(shop.is_exists(u.fullname)){
					shop.cookie.set(guest.fullname, u.fullname, year, '/');
				}
				if(shop.is_exists(u.email)){
					shop.cookie.set(guest.email, u.email, year, '/');
				}
				if(shop.is_exists(u.mobile_phone)){
					shop.cookie.set(guest.mobile_phone, u.mobile_phone, year, '/');
				}
				if(shop.is_exists(u.type)){
					cart.conf.user.type = u.type;
				}
				if(shop.is_exists(u.address) && u.address != ''){
					shop.cookie.set(guest.address, u.address, year, '/');
				}
				if(shop.is_exists(u.street) && u.street != ''){
					shop.cookie.set(guest.street, u.street, year, '/');
				}
				if(shop.is_exists(u.ward) && u.ward != ''){
					shop.cookie.set(guest.ward, u.ward, year, '/');
				}
				if(shop.is_exists(u.district) && u.district != ''){
					shop.cookie.set(guest.district, u.district, year, '/');
				}
				if(shop.is_exists(u.note) && u.note != ''){
					shop.cookie.set(guest.note, u.note, year, '/');
				}
				if(shop.is_exists(u.city) && u.city != ''){
					shop.cookie.set(guest.city, u.city, year, '/');
				}
			}
		}
	},
	cardSuggest:function(number, cardList, rate, bug){
		if(number > 0){
			var stop = 0, temp = 0, idx = 0, need = {}, i = 0;
			//cong them gold do triet khau
			number = Math.ceil(number/rate);
			while(stop == 0){
				if(number < cardList[0]){
					stop = 1;
					if(number > 0){
						if(shop.is_exists(need[cardList[0]])){
							need[cardList[0]]++;
						}else{
							need[cardList[0]] = 1;
						}
					}
				}else{
					for(i=0;i<cardList.length;i++){
						if((number < cardList[i]) || (i == cardList.length-1)){
							idx = i;
							if(number < cardList[i]){
								idx = i-1;
							}
							if(number < cardList[i] && number > cardList[idx]){
								idx = i;
								number = 0;
								if(shop.is_exists(need[cardList[idx]])){
									need[cardList[idx]]++
								}else{
									need[cardList[idx]] = 1;
								}
							}else{
								temp = Math.floor(number/cardList[idx]);
								number = number - temp*cardList[idx];
								need[cardList[idx]] = temp;
							}
							break;
						}
					}
				}
			}
			if(bug){
				bug = '';
				for(i in need){
					bug += '<div class="mTop5 mLeft10">- <b>'+need[i]+'</b> thẻ mệnh giá <span style="color:red">'+shop.numberFormat(i,0,'','.')+'</span> đ</div>';
				}
				jQuery('body').prepend(bug);
			}
			return need;
		}
		return false;
	}
};