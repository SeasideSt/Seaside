rendering
renderLoginOn: html
	html form: [
		html textInput
			value: self username;
			callback: [ :value | self login: value ].
		html submitButton
			text: 'Login' ]