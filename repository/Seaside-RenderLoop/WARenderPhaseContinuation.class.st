Class {
	#name : 'WARenderPhaseContinuation',
	#superclass : 'WARenderLoopContinuation',
	#category : 'Seaside-RenderLoop-Continuations',
	#package : 'Seaside-RenderLoop',
	#tag : 'Continuations'
}

{ #category : 'testing' }
WARenderPhaseContinuation class >> isRenderContinuation [
	^ true
]

{ #category : 'private' }
WARenderPhaseContinuation >> createHtmlRootWithContext: aRenderContext [
	^ WAHtmlRoot context: aRenderContext
]

{ #category : 'private' }
WARenderPhaseContinuation >> createRenderContext [
	| renderContext |
	renderContext := WARenderContext new.
	
	"Wrap the default visitor with a rendering guide"
	renderContext visitor: (WARenderingGuide client: renderContext visitor).
	
	^ renderContext
]

{ #category : 'processing' }
WARenderPhaseContinuation >> documentOpened: aResponse [
	"callback sent once #updateRoot: has been send to:
	 	- all the libraries
		- the session
		- all the components
	and the document has been opened (the opening body tag has been written)
	per default do nothing"
]

{ #category : 'handling' }
WARenderPhaseContinuation >> handleFiltered: aRequestContext [
	self respond: [ :response | self processRendering: response ].

	"The render phase should have returned a response"
	WAMissingResponseError signal
]

{ #category : 'processing' }
WARenderPhaseContinuation >> processRendering: aResponse [ 
	| document actionContinuation renderContext actionUrl actionBaseUrl htmlRoot |
	"Prepare the response"
	aResponse contentType: self application contentType.

	"Create objects we need"
	document := self requestContext newDocument.
	renderContext := self createRenderContext.
	actionContinuation := self createActionContinuationWithContext: renderContext.
	
	"Create URL"
	actionUrl := actionContinuation registerForUrl: false.
	actionBaseUrl := actionUrl copy.
	self updateUrl: actionUrl.

	"Hook objects together"
	renderContext
		document: document;
		actionUrl: actionUrl;
		actionBaseUrl: actionBaseUrl;
		resourceUrl: self application resourceBaseUrl.
	actionContinuation renderContext: renderContext.
	htmlRoot := self createHtmlRootWithContext: renderContext.
	self updateRoot: htmlRoot.
	self toPresenterSendRoot: htmlRoot.

	"Render"
	document open: htmlRoot.
	self documentOpened: aResponse.
	self presenter renderWithContext: renderContext.
	document close.
	renderContext destroy
]
