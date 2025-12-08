Class {
	#name : 'WAFragmentRenderingTest',
	#superclass : 'WARequestHandlerTest',
	#category : 'Seaside-Tests-WebComponents',
	#package : 'Seaside-Tests-WebComponents'
}

{ #category : 'testing' }
WAFragmentRenderingTest class >> shouldInheritSelectors [
	^ false
]

{ #category : 'private' }
WAFragmentRenderingTest >> newHandler [
	| application |
	application := WAApplication new.
	application configuration
		addParent: WARenderLoopConfiguration instance.
	^ application
		rootClass: WACounter;
		preferenceAt: #renderPhaseContinuationClass put: WAFragmentRenderPhaseContinuation;
		yourself
]

{ #category : 'running' }
WAFragmentRenderingTest >> requestWithMethod: aString [
	^ WARequest
		method: aString
		uri: '/app/oneo'
]

{ #category : 'tests' }
WAFragmentRenderingTest >> testRendering [
	| context request responseContents |
	request := self requestWithMethod: 'GET'.
	context := WARequestContext request: request response: WABufferedResponse new.
	[ handler handle: context ]
		on: WAResponseNotification
		do: [ :notification | ].
	self assert: context response status equals: 200.
	responseContents := context response contents.
	self assert: (responseContents greaseBeginsWith: '<h1>').
	self assert: (responseContents greaseEndsWith: '</a>')
]
