actions
goAnchors
	
	1 to: 5 do: [ :each | 
		| component |
		component := WAComponent new.
		component addMessage: [ :html | 
			html anchor
				callback: [ component answer ];
				with: each greaseString, ': ', self stackDepth greaseString ].
		self call: component ]