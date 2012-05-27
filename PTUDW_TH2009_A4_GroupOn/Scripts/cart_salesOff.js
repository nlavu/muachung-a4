shop.saleOff = {
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
		shipping:{active:false, COD:true, fee:0, fee_f:'0 đ', note:'', check: false, code:'SHIP', codNote: '', codShipType:'', office: '', in_area: 1, more_fee: 20000},
		item_id: 0,
		addbook: false,
		office_id: 0,
		office: null
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
			shop.saleOff.conf.item_id = id;
			//reset extra
			for(var i = 0; i< shop.saleOff.conf.extra[id].length; i++){
				shop.saleOff.conf.extra[id][i]['number'] = 0;
			}
			shop.saleOff.showExtra(id, shop.saleOff.conf.extra[id]);
		}
	},
	doAddItem:function(item_id, type){
		shop.cLib.guest.restore(shop.saleOff);
		var price_id = [], quan = [], extra = shop.saleOff.conf.extra[item_id];
		for(var i in extra){
			price_id[price_id.length] = extra[i]['price_id'];
			quan[quan.length] = extra[i]['number'];
		}
		shop.ajax_popup("act=sale-off&code=order",'POST',{id: item_id, price_id: price_id, quantity: quan},
		function(json){
			if(json.err == 0){
				//gan du lieu shipping
				var office = json.order.cart.cod_office;
				shop.saleOff.conf.shipping.fee = parseInt(json.order.cart.fee_shipping);
				shop.saleOff.conf.shipping.fee_f = parseInt(json.order.cart.fee_shipping_f);
				shop.saleOff.conf.shipping.note = parseInt(json.order.cart.note);
				shop.saleOff.conf.shipping.office = office.split(',');
				shop.saleOff.conf.shipping.active = (shop.saleOff.conf.shipping.fee >= 0) && (shop.saleOff.conf.shipping.note != '');

				//gan du lieu
				shop.saleOff.conf.cart = json.order;
				
				//thong tin van phong
				shop.saleOff.conf.office = json.office;
				
				//cap nhat lai thong tin nguoi mua hang
				shop.cLib.guest.update(json.user, shop.saleOff);
				if(json.user.type == 'customer'){
					shop.saleOff.conf.customer = json.user;
					shop.saleOff.conf.customer.gold = parseInt(shop.saleOff.conf.customer.gold);
					shop.saleOff.conf.card_rate = json.card_rate;
				}
				if((type == 'visa') ||
				   (type == 'atmOnline') ||
				   (type == 'cod' && shop.saleOff.isCOD()) ||
				   (type == 'mcard' && shop.saleOff.isGOLD())
				){
					shop.saleOff.conf.cart.payment_id = type;
				}
				shop.saleOff.stepZero();
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
					case 'quantity':
						var html = '';
						for(var i in json.code){
							if(json.code[i][1] >= json.code[i][0]){
								html += '<div class="mTop5"><b><em>'+json.code[i][2]+'</em></b> đã bán hết</div>';
							}else{
								html += '<div class="mTop5"><b><em>'+json.code[i][2]+'</em></b> chỉ còn <b>'+(json.code[i][0]-json.code[i][1])+'</b> sản phẩm</div>';
							}
						}
						shop.error.set('', '<div  style="font-weight:normal">'+html+'</div>', 560, '#formQuantity');
					break;
				}
			}
		});
	},

//	--------------------------------- showing popup -------------------------------- //

	showExtra:function(item_id, extra){
		shop.show_overlay_popup('cart-extra','Chọn mua',
		shop.saleOff.theme.extra('cart-extra','Chọn mua',extra,item_id),
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
				'width'   : '640px',
				'font-size': '12px'
			},
			release:function(){
				jQuery('#formQuantity').jNice();
				shop.saleOff.theme.newPrice(item_id);
			}
		});
	},
	stepZero:function(){
		shop.show_overlay_popup('cart-regulations','Chọn hình thức thanh toán',
		shop.saleOff.theme.stepZero('cart-regulations','Chọn hình thức thanh toán'),
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
				jQuery('.paymentChooseType').click(function(){shop.cTheme.choosePayment(this, shop.saleOff)})
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
			shop.saleOff.conf.addbook = true;
		}
		var tpl = shop.saleOff.theme.stepOne('cart-check-out-step1', 'Nhập thông tin cá nhân');
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
					if(!shop.saleOff.conf.addbook){
						shop.district.loadDistrictDropdown(shop.saleOff.conf.user.city, 'listDistrict', function(def){
							if(shop.is_exists(shop.district.listDistrictDropdown[def].in_area)){
								shop.saleOff.conf.shipping.in_area = shop.district.listDistrictDropdown[def].in_area;
							}
						}, shop.saleOff.conf.user.district);
					}
				}
			});
		}
	},
	stepTwo:function(district_id, city_id){
		//valid lai truong text tranh undefined
		if(shop.saleOff.conf.user.address == '' || shop.saleOff.conf.user.address == null || shop.saleOff.conf.user.address == 'undefined' || shop.saleOff.conf.user.address == undefined ||
		   shop.saleOff.conf.user.street == '' || shop.saleOff.conf.user.street == null || shop.saleOff.conf.user.street == 'undefined' || shop.saleOff.conf.user.street == undefined)
		{
			if(district > 0){
				alert('Thông tin địa chỉ chưa chính xác! Quý khách vui lòng nhập lại');
				return;
			}
		}
		if(district_id > 0){
			//Neu chon nhan hang tai van phong thi phai kiem tra xem tinh thanh co ho tro khong
			var district = district_id;
			for(var i in shop.saleOff.conf.shipping.office){
				if(shop.saleOff.conf.shipping.office[i] == district){
					district = 0; break;
				}
			}
			if(district > 0){
				alert('Quận/Huyện Quý khách đã chọn không hỗ trợ hình thức nhận hàng tại Văn Phòng');
				return;
			}
		}

		var tpl = shop.saleOff.theme.stepTwo('cart-check-out-step2', 'Mua hàng');
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
					shop.JT_init();

					jQuery('.rightInfo').hover(
						function(){
							jQuery(this).addClass('rightInfoActive');
						},
						function(){
							jQuery(this).removeClass('rightInfoActive');
						}
					).click(function(){
						jQuery('#office'+this.id).attr('checked', 'checked');
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
		shop.saleOff.theme.stepThree('cart-confirm','Thanh Toán'),
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
		// Su dung lai ham notify tu ben shop.cart
		//shop.cart.notifyItemIsBought(shop.saleOff.conf.cart.cart.id);
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

	processExtra:function(item_id){
		var next_step = false, extra = shop.saleOff.conf.extra[item_id];
		for(var i=0; i<extra.length; i++){
			if(shop.is_exists(extra[i]['number']) && extra[i]['number'] > 0){
				next_step = true;
				break;
			}
		}
		if(next_step){
			shop.saleOff.doAddItem(item_id, '')
		}else{
			shop.error.set('', '<div  style="font-weight:normal">Quý khách chưa chọn mua sản phẩm nào</div>', 560, '#formQuantity');
		}
	},
	processStepZero:function(){
		if(!jQuery('.paymentChooseType').hasClass('clicked')){
			alert('Quý khách chưa chọn hình thức thanh toán');
			return;
		}
		shop.saleOff.conf.cart.payment_id = jQuery('.clicked').attr('id');
		if(shop.saleOff.conf.cart.payment_id=='visa' || shop.saleOff.conf.cart.payment_id=='atmOnline'){
			shop.saleOff.conf.cart.payment = 1;
		}else if(shop.saleOff.conf.cart.payment_id=='mcard'){
			shop.saleOff.conf.cart.payment = 2;
			if(shop.saleOff.conf.customer.active == 0){
				alert('Quý khách vui lòng kích hoạt Email trước khi chọn mua hàng bằng Ví MuaChung');
				shop.hide_overlay_popup('cart-regulations');
				shop.customer.register.sendActiveEmail(shop.saleOff.conf.customer.email, 1);
				return;
			}
		}else{
			shop.saleOff.conf.cart.payment = 0;
			if(shop.saleOff.conf.cart.payment_id=='cod' && (shop.saleOff.conf.customer.active == 0 || shop.saleOff.conf.customer.active_phone == 0)){
				shop.hide_overlay_popup('cart-regulations');
				shop.cTheme.showActivePhoneWarning(shop.saleOff.conf.customer.active, shop.saleOff.conf.customer.active_phone, shop.saleOff);
				return;
				
			}
		}
		
		shop.saleOff.stepOne();
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
			if(address == ''){
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
			if(street == ''){
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
		shop.saleOff.conf.user.email = email;
		shop.saleOff.conf.user.fullname = fname;
		shop.saleOff.conf.user.mobile_phone = tel;
		shop.saleOff.conf.user.address = address;
		shop.saleOff.conf.user.street = street;
		shop.saleOff.conf.user.city = city;
		shop.saleOff.conf.user.district_id = district;
		shop.saleOff.conf.user.district = frm.district.options[frm.district.selectedIndex].innerHTML;
		shop.cLib.guest.save(shop.saleOff.conf.user, shop.saleOff);
		
		//tinh lai noi vung, ngoai vung
		if(shop.is_exists(shop.district.listDistrictDropdown[district].in_area)){
			shop.saleOff.conf.shipping.in_area = shop.district.listDistrictDropdown[district].in_area;
		}

		//go to next step
		if(shop.saleOff.conf.addbook){
			shop.ajax_popup('act=cart&code=addbook',"POST",shop.saleOff.conf.user,
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
				shop.saleOff.conf.addbook = false;
				shop.saleOff.stepTwo(district);
			});
		}else{
			shop.saleOff.stepTwo(district);
		}
	},
	processStepTwo:function(){
		var note = '';
		shop.saleOff.conf.office_id = 0;
		jQuery('.radio_ship').each(function(){
			if(this.checked && shop.saleOff.conf.office_id == 0){
				shop.saleOff.conf.office_id = this.value;
			}
		});
		if(shop.saleOff.conf.office_id <= 0){
			alert('Quý khách vui lòng chọn địa điểm văn phòng đến nhận hàng');return;
		}
		office = shop.cLib.getOffice(shop.saleOff.conf.office_id, shop.saleOff)
		if(!office){
			alert('Quý khách vui lòng chọn địa điểm văn phòng đến nhận hàng');return;
		}

		shop.saleOff.stepThree();
	},
	processStepThree:function(){
		if(shop.saleOff.conf.user.type == 'guest' && !shop.get_ele('check-regulations').checked){
			alert('Quý khách chưa tích vào mục đã đọc và đồng ý các điều khoản và quy định của MuaChung.vn');
			return;
		}
		var post, card = shop.saleOff.conf.cart.payment, note =  '',		 
		city = shop.saleOff.conf.user.city,
		district = shop.saleOff.conf.user.district,
		address = shop.saleOff.conf.user.address,
		street = shop.saleOff.conf.user.street,
		g_note = shop.saleOff.conf.user.note;

		if(city == 0 || district == '' || address == ''){
			alert('Vui lòng kiểm tra lại thông tin giao hàng.\nHiện tại đang thiếu thông tin: '+(address==''?' Địa chỉ.':'')+(district==''?' Quận/Huyện/Phường.':'')+(city<=0?' Tỉnh/Thành phố.':''));
			return;
		}

		if(shop.saleOff.conf.cart.payment_id == 'cod'){
			note = 'Ch%E1%BB%8Dn+h%C3%ACnh+th%E1%BB%A9c+COO+';
			if(shop.saleOff.conf.shipping.codShipType != 'coupon'){
				note += 's%E1%BA%A3n+ph%E1%BA%A9m';
			}else{
				note += 'th%E1%BA%BB+c%C3%A0o';
			}
		}

		post = {
			fullname:shop.saleOff.conf.user.fullname,
			tel:shop.saleOff.conf.user.mobile_phone,
			email:shop.saleOff.conf.user.email,
			item_id: shop.saleOff.conf.cart.cart.id,
			paymentType: card,
			adminNote:note,
			city: city,
			district: district,
			address: address,
			street: street,
			ward: '',
			note: g_note,
			office_id: shop.saleOff.conf.office_id
		};
		//submit
		shop.saleOff.finishSubmit(post);
	},
	finishSubmit:function(post){
		shop.ajax_popup('act=sale-off&code=finish',"POST",post,
		function(j){
			if(j.err == 0)	{
				shop.saleOff.conf.cart.payment == 2
				switch(post.paymentType){
					case 0:
						shop.saleOff.stepFinish();
						shop.redirect(j.url);
						break;
					case 1:
						shop.saleOff.conf.cart = j;
						jQuery('body').append(shop.saleOff.theme.paymentViSa());
						jQuery('#checkoutSoHa').submit();
						break;
					case 2:
						if(shop.is_exists(j.more_gold)){
							shop.saleOff.conf.card_post = post;
							shop.saleOff.conf.customer.gold = j.gold;
							shop.saleOff.conf.customer.more_gold = j.more_gold;
							shop.saleOff.conf.cart.total = j.total;
						}else{
							shop.saleOff.stepFinish();
							shop.redirect(j.url);
						}
						break;
				}
			}else{
				switch(j.msg){
					case 'invalid_min': j.msg = 'Bạn phải mua tối thiểu '+shop.saleOff.conf.cart.cart.min_order+' sản phẩm'; break;
					case 'invalid_quantity':
						j.msg = 'Sản phẩm đã bán hết';
						if(j.quantity > 0){
							j.msg = 'Chỉ còn '+j.quantity+' sản phẩm';
						}
					break;
					case 'cus_not_found': j.msg = 'Hiện tại bạn đang không đăng nhập.<br />Vui lòng tắt cửa sổ, mua lại'; break;
					case 'active_phone':case 'active_email':
						shop.hide_overlay_popup('cart-confirm');
						if(shop.saleOff.conf.cart.payment_id == 'cod'){
							var email = (j.msg == 'active_email' ? 0 : 1),
							phone = (j.msg == 'active_phone' ? 0 : 1);
							shop.cTheme.showActivePhoneWarning(email,phone,shop.saleOff);
						}else if(j.msg == 'active_email' && shop.saleOff.conf.cart.payment_id == 'mcard'){
							alert('Quý khách vui lòng kích hoạt Email trước khi chọn mua hàng bằng Ví MuaChung');
							shop.customer.register.sendActiveEmail(shop.saleOff.conf.customer.email, 1);
						}
					break;
				}
				shop.show_popup_message(j.msg,'Thông báo lỗi',-1);
			}
		});
	},

//	--------------------------------- cart theme -------------------------------- //

	theme:{
		extra:function(id, title, extra, item_id){
			if(extra){
				var extra_html = '', opt = '', moreInfo = '';
				for(var i=0;i<extra.length;i++){
					opt = '';
					if(parseInt(extra[i].buyer) < parseInt(extra[i].price_quantity)){
						for(var j=0;j<=extra[0].max;j++){
							opt += '<option value="'+j+'"'+((extra[i]['number'] && extra[i]['number']==j)?'selected':'')+'>'+j+'</option>';
						}
						opt = '<select id="quantity'+extra[i].price_id+'" style="width: 70px" onchange="shop.saleOff.theme.newOtp(this.value, '+extra[i].price_id+', '+item_id+')">'+opt+'</select>';
					}else{
						opt = '<img src="style/images/icon/soldout.gif" width="49" height="20" />';
					}
					if(!shop.is_exists(extra[i]['number'])){
						shop.saleOff.conf.extra[item_id][i]['number'] = 0;
					}
					extra_html += shop.join
					('<div class="'+(i==0?'bgBuyPop" id="pTop0':'bgBuyPopOdd')+'">')
						('<img src="'+extra[i].price_image+'" width="120" class="fl" />')
						('<div class="contentBuyPop fl mLeft20">')
							('<div class="newTitle">'+extra[i].price_title+'</div>')
							('<div class="detailBuyPop mTop5">Giá gốc <b>'+shop.numberFormat(extra[i].price, 0, '', '.')+'đ</b> - Giảm <strong>'+shop.numberFormat(extra[i].price_promotion, 0, '', '.')+'%</strong> - Tiết kiệm <strong>'+shop.numberFormat(extra[i].price_save_money, 0, '', '.')+'đ</strong></div>')
							('<div class="detailBuyPop2 mTop5">Giá bán: <b>'+shop.numberFormat(extra[i].price_save, 0, '', '.')+'đ</b></div>')
						('</div>')
						('<div class="fl jNice mTop20">'+opt+'</div>')
						('<div class="c"></div>')
					('</div>')();
				}
				if(IS_CUSTOMER_LOGIN == 0 && shop.saleOff.conf.user.type != 'customer'){
					moreInfo = '<div class="bgCartInfo">Hãy <a href="javascript:void(0)" onclick="shop.customer.login.show()">Đăng nhập</a> hoặc <a href="javascript:void(0)" onclick="shop.customer.register.show()">Đăng ký</a> khi mua hàng trên Muachung để được tặng tiền vào Ví tích lũy dùng mua hàng, quay số trúng thưởng.</div>';
				}
				extra_html = shop.join
				('<div class="content" id="formQuantity">')
					(moreInfo+'<div style="padding:10px 20px 20px"><div id="cError"></div>'+extra_html+'</div>')
				('</div>')
				('<div class="bgNextExtra">')
					('<div class="totalExtraPrice">Tổng tiền: <span id="totalExtraPrice">0 đ</span></div>')
					('<a href="javascript:void(0)" onclick="shop.saleOff.processExtra('+item_id+')" class="blueButton" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>')
					('<div class="c"></div>')
				('</div>')();
				return shop.popupSite(id, title, extra_html);
			}
			return '';
		},
		stepZero:function(id, title){
			var cod_title = '<span>(Không tặng tiền)</span>',
			type = shop.is_exists(shop.saleOff.conf.cart.payment_id)?shop.saleOff.conf.cart.payment_id:'',
			item_id = shop.saleOff.conf.cart.cart.id,
			notActive = '<div class="notActive"></div>',
			price_all = shop.saleOff.theme.newPrice(),
			gold_reward = price_all/100,
			gold_f = shop.numberFormat(gold_reward , 0, '', '.'),
			title_gold = '<span>(Được tặng '+gold_f+' đ vào Ví MuaChung)</span>',
			visaCard = shop.join
			('<div class="paymentChooseType sendOnline'+(type=='visa'?' pay_active clicked':'')+'" id="visa">')
				('<div class="arrowRight">')
					('<div class="radioBox"><input type="radio" name="radio_pay" id="radio_visa" value="visa" '+(type=='visa'?'checked':'')+' /></div>')
					('<div class="paymentContent">')
						('<div class="paymentTitle">Thanh toán bằng thẻ Visa hoặc MasterCard '+title_gold+'</div>')
						('<div class="paymentText">Thanh toán nhanh gọn và có thể mua hàng hoặc sử dụng ngay dịch vụ sau khi thanh toán.</div>')
						('<div class="creditPay bankPay">')
							('<span id="visa"></span>')
							('<span id="master"></span>')
							('<div class="c"></div>')
						('</div>')
					('</div>')
					('<div class="c"></div>')
					('<ul class="paymentText paymentGuide'+(type=='visa' ? '' : ' hidden')+'">')
						('<li>Không mất phí thanh toán</li>')
						('<li>Thanh toán nhanh gọn và có thể sử dụng dịch vụ ngay sau khi thanh toán.</li>')
					('</ul>')
				('</div>')
			('</div>')(),
			atmOnline = shop.join
			('<div class="paymentChooseType amtOnline'+(type=='atmOnline'?' pay_active clicked':'')+'" id="atmOnline">')
				('<div class="arrowRight">')
					('<div class="radioBox"><input type="radio" name="radio_pay" id="radio_atmOnline" value="atmOnline" '+(type=='atmOnline'?'checked':'')+' /></div>')
					('<div class="paymentContent">')
						('<div class="paymentTitle">Chuyển khoản Online '+title_gold+'</div>')
						('<div class="paymentText">Thanh toán nhanh gọn và có thể mua hàng hoặc sử dụng ngay dịch vụ sau khi thanh toán.</div>')
						('<div class="creditPay bankPay">')
							('<a class="fl" href="javascript:void(0)"><span id="vcb"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="donga"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="techcom"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="vietin"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="vib"></span></a>')
							('<a class="fl" href="javascript:void(0)"><span id="hd"></span></a>')
							('<div class="c"></div>')
							('<div class="mTop10">')
								('<a class="fl" href="javascript:void(0)"><span id="tp"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="shb"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="exim"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="mari"></span></a>')
								('<a class="fl" href="javascript:void(0)"><span id="vieta"></span></a>')
								('<div class="c"></div>')
							('</div>')
						('</div>')
					('</div>')
					('<div class="c"></div>')
					('<ul class="paymentText paymentGuide'+(type=='atmOnline' ? '' : ' hidden')+'">')
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
					('<ul class="paymentText paymentGuide'+((type=='mcard' && shop.cLib.isGOLD(shop.saleOff)) ? '' : ' hidden')+'">')
						('<li>Tiền trong Ví MuaChung có được do Quý khách đã mua sản phẩm trước đó hoặc sử dụng chức năng loan tin.</li>')
						('<li>Quý khách có thể nhờ người khác <a onclick="shop.gold.rechargeStep1(true)" href="javascript:void(0)">nạp hộ tiền</a> vào Ví của Quý khách bằng chức năng <a onclick="shop.gold.rechargeStep1()" href="javascript:void(0)">Nạp Tiền</a> trong trang cá nhân.</li>')
					('</ul>')
				('</div>')
			('</div>')(),
			cod = shop.join
			('<div class="paymentChooseType sendCod'+(type=='cod'?' pay_active clicked':'')+'" id="cod">')
				('<div class="arrowRight pBottom10">')
					('<div class="radioBox"><input type="radio" name="radio_pay" id="radio_cod" value="cod" '+(type=='cod'?'checked':'')+' /></div>')
					('<div class="paymentContent">')
						('<div class="paymentTitle">Nhận Phiếu/Sản phẩm và thanh toán tại văn phòng MuaChung '+cod_title+'</div>')
						('<div class="paymentText">Sau khi đặt hàng, Quý khách có thể đến văn phòng của MuaChung tại khu vực gần nhất để lấy sản phẩm.</div>')
					('</div>')
					('<div class="c"></div>')
					('<ul class="paymentText paymentGuide">')
						('<li>Thời gian làm việc từ 9h - 18h các ngày trong tuần từ thứ 2 - sáng thứ 7</li>')
						('<li>Vui lòng xem địa chỉ liên hệ của văn phòng MuaChung dưới chân trang</li>')
					('</ul>')
				('</div>')
			('</div>')(),
			payment = visaCard + atmOnline + mcard + cod;
			var btBack = '';
			if(item_id > 0 && shop.cLib.isMultiPrice(item_id, shop.saleOff)){
				btBack = '<a href="javascript:void(0)" onclick="shop.saleOff.showExtra('+item_id+', shop.saleOff.conf.extra['+item_id+'])" id="fr" class="blueButton mRight20"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>';
			}
			return shop.popupSite(id, title, shop.join
			('<div class="content" style="padding:0 0 10px">'+payment)
				('<div class="c"></div>')
				('<div align="center" class="mRight20 mTop10">')
					('<a href="javascript:void(0)" onclick="shop.saleOff.processStepZero()" class="blueButton" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>'+btBack)
					('<div class="c"></div>')
				('</div>')
			('</div>')());
		},
		stepOne:function(id, title){
			var fname = shop.join
			('<tr>')
				('<td width="85" class="bold">Họ và tên:</td>')
				('<td><input type="text" id="cart_fullname" name="fullname" value="'+(shop.saleOff.conf.user.fullname&&!shop.saleOff.conf.addbook ? shop.saleOff.conf.user.fullname : '')+'" /></td>')
			('</tr>')(),
			phone = shop.join
			('<tr>')
				('<td class="bold">ĐT di động:</td>')
				('<td><input type="text" id="cart_tel" name="tel" value="'+(shop.saleOff.conf.user.mobile_phone&&!shop.saleOff.conf.addbook ? shop.saleOff.conf.user.mobile_phone : '')+'" maxlength="20" onkeypress="return shop.numberOnly(this, event)" /></td>')
			('</tr>')(),
			email = shop.join
			('<tr>')
				('<td class="bold">Email:</td>')
				('<td><input type="text" id="cart_email" name="email" value="'+(shop.saleOff.conf.user.email&&!shop.saleOff.conf.addbook ? shop.saleOff.conf.user.email : '')+'" /></td>')
			('</tr>')(),
			address = shop.join
			('<tr>')
				('<td width="85" class="bold">Địa chỉ:</td>')
				('<td><input type="text" id="cart_address" name="address" style="width:445px" value="'+(shop.saleOff.conf.user.address&&!shop.saleOff.conf.addbook ? shop.saleOff.conf.user.address : '')+'" /></td>')
			('</tr>')(),
			street = shop.join
			('<tr>')
				('<td class="bold">Đường/Phố:</td>')
				('<td><input type="text" id="cart_street" name="street" value="'+(shop.saleOff.conf.user.street&&!shop.saleOff.conf.addbook ? shop.saleOff.conf.user.street : '')+'" /></td>')
			('</tr>')(),
			city = '',
			district = shop.join
			('<tr>')
				('<td class="bold" id="disTitle">Quận/Huyện:</td>')
				('<td><select id="listDistrict" name="district"></select></td>')
			('</tr>')(),
			cityList = '<select name="city" id="cart_city" onchange="shop.district.loadDistrictDropdown(this.value, \'listDistrict\', shop.saleOff.theme.changeCity, \''+((shop.saleOff.conf.user.type == 'customer') ? shop.saleOff.conf.customer.district : shop.saleOff.conf.user.district)+'\')">';
			
			//make city list
			cityList+= '<option value="0">--- Chọn ---</option>';
			for(var i in city_list){
				cityList += '<option value="'+city_list[i].id+'"'+(shop.saleOff.conf.user.city==i&&!shop.saleOff.conf.addbook?' selected':'')+'>'+city_list[i].title+'</option>';
			}
			cityList += '</select>';
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
								('<a href="javascript:shop.cAddress.stepAddress(shop.saleOff)" class="addBookCtrl fr">Lấy trong danh bạ</a>')
								('<div class="text_tit">Thông tin mua hàng của Quý khách:</div>')
								('<div style="padding-left:35px">')
									('<table cellpadding="3" cellspacing="0" border="0">'+fname+phone+email+'</table>')
								('</div>')
							('</div>')
							('<div class="infoAddress mTop20">')
								('<div class="text_tit">Địa chỉ nhận hàng:</div>')
								('<div style="padding-left:35px">')
									('<table cellpadding="3" cellspacing="0" border="0">'+address+street+city+district+'</table>')
								('</div>')
							('</div>')
							('<div class="c"></div>')
						('</div>')
					('</form>')
					('<div class="mTop10">')
						('<a href="javascript:void(0)" onclick="shop.saleOff.processStepOne()" class="blueButton mLeft10" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>')
						('<a href="javascript:void(0)" onclick="shop.saleOff.stepZero()" class="blueButton" id="fr"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
						('<div class="c"></div>')
					('</div>')
					('<div class="c"></div>')
				('</div>')
			('</div>')());
		},
		stepTwo:function(id, title){
			var note_title = 'Vui lòng cho chúng tôi biết thời gian nhận hàng trong ngày hoặc Ghi chú thêm...', ship_type = '';
			//fix rieng cho Nha Trang
			var uCity = shop.cLib.getCity(true, shop.saleOff.conf.cart.cart.province_id),
			office = shop.saleOff.conf.office[uCity],map = '',
			def = shop.saleOff.conf.office_id;
			for(var i in office){
				if(shop.is_exists(office[i].id)){
					map = '';
					if(office[i].map){
						map = ' - <a href="javascript:void(0)" class="jTip" id="'+office[i].id+'">Xem bản đồ</a>';
						map += '<span class="content'+office[i].id+' hidden"><img src="'+office[i].map+'" width="550" /></span>';
					}
					ship_type+= shop.join
					('<div class="pTop10">')
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
			if(ship_type != ''){
				ship_type = shop.join
				('<div class="infoCart pTop10">')
					('<div class="text_tit">Nhận hàng tại văn phòng MuaChung</div>')
					('<div class="infoShipType">'+ship_type+'</div>')
				('</div>')();
			}

			return shop.popupSite(id, title, shop.join
			('<div class="content buy_cart_form" style="padding:0">')
				('<form name="cartBuyForm" id="cartBuyForm">'+ship_type+'</form>')
				('<div style="padding:50px 20px 10px">')
					('<a href="javascript:void(0)" onclick="shop.saleOff.processStepTwo()" class="blueButton mLeft10" id="fr"><span><span>TIẾP TỤC <b>&raquo;</b></span></span></a>')
					('<a href="javascript:void(0)" onclick="shop.saleOff.stepOne()" class="blueButton" id="fr"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
					('<div class="c"></div>')
				('</div>')
				('<div class="c"></div>')
			('</div>')());
		},
		stepThree:function(id, title){
			var paymentViSa = '', data =shop.saleOff.conf.cart.cart, note='', t='', logo='', bt_checkout='ĐẶT HÀNG',
			list = '',
			extra = shop.saleOff.conf.extra[shop.saleOff.conf.item_id],
			total = 0,
			item_price = 0,
			counter = 0;
			//danh sach san pham
			for(var i=0;i<extra.length;i++){
				if(extra[i].number > 0){
					counter++;
					item_price = extra[i].price_save*extra[i].number;
					total += item_price;
					list += shop.join
					('<tr>')
						('<td valign="top" align="center" class="item bRight">'+counter+'</td>')
						('<td valign="top" class="item bRight">'+extra[i].price_title+'</td>')
						('<td valign="top" align="right" class="item bRight">'+shop.numberFormat(extra[i].price_save,0,'','.')+' đ</td>')
						('<td valign="top" align="center" class="item bRight">'+extra[i].number+'</td>')
						('<td valign="top" align="right" class="item">'+shop.numberFormat(item_price,0,'','.')+' đ</td>')
					('</tr>')();
				}
			};
			
			if(shop.saleOff.conf.cart.payment == 1){
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
			}else if(shop.saleOff.conf.cart.payment == 2){
				var moreGold = '', suggest = '',total_fix = total - total/100;
				if(shop.saleOff.conf.customer.gold < total_fix){
					moreGold = total_fix -shop.saleOff.conf.customer.gold;
					moreGold = shop.numberFormat(moreGold, 0, '', '.');
					moreGold = 'Quý khách phải nạp thêm: <b style="color:red">'+moreGold+'</b> đ';
					suggest = 'nap them';
					bt_checkout = '';
				}else{
					moreGold =shop.saleOff.conf.customer.gold-total;
					moreGold = shop.numberFormat(moreGold, 0, '', '.');
					moreGold = 'Sau khi thanh toán Quý khách còn: <b style="color:red">'+moreGold+'</b> đ';
					bt_checkout = 'THANH TOÁN';
				}
				t = "Thanh toán bằng Ví MuaChung";
				logo = '';
				note = shop.join
				('<div class="mLeft25" style="width:720px">')
					('<div>- Hiện tại của Quý khách đang có: <b>'+shop.numberFormat(shop.saleOff.conf.customer.gold, 0, '', '.')+'</b> đ</div>')
					('<div class="mTop5">- Đơn hàng này có giá trị tương ứng với: <b>'+shop.numberFormat(total, 0, '', '.')+'</b> đ</div>')
					('<div class="mTop5">- Khi thanh toán, Quý khách sẽ được cộng vào ví: <b>'+shop.numberFormat(total/100, 0, '', '.')+'</b> đ</div>')
					('<div class="mTop5 mBottom10">- '+moreGold+'</div>'+(suggest != '' ? '<a href="javascript:void(0)" onclick="shop.gold.rechargeStep1()" id="fl" class="blueButton"><span><span>NẠP TIỀN</span></span></a><div class="c"></div>' : ''))
				('</div>')();
			}else if(shop.saleOff.conf.cart.payment_id == 'cod'){
				var office = shop.cLib.getOffice(shop.saleOff.conf.office_id, shop.saleOff)
				t = "Lên văn phòng MuaChung nhận hàng/phiếu và trả tiền";
				note = shop.join
				('<div style="width:720px"><b style="color:red">Văn Phòng: </b>'+office.name+' - ĐC: '+office.address+' - ĐT: '+office.tel+'</div>')();
				logo = '';
			}

			var regulations =shop.saleOff.conf.user.type == 'guest' ? shop.join
			('<div class="mTop10" style="font-size:16px;width:758px">')
				('<input type="checkbox" id="check-regulations" class="checkbox" checked />')
				('<label for="check-regulations">')
					('<strong>Tôi đã đọc và đồng ý với các <a href="trang-the-le.html" target="_blank">điều khoản</a> và <a href="trang-quy-dinh-refund.html"  target="_blank">quy định</a> của MuaChung.vn</strong>')
				('</label>')
			('</div>')() : '';
			total = shop.numberFormat(total,0,'','.')+' đ';
			list += '<tr><td align="right" class="item total-all" colspan="6">Tổng tiền = <span id="total-all">'+total+'</span></td></tr>';
			
			return shop.popupSite(id, title, shop.join
			('<div class="content" style="padding:10px 20px">')
				('<div class="box-gradien pBottom10 pTop15" style="*width:713px">')
					('<div class="title">Thông tin khách hàng</div>')
					('<div class="content" id="pTop10">')
						('<div><strong>Họ tên:</strong> <span class="cff9200">'+shop.saleOff.conf.user.fullname+'</span></div>')
						('<div class="mTop5"><strong>Email:</strong> <span class="cff9200">'+shop.saleOff.conf.user.email+'</span></div>')
						('<div class="mTop5"><strong>Điện thoại di động:</strong> <span class="cff9200">'+shop.saleOff.conf.user.mobile_phone+'</span></div>')
						('<a href="javascript:void(0)" onclick="shop.saleOff.stepOne()" class="blueButton" id="fr"><span><span>SỬA THÔNG TIN CÁ NHÂN</span></span></a>')
						('<div class="c"></div>')
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
							('<th class="head bRight" width="80">Đơn Giá</th>')
							('<th class="head bRight" width="25">SL</th>')
							('<th class="head" width="80">Thành Tiền</th>')
						('</tr></thead>'+list)
						('</table>')
					('</div>')
				('</div>'+regulations)
				('<div align="center" class="mTop10">'+(bt_checkout != '' ? '<a href="javascript:void(0)" onclick="shop.saleOff.processStepThree()" class="blueButton  mLeft10" id="fr"><span><span>'+bt_checkout+'</span></span></a>' : ''))
					('<a href="javascript:void(0)" onclick="shop.saleOff.stepOne()" id="fr" class="blueButton"><span><span><b>&laquo;</b> QUAY LẠI</span></span></a>')
					('<div class="c"></div>')
				('</div>')
			('</div>')());
		},
		paymentViSa:function(){
			return shop.join
			('<form id="checkoutSoHa" method="post" action="'+shop.saleOff.conf.cart.url+'">')
				('<input type="hidden" value="'+shop.saleOff.conf.cart.quantity+'" name="quantity" />')
				('<input type="hidden" value="'+shop.saleOff.conf.cart.order_id+'" name="id" />')
				('<input type="hidden" value="'+shop.saleOff.conf.cart.total+'" name="total" />')
				('<input type="hidden" value="'+shop.saleOff.conf.cart.good_name+'" name="good" />')
				('<input type="hidden" value="'+shop.saleOff.conf.cart.item_ids+'" name="item_ids" />')
				('<input type="hidden" value="'+shop.saleOff.conf.user.fullname+'" name="fullname" />')
				('<input type="hidden" value="'+shop.saleOff.conf.user.mobile_phone+'" maxlength="50" name="mobiphone" />')
				('<input type="hidden" value="'+shop.saleOff.conf.user.email+'" maxlength="50" name="email" />')
				('<input type="hidden" value="'+shop.saleOff.conf.user.id+'" maxlength="50" name="uid" />')
			('</form>')();
		},
		newPrice:function(item_id, text){
			item_id = item_id ? item_id : shop.saleOff.conf.item_id;
			var extra = shop.saleOff.conf.extra[item_id], price_all = 0;
			for(var i=0;i<extra.length;i++){
				if(extra[i]['number']){
					price_all += extra[i]['price_save']*extra[i]['number'];
				}
			}
			if(text == undefined){
				jQuery('#totalExtraPrice').html(shop.numberFormat(price_all,0,'','.')+' đ');
			}
			return price_all;
		},
		newOtp:function(number, price_id, item_id){
			var extra = shop.saleOff.conf.extra[item_id], price_all = 0;
			for(var i=0;i<extra.length;i++){
				if(extra[i]['price_id'] == price_id){
					shop.saleOff.conf.extra[item_id][i]['number'] = number;
					price_all += extra[i]['price_save']*number;
				}else{
					price_all += extra[i]['price_save']*extra[i]['number'];
				}
			}
			jQuery('#totalExtraPrice').html(shop.numberFormat(price_all,0,'','.')+' đ');
		}
	}
};