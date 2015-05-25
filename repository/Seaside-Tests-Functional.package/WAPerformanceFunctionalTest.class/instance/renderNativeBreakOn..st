rendering
renderNativeBreakOn: canvas
	self
		renderInline: [ :html | html html: '<br/>' ]
		factor: 1 / 50
		key: #nativeBR
		on: canvas