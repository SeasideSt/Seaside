protected
websocketEventHandlerJavaScriptOn: aStream
	aStream 
		nextPutAll: '.addEventListener(''message'', (event) => { Function(`"use strict";return (${event.data})`)(); })'