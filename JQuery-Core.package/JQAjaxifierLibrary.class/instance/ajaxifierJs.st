uploads
ajaxifierJs
	^ '/* jQuery based Ajaxifier
 * Copyright (c) 2008 Lukas Renggli, renggli@gmail.com
 *
 * For additional documentation see:
 * - http://www.lukas-renggli.ch/blog/ajaxification
 * - http://www.lukas-renggli.ch/blog/ajaxification-faq
 */

$(function () {
	
	// constants
	var HEAD_EXTRACTOR = /<head[^>]*>((.|\s)*?)<\/head>/im;
	var BODY_EXTRACTOR = /<body[^>]*>((.|\s)*?)<\/body>/im;
	var SCRIPT_EXTRACTOR = /<script(.|\s)*?\/script>/ig;
	var PARAM_EXTRACTOR = /\?(.*)$/i;
	
	// variables
	var activeHash = "";

	// ajax action
	function load(type, url, data, modifyHistory) {
		$.ajax({
			type: type, url: url, data: data,
			beforeSend: function (xhr) {
				// WAActionCallback per default are disabled for AJAX requests
				// Detection happens with X-Requested-With so we override it 
				xhr.setRequestHeader("X-Requested-With", "Ajaxifier");
			},
 			success: function (data, textStatus, jqXHR) {
				$("head").html(HEAD_EXTRACTOR
					.exec(data)[1]
					.replace(SCRIPT_EXTRACTOR, ""));
				$("body").html(BODY_EXTRACTOR
					.exec(data)[1]);

				if (modifyHistory) {
					var path = jqXHR.getResponseHeader("X-RedirectedTo");
	 				if (typeof(window.history.pushState) == "function") {
						window.history.pushState(path, null, path);
					} else {
						window.location.hash = activeHash = PARAM_EXTRACTOR.exec(path)[1];
					}
				}
			}
		});
	}
	
	// click handler
	$(document).click(function (event) {
		
		// links
		var anchor = $(event.target).closest("a");
		if (anchor.length == 1) {
			load("GET", anchor.attr("href"), null, true);
			event.preventDefault();
		}
		
		// submit
		var submit = $(event.target).closest("input[type=submit], button[type=submit]");
		if (submit.length == 1) {
			var form = submit.closest("form");
			if (form.length == 1) {
				load("POST", form.attr("action"), form.find(":input").serialize() + "&" + submit.attr("name"), true);
				event.preventDefault();
			}
		}
		
	});
	
	// check for changes in the hash
	setInterval(function () {
		var currentHash = window.location.hash.substr(1);
		if (currentHash != activeHash)
			load("GET", "?" + (activeHash = currentHash), null, true);
	}, 250);

	// We assume nobody else will override onpopstate... since we are LIKELY the only ones to use pushstate etc.
	window.onpopstate = function(event) {
		load("GET", event.state, null, false);
	}

});'