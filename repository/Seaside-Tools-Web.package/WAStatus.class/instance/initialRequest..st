hooks
initialRequest: aRequest 
	super initialRequest: aRequest.
	self requestContext consumer nextIfPresentDo: [ :className | 
		navigation components do: [ :each | 
			"#greaseString is required because of Symbol <-> String comparison"
			each value class name greaseString = className ifTrue: [ navigation select: each key ] ] ]