rendering
renderBreakOn: canvas
	self
		renderInline: [ :html | html break ]
		factor: 1 / 50
		key: #seasideBR
		on: canvas