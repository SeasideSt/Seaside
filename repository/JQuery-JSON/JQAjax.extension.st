Extension { #name : #JQAjax }

{ #category : #'*jquery-json' }
JQAjax >> callback: aBlock json: anObject [
	"Register aBlock as a secondary callback. anObject is a reference to a Javascript object on the client-side. anObject will be serialized to a JSON string, sent back to the server, deserialized from JSON to nested Smalltalk objects, and result passed into aBlock."

	self
		callback: [ :value | aBlock value: (WAJsonParser parse: value) ] 
		value: (JSJson new stringify: anObject)
]

{ #category : #'*jquery-json' }
JQAjax >> json: aRenderable [
	"Defines a json rendering callback."

	self dataType: 'json'.
	self respond: [ :response |
		response
			doNotCache;
			contentType: WAMimeType applicationJson;
			nextPutAll: (WAJsonCanvas builder render: aRenderable) ]
]
