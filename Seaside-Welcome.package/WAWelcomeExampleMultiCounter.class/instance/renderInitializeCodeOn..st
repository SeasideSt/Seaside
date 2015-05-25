rendering
renderInitializeCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'initialize'. html break.
		html span class: #super; with:'    super'. html text:' initialize.'. html break.
    		html span class: #instanceVar; with:'    counters'. html text: ' := ('. html span class: #number; with: '1'. html text:' to: '. html span class: #number; with: '5'. html text: ')'. html break.
		html text: '         collect: [ '. html span class: #blockArg; with: ':each'. html text: ' | '. html span class: #class; with: 'WACounter'. html text:' new ]'
		]