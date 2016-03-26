rendering
renderSuspendOn: html
	html form: [
		html text: 'UI Process is running. '.
		html submitButton
			callback: [ self suspend ];
			text: 'Suspend' ]