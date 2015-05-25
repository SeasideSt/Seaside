rendering
renderErrorOn: html
	html div class: 'ui-corner-all ui-state-error'; with: [
		html paragraph: [ 
			html span class: 'ui-icon ui-icon-alert'.
			html strong: 'Error: '.
			html text: 'Sample ui-state-error style.' ] ]