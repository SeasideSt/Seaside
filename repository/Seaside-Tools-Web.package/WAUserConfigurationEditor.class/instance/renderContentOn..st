rendering
renderContentOn: html
	self configuration isShared
		ifTrue: [ html heading: self configuration name ].
	html form: [
		self renderFormOn: html.
		self renderButtonsOn: html ]