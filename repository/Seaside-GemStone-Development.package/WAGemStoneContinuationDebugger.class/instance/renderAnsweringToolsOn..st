rendering
renderAnsweringToolsOn: html
	self limit < self frameCount ifTrue: [
		html space.
		html anchor
			callback: [ self showFullStack ];
			with: 'Full Stack' ]