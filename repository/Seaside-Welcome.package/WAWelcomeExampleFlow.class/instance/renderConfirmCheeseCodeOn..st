rendering
renderConfirmCheeseCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'confirmCheese'. html break.
		html text: '    ^ '. html span class: #self; with: 'self'. html text: ' confirm: '. html span class: #string; with: '''Is '''. html text:', '. html span class: #instanceVar; with: 'cheese'. html text: ','. html span class: #string; with: ''' your favorite cheese?'''. html break
		]
