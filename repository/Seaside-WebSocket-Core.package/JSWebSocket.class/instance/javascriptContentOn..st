printing
javascriptContentOn: aStream
	"TODO: window.location should not be retrieved here..."
	aStream
		nextPutAll: 'new WebSocket(((window.location.protocol === "https:") ? "wss://" : "ws://") + window.location.host + ';
		javascript: self url;
		nextPut: $).
	pusher ifNotNil:[ pusher websocketEventHandlerJavaScriptOn: aStream ]