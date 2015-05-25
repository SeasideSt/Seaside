rendering-chat
renderChatPusherOn: html
	html document 
		addLoadScript: (html comet
			pusher: self pusher;
			connect)