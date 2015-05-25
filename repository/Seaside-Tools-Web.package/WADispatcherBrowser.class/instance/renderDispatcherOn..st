rendering
renderDispatcherOn: html
	html table: [
		self renderRow: self dispatcher named: '.' on: html.
		self dispatcher isRoot
			ifFalse: [ self renderRow: self dispatcher parent named: '..' on: html ].
		self handlers keys sorted
			do: [ :each | self renderRow: (self dispatcher handlers at: each) named: each on: html ] ]