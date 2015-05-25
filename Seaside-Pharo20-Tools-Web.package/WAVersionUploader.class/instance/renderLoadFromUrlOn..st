rendering
renderLoadFromUrlOn: html
	html heading level2; with: 'Load version from URL'.
	html form: [
		html div: [
			html textInput
				size: 60;
				value: 'http://'; callback: [ :u | url := u ].
			html space.
			html submitButton
				callback: [ self loadURL ];
				text: 'Load' ] ]