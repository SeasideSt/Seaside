rendering-chat
renderChatStatusOn: html
	html div id: 'status'; with: [
		html text: 'Currently logged in as ' , self username , '. '.
		html anchor
			callback: [ self logout ];
			with: 'Logout' ]