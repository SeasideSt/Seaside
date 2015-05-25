rendering
renderReadmeOn: html
	self url isNil ifTrue: [ ^ self ].
	html paragraph: [
		html text: 'For additional documentation and examples please visit the official '.
		html anchor
			url: self url;
			with: 'web-site'.
		html text: '.' ]