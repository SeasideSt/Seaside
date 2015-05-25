rendering
renderInitializeCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'initialize'. html break.
		html span class: #super; with:'    super'. html text:' initialize.'. html break.
		html span class: #instanceVar; with:'    count'. html text: ' := '. html span class: #number; with: '0'	 ]
