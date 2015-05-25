rendering
renderTextOn: canvas
	self
		renderInline: [ :html | html text: 'abcdefghijklmnopqrstuvwxyz&0123456789' ]
		factor: 1 / 50
		key: #seasideText
		on: canvas