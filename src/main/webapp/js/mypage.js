/**
 * 
 */

	$(document).ready(function(){
		leftmenuInvokeEvent();
	});
	
	//Header Invoke Event
	function leftmenuInvokeEvent() {
		leftNavigationEventHandler();		// Left Menu
		initLeftmenuNavigation()			// 시작
	}
	
	function leftNavigationEventHandler() {
		// Left Navigation Bar
		$('#lnb ul.depth2 > li > a').click(function() {
			var lnbLiCrt = $(this).parent('li');
			var lnbLiPrv = lnbLiCrt.siblings('li.on');
			
			$(this).parent('li').addClass('on');
			$(this).parent('li').siblings('li.on').removeClass('on');
		});
	}
	
	function initLeftmenuNavigation() {
		$('#lnb > ul.depth2').removeClass('on');
		$('#lnb > ul.depth2 > li').removeClass('on');
		
		
		var currentPageName = getPageName();
		if(currentPageName == "saleList.jsp") {
			$('#lnb ul#submenu9 > li:eq(0) > a').parent('li').addClass('on');
		} else if(currentPageName == "buyList.jsp") {
			$('#lnb ul#submenu9 > li:eq(1) > a').parent('li').addClass('on');
		}


		$("#lnb ul#submenu9").show();
		$("#lnb div.title").text("마이페이지");	
	}
	
	function getPageName(){
	    var pageName = "";
	 
	    var tempPageName = window.location.href;
	    var strPageName = tempPageName.split("/");
	    pageName = strPageName[strPageName.length-1].split("?")[0];
	 
	    return pageName;
	}
