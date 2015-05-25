rendering
renderChooseCheeseCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternUnary; with: 'chooseCheese'. html break.
		html span class: #instanceVar; with: '    cheese'. html text: ' := '. html span class: #self; with: 'self'. html break.
		html text: '        chooseFrom: '. html span class: #symbol; with: '#'. html text: '( '. html span class: #string; with: '''Greyerzer'' ''Tilsiter'' ''Sbrinz'''. html text: ' )'. html break.
		html text:'        caption: '. html span class: #string; with: '''What''''s your favorite cheese?'''. html text: '.'. html break.
		html span class: #instanceVar; with: '    cheese'. html text: ' isNil ifTrue: [ '. html span class: #self; with: 'self'. html text:' chooseCheese ]'
		]
