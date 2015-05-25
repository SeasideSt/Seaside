converting-request
requestFieldsFor: aNativeRequest
	| fields |
	fields := WARequestFields new.
	aNativeRequest isPost
		ifTrue: [ self postFieldsOf: aNativeRequest into: fields ].
	^ fields