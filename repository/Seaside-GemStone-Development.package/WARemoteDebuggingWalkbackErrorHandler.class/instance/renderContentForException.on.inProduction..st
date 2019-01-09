rendering error
renderContentForException: anException on: html inProduction: inProduction
	html heading level1; with: anException description.
	inProduction
		ifTrue: [ 
			html paragraph: 'Your request could not be completed. An exception occurred.'.
			html paragraph: 'The system administrator has been informed of this error.']
		ifFalse: [ 
			html paragraph: 'Error during rendering, a continuation containing error stack has been saved'.
			html paragraph: 'To bring up a debugger in your development image, press the Debug button in the GemStone/S Transcript window.'.
			html paragraph: [
				html strong: 'For the moment, resuming from a remote debug session is not supported' ]]