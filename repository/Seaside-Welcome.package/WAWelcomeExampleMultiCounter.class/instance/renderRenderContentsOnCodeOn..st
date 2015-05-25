rendering
renderRenderContentsOnCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternKeyword; with: 'renderContentOn: '. html span class: #patternArg; with: 'html'. html break.
    		html span class: #instanceVar; with: '    counters'. html break.
		html text: '        do: [ '. html span class: #blockArg; with: ':each'. html text: ' | '. html span class: #receiver; with: 'html'.  html text: ' render: '. html span class: #patternArg; with:'each'. html text: ' ]'. html break.
		html text: '         separatedBy: [ '.  html span class: #receiver; with: 'html'. html text: ' horizontalRule ]'
		]
