rendering
renderChildrenCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'children'. html break.
		html text: '    ^ '. html span class: #instanceVar; with: 'counters'
		]