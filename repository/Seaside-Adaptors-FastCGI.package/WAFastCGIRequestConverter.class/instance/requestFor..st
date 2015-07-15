converting
requestFor: aFSResponderRole

	| request |
	((aFSResponderRole params at: 'REQUEST_METHOD') = 'POST' 
		and: [(aFSResponderRole params at: 'CONTENT_TYPE' ifAbsent: ['']) beginsWith: MIMEDocument contentTypeMultipart ] )
		ifTrue: [ self processMultipartFields: aFSResponderRole ].
	request := super requestFor: aFSResponderRole.
	self isLogging ifTrue: [ (ObjectLogEntry info: 'Request' object: { request copy. aFSResponderRole. }) addToLog ].
	^request