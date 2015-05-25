rendering
renderLineBreaksOn: canvas
	self
		renderInline: [ :html |
			html withLineBreaks: 'a
			b
			c' ]
		key: #lineBreak
		on: canvas
		
	