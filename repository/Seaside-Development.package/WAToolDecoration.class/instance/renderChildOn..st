rendering
renderChildOn: html
	self showHalos ifTrue: [
		html context addHaloVisitor: (WAHaloVisitor decoration: self context: html context).
		html context enableHalos ].
	self renderNextOn: html.
	html context disableHalos