(function($) {

	$.hx_debug = {
		level : "debug",
		console : true,
		info : function(msg) {

			if ($.hx_debug.level == "debug" || $.hx_debug.level == "info") {

				alert(msg);
			}
		},
		debug : function(msg) {

			if ($.hx_debug.level == "debug") {

				if ($.browser.mozilla && $.hx_debug.console) {

					console.debug(msg);
				} else {

					alert(msg);
				}
			}
		},
		error : function(msg) {

			alert(msg);
		}
	};
})(jQuery);