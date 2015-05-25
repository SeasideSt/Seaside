rendering
renderOutputOn: html
	html heading level2; with: '<output>'.
	
	html form: [
		html output: output.
		html space.
		html submitButton
			callback: [ output := output + 1 ] ]