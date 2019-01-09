rendering
renderInstructionsOn: html

	html paragraph: [
		html text: 'To bring up a debugger in your development image, press the Debug button in the GemStone/S Transcript window.'].
	true
		ifTrue: [ 
			html paragraph: [
				html strong: 'For the moment, resuming from a remote debug session is not supported' ].
			^self ].
	html paragraph: [
		html anchor
			callback: [ self resumeContinuation ];
			title: 'Resume from remote debugger.';
			with: 'Resume']