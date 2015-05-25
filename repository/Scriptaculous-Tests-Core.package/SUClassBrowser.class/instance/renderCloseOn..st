rendering
renderCloseOn: html
	html submitButton
		callback: [ self answer ];
		with: 'Close'