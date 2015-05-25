rendering
renderMainContentOn: html
	self renderHeadingOn: html.
	html div
		class: 'getting-started';
		with: self component
