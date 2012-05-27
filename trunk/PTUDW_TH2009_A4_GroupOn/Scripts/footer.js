shop.footer = {
	conf: {gold:-1,view:-1},
	init:function(slide){
		jQuery(document).ready(function(){
			shop.footer.updateGold();
			if(slide){
			jQuery(".jCarouselLite").jCarouselLite({
				btnNext: '.preFooter',
				btnPrev: '.nextFooter',
				speed: 700,
				visible: 1,
				start:   0
			  });
			}
		});
	},
	updateGold: function(){
		if(shop.footer.conf.gold != -1){
			shop.get_ele('customer_gold').innerHTML = shop.numberFormat(shop.footer.conf.gold);
		}
	},
	updateViewComment: function(){
		var view_cm = shop.get_ele('view_comment');
		if(view_cm){
			shop.footer.conf.view = parseInt(view_cm.innerHTML) + 1;
			view_cm.innerHTML = shop.footer.conf.view;
		}
	},
	showNextSupport: function(){
		var view_cm = shop.get_ele('view_comment');
		if(view_cm){
			shop.footer.conf.view = parseInt(view_cm.innerHTML) + 1;
			view_cm.innerHTML = shop.footer.conf.view;
		}
	}
	
};