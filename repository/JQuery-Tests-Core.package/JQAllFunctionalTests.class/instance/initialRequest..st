hooks
initialRequest: aRequest
	super initialRequest: aRequest.
	tests do: [ :category |
		category value do: [ :entry | | requestPath |
			requestPath := aRequest url path.
			requestPath isEmpty
				ifFalse: [
					(self pathFor: entry value title) = requestPath last
						ifTrue: [ contents := entry value ] ] ] ]