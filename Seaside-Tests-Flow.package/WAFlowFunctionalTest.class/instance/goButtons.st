actions
goButtons
	1 to: 5 do: [ :each |
		self inform: each greaseString, ': ', self stackDepth greaseString ]