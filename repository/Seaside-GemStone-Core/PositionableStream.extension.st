Extension { #name : #PositionableStream }

{ #category : #'*seaside-gemstone-core' }
PositionableStream >> asMIMEDocument [
	^self asMIMEDocumentType: 'text/plain'
]

{ #category : #'*seaside-gemstone-core' }
PositionableStream >> asMIMEDocumentType: mimeType [
	^MIMELocalFileDocument contentType: mimeType contentStream:  self
]

{ #category : #'*seaside-gemstone-core' }
PositionableStream >> seasideMimeDocument [
	^ self contents seasideMimeDocument
]

{ #category : #'*seaside-gemstone-core' }
PositionableStream >> seasideMimeDocumentType: aMimetype [

	^self seasideMimeDocument mimeType: aMimetype; yourself
]

{ #category : #'*seaside-gemstone-core' }
PositionableStream >> upToAndSkipThroughAll: aCollection [ 
	"Needed for Seaside ports to other dialects where #upToAll: may have
	different semantics"
	| res |
	res := self upToAll: aCollection.
	self atEnd ifFalse: [ self skip: aCollection size ].
	^res
]
