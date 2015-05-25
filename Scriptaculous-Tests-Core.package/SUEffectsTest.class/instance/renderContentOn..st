rendering
renderContentOn: html
	html paragraph: [
		self effects do: [ :each |
			html anchor
				onClick: (html scriptaculous effect
					id: 'effect';
					perform: each);
				with: (self labelForSelector: each) ]
			separatedBy: [ html text: ', ' ] ].
	self renderBox: 'effect' on: html