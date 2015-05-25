hooks
initialRequest: aRequest 
	super initialRequest: aRequest.
	self requestContext consumer nextIfPresentDo: [ :className | 
		classes do: [ :each | 
			"#greaseString is required because of Symbol <-> String comparison"
			each name greaseString = className ifTrue: [ self selected: each ] ] ]