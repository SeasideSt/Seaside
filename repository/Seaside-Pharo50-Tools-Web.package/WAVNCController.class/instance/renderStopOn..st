rendering
renderStopOn: html
	html form: [
		html text: 'Stop VNC (running on ', self currentDisplay, ') '.
		html submitButton
			callback: [ self stop ];
			text: 'Stop' ]