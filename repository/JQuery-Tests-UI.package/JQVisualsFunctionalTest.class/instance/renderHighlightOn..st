rendering
renderHighlightOn: html
	html div class: 'ui-corner-all ui-state-highlight'; with: [
		html paragraph: [ 
			html span class: 'ui-icon ui-icon-info'.
			html strong: 'Hey! '.
			html text: 'Sample ui-state-highlight style.' ] ]