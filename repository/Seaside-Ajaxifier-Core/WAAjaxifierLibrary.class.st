"
I ajaxify a web application by turning full page requests into background AJAX requests.
"
Class {
	#name : 'WAAjaxifierLibrary',
	#superclass : 'WAFileLibrary',
	#category : 'Seaside-Ajaxifier-Core',
	#package : 'Seaside-Ajaxifier-Core'
}

{ #category : 'uploads' }
WAAjaxifierLibrary >> ajaxifierJs [
	^ '/* JavaScript based Ajaxifier
 * Copyright (c) 2008 Lukas Renggli, renggli@gmail.com
 * Copyright (c) 2022 Philippe Marschall, philippe.marschall@gmail.com
 */
"use strict";
window.addEventListener("DOMContentLoaded", (loadEvent) => {
	
	// variables
	let activeHash = "";

	// ajax action
	function load(type, url, data, modifyHistory) {
		const xhr = new XMLHttpRequest();

		xhr.responseType = "document"
		xhr.addEventListener("load", (event) => {
			if (xhr.status === 200) {
				Array.from(xhr.response.head.children).forEach((child) => {
					if (child.nodeType === Node.ELEMENT_NODE && child.nodeName === "SCRIPT") {
						child.remove();
					}
				});
				document.head.innerHTML = xhr.response.head.innerHTML;
				document.body = xhr.response.body;

				if (modifyHistory) {
					const path = xhr.responseURL;			
	 				window.history.pushState(path, null, path);
				}
			}
		});
		
		xhr.open(type, url);
		
		// WAActionCallback per default are disabled for AJAX requests
		// Detection happens with X-Requested-With so we override it 
		xhr.setRequestHeader("X-Requested-With", "Ajaxifier");
		xhr.send(data);
	}
	
	// click handler
	document.addEventListener("click", (event) => {
		
		// links
		const anchor = event.target.closest("a");
		if (anchor !== null) {
			load("GET", anchor.getAttribute("href"), null, true);
			event.preventDefault();
			return;
		}
		
		// submit
		const submit = event.target.closest("input[type=submit], button[type=submit]");
		if (submit !== null) {
			const form = submit.closest("form");
			if (form !== null) {
				const formData = new FormData(form);
				formData.append(submit.getAttribute("name"), "");
				load("POST", form.getAttribute("action"), formData, true);
				event.preventDefault();
			}
		}
		
	});
	
	// check for changes in the hash
	setInterval(() => {
		const currentHash = window.location.hash.substr(1);
		if (currentHash !== activeHash)
			load("GET", "?" + (activeHash = currentHash), null, true);
	}, 250);

	// We assume nobody else will override onpopstate... since we are LIKELY the only ones to use pushstate etc.
	window.onpopstate = (event) => {
		load("GET", event.state, null, false);
	}

});'
]

{ #category : 'accessing' }
WAAjaxifierLibrary >> selectorsToInclude [
	^ #( ajaxifierJs )
]
