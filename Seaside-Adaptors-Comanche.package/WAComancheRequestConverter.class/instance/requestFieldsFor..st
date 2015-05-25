converting-request
requestFieldsFor: aNativeRequest
	| fields |
	fields := WARequestFields new.
	aNativeRequest isPostRequest
		ifTrue: [ self postFieldsOf: aNativeRequest into: fields ].
	^ fields