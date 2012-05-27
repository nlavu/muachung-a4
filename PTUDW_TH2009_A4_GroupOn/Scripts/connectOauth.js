var PopupManager={popup_window:null,interval:null,interval_time:80,waitForPopupClose:function(){if(PopupManager.isPopupClosed()){PopupManager.destroyPopup()}},destroyPopup:function(){this.popup_window=null;window.clearInterval(this.interval);this.interval=null},isPopupClosed:function(){return(!this.popup_window||this.popup_window.closed)},open:function(a,b,c,d){this.popup_window=window.open(a,(d?d:""),this.getWindowParams(b,c));this.interval=window.setInterval(this.waitForPopupClose,this.interval_time);return this.popup_window},getWindowParams:function(a,b){var c=this.getCenterCoords(a,b);return"width="+a+",height="+b+",status=1,location=1,scrollbars=yes,resizable=yes,left="+c.x+",top="+c.y},getCenterCoords:function(a,b){var c=this.getParentCoords();var d=this.getWindowInnerSize();var e=c.width+Math.max(0,Math.floor((d.width-a)/2));var f=c.height+Math.max(0,Math.floor((d.height-b)/2));return{x:e,y:f}},getWindowInnerSize:function(){var w=0;var h=0;if('innerWidth'in window){w=window.innerWidth;h=window.innerHeight}else{var a=null;if(('BackCompat'===window.document.compatMode)&&('body'in window.document)){a=window.document.body}else if('documentElement'in window.document){a=window.document.documentElement}if(a!==null){w=a.offsetWidth;h=a.offsetHeight}}return{width:w,height:h}},getParentCoords:function(){var w=0;var h=0;if('screenLeft'in window){w=window.screenLeft;h=window.screenTop}else if('screenX'in window){w=window.screenX;h=window.screenY}return{width:w,height:h}}};

//jQuery(document).ready(function(){oAuth.load()});

var oAuth = {
  conf:{
	is_login: IS_CUSTOMER_LOGIN,
	user: USER_COMMENT,
	baseUrl: BASE_URL,
	ajax: BASE_URL+'ajax.php',
	oauth: {
	  google:	{w:650,h:550,connect:0},
	  yahoo:	{w:500,h:550,connect:0},
	  twitter:	{w:570,h:500,connect:0},
	  facebook:	{w:650,h:600,connect:0}
	},
	item_id: 0,
	image: ''
  },
  load:function(){
	if((oAuth.conf.is_login == 0) && oAuth.conf.user.length != undefined){
	  var html = '';
	  for(var i in oAuth.conf.oauth){
		html += '<a href="javascript:void(0)" class="oauth-'+i+'" onclick="oAuth.connect(\''+i+'\')" title="Đăng nhập bằng nick '+i+'"></a>';
	  }
	  jQuery('#'+oAuth.conf.pool).html(html);
	}
  },
  connect:function(k){
	var url = oAuth.conf.baseUrl + 'oAuthConnect.php?act=first-run&key='+k+'&item_id='+oAuth.conf.item_id+'&q='+encodeURIComponent(query_string);
	PopupManager.open(url,380,305,'Shop Login');
  },
  startConnect: function(k, item_id){
	jQuery.ajax({
	  beforeSend:function(){
		oAuth.win.overlay('Đang kiểm tra dữ liệu...');
	  },
	  type: 'GET',
	  url : oAuth.conf.ajax+'?act=connect&mccode=connect&key='+k+'&item_id='+item_id,
	  dataType: 'json',
	  success: function(j){
		if(j.err == -1){
		  //oAuth.win.close();
		}else{
		  oAuth.connectOauth(j,oAuth.conf.oauth[k]);
		}
	  }
	});
  },
  connectOauth:function(j, s){
	s = s ? s : {w:600,h:450};
	if(j.cb){
	  oAuth.win.redirect(j.cb);
	}else{
	  oAuth.win.resize(s.w,s.h);
	  oAuth.win.redirect(j.url_login);
	}
  },
  loantin:function(item_id, button_id, now, img) {
	if(IS_CUSTOMER_LOGIN) {
	  shop.cookie.set('loantin_id', item_id, 60*60*24, '/');
	  shop.cookie.set('btnloantin_id', button_id, 60*60*24, '/');
	  oAuth.conf.item_id = item_id;
	  oAuth.conf.image = img;
	  
	  shop.show_overlay_popup('loantinConnect','Loan tin cho bạn bè',
		oAuth.theme.connectNext('loantinConnect','Loan tin cho bạn bè'),
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
			'width' : '490px',
			'font-size': '12px',
			'color': '#000'
		  }
		}
	  );
	}else {
	  shop.customer.login.show();
	}
  },
  doLoanTin:function(){
	var connect_fb = jQuery('#facebook').hasClass('facebook_connect') ? 1 : 0,
	connect_yahoo = jQuery('#yahoo').hasClass('yahoo_connect') ? 1 : 0,
	content = jQuery('#loantin_cm').val();
	if(connect_fb == 0 && connect_yahoo == 0){
	  alert('Quý khách chưa chọn loan tin lên đâu');
	  return false;
	}else{
		if(oAuth.conf.oauth.facebook.connect == 1 || oAuth.conf.oauth.yahoo.connect == 1) {
			var loantin_id = shop.cookie.get('loantin_id'),
			button_id = shop.cookie.get('btnloantin_id');
			if(button_id != undefined && button_id != ''){
			  if(jQuery("#"+button_id).hasClass('buttonLoantin')) {
				jQuery("#"+button_id).removeClass('buttonLoantin').addClass('buttonLoantined').click(function(){});
				var number = parseInt(jQuery('.buttonLoantinText', jQuery("#"+button_id).parent()).html())+1;
				jQuery('.buttonLoantinText', jQuery("#"+button_id).parent()).html(number);
			  }
			  else{
				jQuery("#"+button_id).removeClass('btn_loantin').addClass('btn_loantined').click(function(){});
				var number = parseInt(jQuery('#num', jQuery("#"+button_id).parent()).html())+1;
				jQuery('#num', jQuery("#"+button_id).parent()).html(number);
			  }
			}
			shop.hide_overlay_popup('loantinConnect');
		}
		
		shop.ajax_popup("act=connect&mccode=check-loantin", 'POST', {item_id: oAuth.conf.item_id, yahoo: connect_yahoo, facebook: connect_fb, content: content},
		  function(json){
			if(json.err != 0){
				if(shop.is_exists(json.facebook)){
				  oAuth.openLoginWindow(2);
				  return false;
				}else if(shop.is_exists(json.yahoo)){
				  oAuth.openLoginWindow(5);
				  return false;
				}else{
				  switch(json.msg){
					case 'done':
					  if(button_id != undefined && button_id != ''){
						if(jQuery("#"+button_id).hasClass('buttonLoantin')) {
						  jQuery("#"+button_id).removeClass('buttonLoantin').addClass('buttonLoantined').click(function(){});
						  jQuery('.buttonLoantinText', jQuery("#"+button_id).parent()).html(json.number);
						}
						else {
						  jQuery("#"+button_id).removeClass('btn_loantin').addClass('btn_loantined').click(function(){});
						  jQuery('#num', jQuery("#"+button_id).parent()).html(json.number);
						}
					  }
					  shop.hide_overlay_popup('loantinConnect');
					  alert('Quý khách đã loan tin này');
					break;
					case 'expired': alert('Không thể loan tin! Sản phẩm đã hết hạn'); break;
					case 'loading':
					  if(json.time > 0){
						alert('Không thể loan tin! Vui lòng chờ '+json.time+'s và thử lại');
					  }else{
						alert('Không thể loan tin! Vui lòng thử lại');
					  }
					break;
					case 'sess_expired':case 'not_login':
					  alert('Quý khách chưa đăng nhập');
					  shop.customer.login.show();
					break;
				  }
				}
			}
			return true;
		  }
		); 
	}
	return true;
  },
  connectDone: function(data){
	if(data){
	  oAuth.doLoanTin();
	}else{
	  alert('Mạng bị lỗi! Không thể kết nối được tài khoản');
	} 
  },
  isConnected:function(){
	return oAuth.conf.oauth.facebook.connect == 1 && oAuth.conf.oauth.yahoo.connect == 1;
  },
  openLoginWindow:function(type) {
	switch(type) {
	  case 2: type = "facebook"; break;
	  case 3: type = "twitter"; break;
	  case 5: type = "yahoo"; break;
	  default: type = "yahoo";
	}
	oAuth.connect(type);
  },
  resetConnect:function(obj){
	if(jQuery('#'+obj.id).hasClass(obj.id+'_connect')){
	  jQuery('#'+obj.id).removeClass(obj.id+'_connect');
	}else{
	  jQuery('#'+obj.id).addClass(obj.id+'_connect');
	}
  },
  theme:{
	connectNext:function(id, title){
	  var fb_connect = oAuth.conf.oauth.facebook.connect==1,
	  yahoo_connect  = oAuth.conf.oauth.yahoo.connect==1;

	  return shop.popupSite(id, title, shop.join
	  ('<div class="content" style="padding:15px">')
		('<div class="openid-login-small">')
		  ('<div class="fl f14" style="line-height:32px"><b>Bạn muốn loan tin lên?</b></div>')
		  ('<a id="facebook" onclick="oAuth.resetConnect(this)" href="javascript:void(0)" title="Loan tin bằng tài khoản Facebook" class="fl facebook'+(fb_connect?' facebook_connect':'')+'"></a>')
		  ('<a id="yahoo" onclick="oAuth.resetConnect(this)" href="javascript:void(0)" title="Loan tin bằng nick Yahoo tại Yahoo.com" class="fr yahoo'+(yahoo_connect?' yahoo_connect':'')+'"></a>')
		  ('<div class="c"></div>')
		('</div>')
		('<div align="center" class="mTop15">')
		  ('<div>')
			('<div class="fl" style="width:135px;overflow:hidden"><img src="'+oAuth.conf.image+'" width="135" /></div>')
			('<div class="fr" align="left">')
			  ('<div class="f14" style="color:#838383"><b>Bình luận của riêng bạn (nếu có)</b></div>')
			  ('<div class="mTop10"><textarea id="loantin_cm" style="width:295px;height:60px"></textarea></div>')
			('</div>')
			('<div class="c"></div>')
		  ('</div>')
		  ('<div class="mTop20">')
			('<a id="fr" class="blueButton" onclick="oAuth.doLoanTin();" href="javascript:void(0)"><span><span>Loan tin <b>»</b></span></span></a>')
			('<div class="c"></div>')
		  ('</div>')
		('</div>')
	  ('</div>')());
	}
  },
  autoConnectFB:function(user){
	jQuery.ajax({
	  type: 'POST',
	  url : oAuth.conf.ajax+'?act=connect&mccode=autoFB',
	  data: {
		id: user.id,
		avatar: 'https://graph.facebook.com/'+user.id+'/picture?type=small',
		fullname: user.name,
		prefix:	'facebook',
		email: '',
		profile: user.link,
		logout:''
	  },
	  dataType: 'json',
	  success: function(j){
		if(j.err != -1){
		  oAuth.conf.oauth.facebook.connect = 1;
		  oAuth.conf.oauth.facebook.reconnect = 0;
		}else{
		  oAuth.conf.oauth.facebook.connect = 0;
		  oAuth.conf.oauth.facebook.reconnect = 1;
		}
	  }
	});
  },
  win:{
	close:function(cb){
	  (cb!=undefined)&&cb;
	  window.close();
	},
	redirect:function(url){
	  oAuth.win.overlay("Hệ thống đang chuyển trang...");
	  window.location.href = url;
	},
	resize:function(w,h){
	  w = w ? w : 600;
	  h = h ? h : 435;
	  var o = oAuth.win.getCenterCoords(w,h);

	  window.resizeTo(w,h);
	  window.moveTo(o.x,o.y);
	},
	getCenterCoords: function (a, b) {
	  var c = oAuth.win.getCoords(),
		  d = oAuth.win.getOpenerSize(c);

	  var e = Math.floor((d.width  - a)/2),
		  f = Math.floor((d.height - b)/2);

	  return {
		x: e > 0 ? e : 0,
		y: f > 0 ? f : 0
	  }
	},
	getOpenerSize: function (o) {
	  return {
		width: (2*o.x + jQuery(document).width()),
		height: (2*o.y + jQuery(document).height())
	  }
	},
	getCoords: function () {
	  var x = 0;
	  var y = 0;
	  if ('screenLeft' in window) {
		x = window.screenLeft;
		y = window.screenTop
	  } else if ('screenX' in window) {
		x = window.screenX;
		y = window.screenY
	  }
	  return {
		x: x,
		y: y
	  }
	},
	overlay:function(msg){
	  var h = (jQuery(document).height() - 85) / 2,
		  c = jQuery('#vni_login_loading .msg');

	  if(c.html() != null){
		c.html(msg);
		document.getElementById('vni_login_overlay').style.display = 'block';
		document.getElementById('vni_login_loading').style.display = 'block';
	  }else{
		var html = '<div id="vni_login_overlay"></div><div id="vni_login_loading"><div class="msg" style="margin-top:'+h+'px">'+msg+'</div></div>';
		jQuery('body').prepend(html);
	  }
	}
  }
};

oAuth.loantinInfo = function(){
  var html = shop.popupSite('loantinInfo', 'Loan tin để nhận ngay 50 đ', shop.join
	  ('<div class="content p20 f14" style="color:#000">')
		('<div>Đây là cách giới thiệu bạn bè mua sản phẩm trên Muachung thông qua <b>Facebook</b> & <b>Yahoo</b></div>')
		('<div class="mTop10">Khi Quý khách Loan tin, thông tin sản phẩm sẽ được ghi lên <b>Tường của Facebook</b> & thay đổi <b>Trạng thái của Yahoo</b></div>')
		('<div class="mTop15"><img src="style/images/fixpage/demoloantin.jpg" width="498" height="245" border="0" alt="demo loan tin tren Facebook" /></div>')
		('<div class="mTop15">Muachung sẽ tặng Quý khách <b>50 đ</b> cho mỗi lần Loan tin (Mỗi sản phẩm chỉ được Loan tin 1 lần)</div>')
		('<div class="mTop15">Khi tích lũy đủ số tiền cần thiết vào Ví MuaChung, Quý khách có thể dùng Ví để mua hàng trên Muachung.vn</div>')
		('<div class="mTop20"><b>Hãy Loan tin để nhận ngay 50 đ từ MuaChung</b></div>')
	  ('</div>')());
  shop.show_overlay_popup('loantinInfo','Loan tin để nhận ngay 50 đ',
	html,
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
		  'width' : '580px',
		  'font-size': '12px',
		  'color': '#000'
		}
	}
  );
};