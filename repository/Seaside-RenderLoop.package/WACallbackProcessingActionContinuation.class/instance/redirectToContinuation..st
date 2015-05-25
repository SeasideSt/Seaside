private
redirectToContinuation: aSessionContinuation
	self respond: [ :response |
		| url |
		url := aSessionContinuation registerForUrl.
		jumpTo isNil ifFalse: [
			url fragment: jumpTo ].
		response redirectTo: url ]