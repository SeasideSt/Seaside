rendering
renderContentOn: html
	items isEmpty
		ifTrue: [ ^ self ].
	html div
		class: 'batch';
		with: [
			self renderPreviousOn: html.
			self renderPagesOn: html.
			self renderNextOn: html ]