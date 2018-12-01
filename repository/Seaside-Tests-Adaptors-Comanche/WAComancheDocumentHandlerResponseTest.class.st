Class {
	#name : #WAComancheDocumentHandlerResponseTest,
	#superclass : #WADocumentHandlerResponseTest,
	#category : 'Seaside-Tests-Adaptors-Comanche'
}

{ #category : #testing }
WAComancheDocumentHandlerResponseTest >> assertHttpResponseFrom: aResponse matches: aHandler [ 
	| httpResponse kom |
	super 
		assertHttpResponseFrom: aResponse
		matches: aHandler.
	kom := WAComancheAdaptor new.
	httpResponse := [ kom responseFrom: self requestContext ]
		ensure: [ kom unregister ].
	self assert: httpResponse status == #ok.
	self assert: httpResponse contentType = aHandler document mimeType greaseString.
	self assert: httpResponse contentLength = aHandler document contents size.
	httpResponse fields keysAndValuesDo:  [ :key :value | 
		self assert: (self 
				headerAt: key
				forResponse: aResponse) greaseString = value ].
	aResponse headers keysAndValuesDo:  [ :key :value | 
		self assert: (key = 'Content-Type' or: [ (httpResponse fields at: key) = value greaseString ]) ].
	self assert: httpResponse cookies isEmpty
]
