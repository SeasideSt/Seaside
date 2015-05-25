rendering
renderResumableErrorOn: html 
	html heading: 'Resumable error'.
	html paragraph: 'Behaviour is handler-dependent. If a Debugger is opened, clicking on proceed should display the message "To be displayed".'.
	html anchor
		callback: [ self raiseResumable ];
		with: 'Raise zero divide'