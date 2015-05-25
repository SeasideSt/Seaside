rendering
renderAnsweringToolsOn: html
	html anchor
		callback: [ self debug ];
		title: 'Open a debugger in your IDE and block until you hit "Proceed"';
		with: 'Debug'.
	self exception isResumable ifTrue: [
		html space.
		html anchor
			callback: [ self proceed ];
			with: 'Proceed' ].
	self limit < self frameCount ifTrue: [
		html space.
		html anchor
			callback: [ self showFullStack ];
			with: 'Full Stack' ]