rendering
renderContentOn: html
	self maxPages = 0
		ifTrue: [ ^ self ].
	html div
		class: 'batch';
		with: [
			self renderPreviousOn: html.
			self renderPagesOn: html.
			self renderNextOn: html ]