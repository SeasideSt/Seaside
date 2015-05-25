rendering
renderRenderContentOnCodeOn: html
	html preformatted class: #codeSample; with: [
		html span class: #patternKeyword; with: 'renderContentOn: '. html span class: #patternArg; with: 'html'. html break.
    		html span class: #receiver; with: '    html'. html text: ' heading: '. html span class: #instanceVar; with: 'count.'. html break.
		html span class: #receiver; with: '    html'. html text: ' anchor'. html break.
		html text: '        callback: [ '. html span class: #instanceVar; with: 'count '. html text: ':= '. html span class: #instanceVar; with: 'count'. html text: ' + '. html span class: #number; with: '1'. html text: ' ];'. html break.
		html text: '        with: '. html span class: #string; with: '''++'''. html text: '.'. html break.
		html span class: #receiver; with: '    html'. html text: ' space.'. html break.
		html span class: #receiver; with: '    html'. html text: ' anchor'. html break.
		html text: '        callback: [ '. html span class: #instanceVar; with: 'count '. html text: ':= '. html span class: #instanceVar; with: 'count'. html text: ' - '. html span class: #number; with: '1'. html text: ' ];'. html break.
		html text: '        with: '. html span class: #string; with: '''--'''. html text: '.' ]