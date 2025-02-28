rendering
renderContentOn: html
	html div
		id: #slider;
		script: (html jQuery new slider
			value: self class value;
			onStop: (html jQuery ajax
				callback: [ :value | self class value: value asNumber ]
				value: (html jQuery this slider getValue))).
	html document
		addLoadScript: (html websocket
			pusher: self class pusher)