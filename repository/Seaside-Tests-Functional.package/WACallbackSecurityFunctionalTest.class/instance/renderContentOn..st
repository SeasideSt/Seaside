rendering
renderContentOn: html 
	self renderInstructionsOn: html.
	html form: [
		html div: [
			self renderNumberListOn: html.
			self renderLetterListOn: html.
			html submitButton ] ].
	html paragraph: 'This should always be a NUMBER: ' , number greaseString.
	html paragraph: 'This should always be a LETTER: ' , letter greaseString.
	html paragraph: [
		| url |
		url := html actionUrl greaseString.
		html anchor
			url: '#';
			onClick: 'swapCallbacks("' , url , '","letter-list", "number-list")';
			with: 'Try to break it' ]