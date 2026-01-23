printing
javascriptContentOn: aRenderer
	"TODO: window.location should not be retrieved here..."
	aRenderer
		javascript: 'new WebSocket(((window.location.protocol === "https:") ? "wss://" : "ws://") + window.location.host + ';
		string: self url greaseString;
		javascript: $).
	pusher ifNotNil:[ pusher websocketEventHandlerJavaScriptOn: aRenderer ]