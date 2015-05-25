rendering
renderContentOn: html
	html paragraph: 'Clicking the following anchor should replace it with the message "3 seconds" for 3 seconds and then restore it.'.
	html paragraph: [
		html anchor
			callback: [ self go ];
			with: 'Start' ]