Class {
	#name : #WAPharoDocumentHandlerTest,
	#superclass : #WAFormTestCase,
	#category : 'Seaside-Tests-Pharo-Core'
}

{ #category : #tests }
WAPharoDocumentHandlerTest >> testForm [
	| handler context |
	self formClassExists ifFalse: [ ^ self ].
	
	handler := WADocumentHandler
		document: self sampleForm
		mimeType: self sampleForm defaultMimeType
		fileName: nil.
	
	context := WARequestContext request: WARequest new response: WABufferedResponse new.
	[ handler handle: context ] on: WAResponseNotification do: [ :n | ].
	
	self assert: context response notNil
]

{ #category : #tests }
WAPharoDocumentHandlerTest >> testFormWithMimeTypeGif [
	"Test that requesting a form as GIF actually results in a GIF"
	| handler |
	self formClassExists ifFalse: [ ^ self ].
	
	handler := WADocumentHandler
		document: self sampleForm
		mimeType: WAMimeType imageGif
		fileName: nil.
	
	self assert: (handler document contents beginsWithSubCollection: #(16r47 16r49 16r46 16r38) asByteArray) "GIF Magic number"
]

{ #category : #tests }
WAPharoDocumentHandlerTest >> testFormWithMimeTypeJpeg [
	"Test that requesting a form as JPEG actually results in a JPEG"
	| handler |
	self formClassExists ifFalse: [ ^ self ].
	
	handler := WADocumentHandler
		document: self sampleForm
		mimeType: WAMimeType imageJpeg
		fileName: nil.
	
	self assert: (handler document contents beginsWithSubCollection: #(16rFF 16rD8 16rFF 16rE0) asByteArray) "JPEG Magic number"
]

{ #category : #tests }
WAPharoDocumentHandlerTest >> testFormWithoutMimeType [
	"Test that requesting a form without a mime type works"
	| handler |
	self formClassExists ifFalse: [ ^ self ].
	
	handler := WADocumentHandler
		document: self sampleForm
		mimeType: nil
		fileName: nil.
	
	self assert: handler document contents isEmptyOrNil not
]
