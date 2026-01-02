protected
websocketEventHandlerJavaScriptOn: aRenderer
	aRenderer 
		javascript: '.addEventListener(''message'', (event) => { Function(`"use strict";return (${event.data})`)(); })'