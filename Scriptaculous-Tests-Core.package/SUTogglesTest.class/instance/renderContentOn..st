rendering
renderContentOn: html
	html paragraph: [
		self toggles do: [ :each |
			html anchor
				onClick: (html scriptaculous effect
					id: 'toggle';
					perform: each);
				with: (self labelForSelector: each) ]
			separatedBy: [ html text: ', ' ] ].
	self renderBox: 'toggle' on: html