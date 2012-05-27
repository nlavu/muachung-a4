shop.district = {
	listDistrict: new Array(),
	listDistrictDropdown: {},
	showDistrict:function(obj){
		
		var d = jQuery(obj).attr('value');
			d = d.toLowerCase();
		if(d)  {
			var return_arr = new Array();
			for(i in shop.district.listDistrict)
			{
				str = shop.district.listDistrict[i].title;
				str = str.toLowerCase();
				if(str.match(d))
				{
					var mat = str.match(d);
					var tempArr = shop.district.listDistrict[i];
					tempArr['lang'] = shop.district.listDistrict[i].title;
					return_arr.push(tempArr);
				}
				else{
					shop.district.hideDistrict();
				}
			}
			shop.district.displayDistrict(return_arr);
			jQuery("#listDistrict").highlight(d);
		}
		else{
			shop.district.hideDistrict();
		}
	},
	displayDistrict:function(obj){
		var html = '';
		for(x in obj){
			html += '<a href="javascript:void(0)" class="linkListDis" onclick="shop.district.insertDistrict(\''+obj[x].lang+'\');">'+obj[x].title+'</a>';
		}
		if(html != ''){
			jQuery("#listDistrict").html(html);
			jQuery("#listDistrict").show();
		}
	},
	hideDistrict:function(){
		jQuery("#listDistrict").hide();
	},
	insertDistrict:function(v){
		jQuery("#district").val(v);
		shop.district.hideDistrict();
	},
	loadDistrict:function(v, cb){
		if(v > 0){
			jQuery.jCache.maxSize = 20;
			var key = 'listDistrict'+v;
			
			shop.district.listDistrict = jQuery.jCache.getItem(key);
			if(!shop.district.listDistrict){
				shop.ajax_popup('act=customer&code=loadDistrict',"POST",{city_id:v},
				function (j) {
					shop.district.listDistrict = j;
					shop.district.listDistrictDropdown = j;
					jQuery.jCache.setItem(key, shop.district.listDistrict);
					if(cb){cb()}
				});
			}else{
				shop.district.listDistrictDropdown = shop.district.listDistrict;
				if(cb){cb()}
			}
			shop.district.hideDistrict();
		}
	  return false;
	},
	loadDistrictDropdown:function(v, container_id, cb, def){
		if(v > 0){
			jQuery.jCache.maxSize = 20;
			var key = 'listDistrictDropdown'+v;
			
			shop.district.listDistrictDropdown = jQuery.jCache.getItem(key);
			if(!shop.district.listDistrictDropdown){
				shop.ajax_popup('act=customer&code=loadDistrictDropdown',"POST",{city_id:v},
				function (j) {
					shop.district.listDistrict = j;
					shop.district.listDistrictDropdown = j;

					//set cached
					jQuery.jCache.setItem(key, j);
					//tao theme
					def = shop.district.themeOption(container_id, j, def, v);
					//goi callback
					if(cb){cb(def, v)}
				});
				return;
			}else{
				shop.district.listDistrict = shop.district.listDistrictDropdown;
			}
		}
		//tao theme
		def = shop.district.themeOption(container_id, shop.district.listDistrictDropdown, def, v);
		//goi callback
		if(v <= 0){
			def = 0; v = 0;
		}
		if(cb){cb(def, v)}
		return;
	},
	themeOption:function(container_id, j, def, city){
		var title_opt = (city == 67 || city == 68 || city == 30) ? 'Quận/Phường' : 'Quận/Huyện',
		is_num = def && shop.is_num(def),
		sl = false,
		districtOpt = '',
		defaultOpt = '<option value="0">-- Chọn '+title_opt+' --</option>',
		groupWard = '';
		
		for(var i in j){
			if(is_num){
				sl = def == j[i].id;
			}else{
				sl = def == j[i].title;
				if(sl){
					def = j[i].id;
				}
			}
			if((city == 67 || city == 68 || city == 30) && (j[i].title).indexOf('Phường ') != -1){
				groupWard += '<option value="'+j[i].id+'"'+(sl?" selected":"")+'>'+j[i].title+'</option>';
			}else{
				districtOpt += '<option value="'+j[i].id+'"'+(sl?" selected":"")+'>'+j[i].title+'</option>';
			}
		}
		
		if(groupWard != ''){
			districtOpt = shop.join
				('<optgroup label="Phường của '+(city==30? city_list[68].title : city_list[city].title)+'">'+groupWard+'</optgroup>')
				('<optgroup label="Quận/Huyện của '+city_list[city].title+'">'+districtOpt+'</optgroup>')
			();
		}
		jQuery("#"+container_id).html(defaultOpt+districtOpt);
		return def;
	}
};
