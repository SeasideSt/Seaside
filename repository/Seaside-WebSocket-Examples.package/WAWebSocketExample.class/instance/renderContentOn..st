rendering
renderContentOn: html
	html paragraph
		id: 'status';
		with: 'WebSocket: Not connected'.
	html basicForm: [
		html textInput
			id: 'chat';
			placeholder: 'type and press enter to chat' ].
	html paragraph: 'To test, open two windows with Web Socket support, type a message above and press return.'.
	html unorderedList
		id: 'log'.
		
	self renderJavaScriptOn: html