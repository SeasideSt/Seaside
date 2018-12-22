rendering
renderContentOn: html
	html form: [
		html paragraph: [ 
			html render: memoryInput.
			html submitButton
				text: 'OK';
				callback: [ self ok ] ] ]