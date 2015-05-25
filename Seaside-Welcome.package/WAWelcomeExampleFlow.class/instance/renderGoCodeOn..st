rendering
renderGoCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'go'. html break.
		html text: '    [ '. html span class: #self; with: 'self'. html text: ' chooseCheese.'. html break.
		html text: '      '. html span class: #self; with: 'self'. html text: ' confirmCheese'. html text: ' ] whileFalse.'. html break.
		html text: '    '. html span class: #self; with: 'self'. html text: ' informCheese.'
	]