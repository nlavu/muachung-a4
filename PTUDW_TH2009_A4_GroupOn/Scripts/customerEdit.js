
jQuery(document).ready(function () {
	jQuery('#new_password').blur(function(){
		var pass1 = jQuery('#re_password').val();
		if(pass1 != ''){
			var pass = jQuery('#new_password').val();
			if(pass1 != pass){
				shop.raiseError('#re_password',"Mật khẩu không trùng khớp", true);
			}else{
				shop.raiseError('#re_password',"Oke",true,true);
			}
		}
	});
	
	jQuery('#re_password').keyup(function(){
		if(this.value!= ''){
			var pass = jQuery('#new_password').val();
			if(pass != this.value){
				shop.raiseError('#re_password',"Mật khẩu không trùng khớp", true);
			}else{
				shop.raiseError('#re_password',"Oke",true,true);
			}
		}
	});
	
});

shop.showChangePass = function(obj){
	if(jQuery('#change_pass').is(':hidden') == true){
		jQuery('#change_pass').addClass('changed').slideDown();
	}
	else{
		jQuery('#change_pass').removeClass('changed').slideUp();
	}
};
shop.customerEdit = {
	editProfileFormSubmit:function(frm){
		var fullname = shop.util_trim(jQuery('#full_name').val());
		if(fullname == ''){
			shop.raiseError('#full_name', "Họ tên là trường bắt buộc", true);
			return false;
		}else if(frm.new_password.value != ''){
			if(frm.new_password.value.length < 6){
				frm.new_password.focus();
				alert('Mật khẩu tối thiểu phải có 6 kí tự');
				return false;
			}else if(frm.re_password.value == ''){
				frm.re_password.focus();
				alert('Chưa nhập lại mật khẩu');
				return false;
			}else if(frm.re_password.value != frm.new_password.value){
				frm.re_password.focus();
				alert('Nhập lại mật khẩu không chính xác');
				return false;
			}
		}
		shop.closeErr('#full_name');
		frm.submit();
		return true;
	},
	editAdressProfileFormSubmit:function(form){
		var district = jQuery('#listDistrict').val(),
		numHouse = shop.util_trim(jQuery('#numHouse').val()),
		street = shop.util_trim(jQuery('#street').val()),
		ward = shop.util_trim(jQuery('#ward').val()),
		phone = shop.util_trim(jQuery('#phone').val()),
		city = jQuery("#city").val();

		if(numHouse == ''){
			shop.raiseError('#numHouse', "Bạn phải nhập số nhà", true);
			return false;
		}else if(street == ''){
			shop.raiseError('#street', "Bạn phải nhập phố", true);
			shop.closeErr('#numHouse');
			return false;
		}else if(ward == ''){
			shop.raiseError('#ward', "Bạn phải nhập phường xã", true);
			shop.closeErr('#numHouse');
			shop.closeErr('#street');
			return false;
		}else if(phone == ''){
			shop.raiseError('#phone', "Bạn phải nhập số điện thoại", true);
			shop.closeErr('#numHouse');
			shop.closeErr('#street');
			shop.closeErr('#ward');
			return false;
		}else if(!city){
			shop.raiseError('#city', "Bạn phải chọn tỉnh/thành phố", true);
			shop.closeErr('#numHouse');
			shop.closeErr('#street');
			shop.closeErr('#ward');
			shop.closeErr('#phone');		
			return false;
		}else if(district == ''){
			shop.raiseError('#district', "Bạn phải nhập quận huyện", true);
			shop.closeErr('#numHouse');
			shop.closeErr('#street');
			shop.closeErr('#ward');
			shop.closeErr('#phone');
			shop.closeErr('#city');
			return false;
		}else{
			shop.closeErr('#numHouse');
			shop.closeErr('#street');
			shop.closeErr('#ward');
			shop.closeErr('#phone');
			shop.closeErr('#city');
			shop.closeErr('#district');
			form.submit();
		}
		return true;
	}
	
	//listDistrict: new Array(),
	//displayDistrict:function(obj){
	//	var html = '';
	//	for(x in obj){
	//		html += "<a href='javascript:void(0)' class='linkListDis' onclick='shop.customerEdit.insertDistrict(this);' lang='"+obj[x].lang+"'>"+obj[x].title+"</a>";
	//	}
	//	if(html != ''){
	//		jQuery("#listDistrict").html(html);
	//		jQuery("#listDistrict").show();
	//	}
	//},
	//insertDistrict:function(obj){
	//	var val = jQuery(obj).attr('lang');
	//	jQuery("#district").val(val);
	//	jQuery("#listDistrict").hide();
	//},
	//loadDistrict:function(obj){
	//	if(obj.value > 0){
	//		jQuery.jCache.maxSize = 20;
	//		var key = 'listDistrict'+obj.value;
	//		
	//		shop.customerEdit.listDistrict = jQuery.jCache.getItem(key);
	//		if(!shop.customerEdit.listDistrict){
	//			shop.ajax_popup('act=customer&code=loadDistrict',"POST",{city_id:obj.value},
	//			function (j) {
	//				shop.customerEdit.listDistrict = j;
	//				jQuery.jCache.setItem(key, shop.customerEdit.listDistrict);
	//			});
	//		}
	//		jQuery("#listDistrict").hide();
	//	}
	//  return false;
	//}
};
