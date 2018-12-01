"
I test that the encoding from the handler is taken if a handler is present but a codec is missing.
"
Class {
	#name : #WAFormCharEncodingFromHandlerTest,
	#superclass : #WAAbstractCanvasBrushTest,
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #configuration }
WAFormCharEncodingFromHandlerTest >> createHandlers [
	| handler |
	handler := WARequestHandler new.
	handler preferenceAt: #charSet put: 'utf-16'.
	^ Array with: handler
]

{ #category : #tests }
WAFormCharEncodingFromHandlerTest >> testCharCodingWithHandler [
	"445:WABasicFormTag does not honour character encoding setting"
	self
		assert: [ :html |
			html basicForm ]
		gives: '<form accept-charset="utf-16" method="post" action="/"></form>'

]
