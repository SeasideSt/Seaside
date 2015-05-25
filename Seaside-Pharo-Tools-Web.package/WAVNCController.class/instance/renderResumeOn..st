rendering
renderResumeOn: html
	html form: [
		html text: 'UI Process is suspended. '.
		html submitButton
			callback: [ self resume ];
			text: 'Resume' ]