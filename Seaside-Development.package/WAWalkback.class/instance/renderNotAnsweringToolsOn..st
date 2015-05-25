rendering
renderNotAnsweringToolsOn: html
	html anchor
		url: self debugUrl;
		title: 'Open a debugger in your IDE and block until you hit "Proceed"';
		with: 'Debug'.
	self exception isResumable ifTrue: [
		html space.
		html anchor
			url: self proceedUrl;
			with: 'Proceed' ].
	self limit < self frameCount ifTrue: [
		html space.
		html anchor
			url: self fullStackUrl;
			with: 'Full Stack' ]