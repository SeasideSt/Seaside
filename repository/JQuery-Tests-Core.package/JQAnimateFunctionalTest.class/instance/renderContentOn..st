rendering
renderContentOn: html
	html paragraph class: 'actions'; with: [
		self renderRelativeOn: html.
		self renderAbsoluteOn: html.
		self renderToggleOn: html ].
	self renderSeastarOn: html