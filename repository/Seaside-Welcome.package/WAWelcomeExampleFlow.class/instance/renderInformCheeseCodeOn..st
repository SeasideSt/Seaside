rendering
renderInformCheeseCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'informCheese'. html break.
		html span class: #self; with: '    self'. html text: ' inform: '. html span class: #string; with: '''Your favorite is '''. html text:', '. html span class: #instanceVar; with: 'cheese'. html text: ','. html span class: #string; with: '''.'''. html break
		]