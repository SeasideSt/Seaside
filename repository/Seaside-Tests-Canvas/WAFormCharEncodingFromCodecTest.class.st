"
I test that the encoding of the codec on the request context overwrites the encoding on the application.

"
Class {
	#name : #WAFormCharEncodingFromCodecTest,
	#superclass : #WAAbstractCanvasBrushTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #configuration }
WAFormCharEncodingFromCodecTest >> createCodec [
	^ GRCodec forEncoding: 'iso-8859-1'
]

{ #category : #configuration }
WAFormCharEncodingFromCodecTest >> createHandlers [
	| handler |
	handler := WARequestHandler new.
	handler preferenceAt: #charSet put: 'utf-16'.
	^ Array with: handler
]

{ #category : #tests }
WAFormCharEncodingFromCodecTest >> testCharCodingWithHandler [
	"569: Encoding information doesn't get included in the response"
	self
		assert: [ :html |
			html basicForm ]
		gives: '<form accept-charset="iso-8859-1" method="post" action="/"></form>'

]
