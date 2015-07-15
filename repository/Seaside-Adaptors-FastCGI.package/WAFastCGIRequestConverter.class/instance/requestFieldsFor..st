converting-request
requestFieldsFor: aNativeRequest
	| fields |
	fields := WARequestFields new.
	self getFieldsOf: aNativeRequest into: fields.
	((aNativeRequest params at: 'REQUEST_METHOD') = 'POST')
		ifTrue: [ self postFieldsOf: aNativeRequest into: fields ].
	^ fields