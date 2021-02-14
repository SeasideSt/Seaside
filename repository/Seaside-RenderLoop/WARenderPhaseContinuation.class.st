Class {
	#name : #WARenderPhaseContinuation,
	#superclass : #WARenderLoopContinuation,
	#category : 'Seaside-RenderLoop'
}

{ #category : #testing }
WARenderPhaseContinuation class >> isRenderContinuation [
	^ true
]

{ #category : #processing }
WARenderPhaseContinuation >> addRedirectedToHeader: aRequestContext [
	"The Ajaxifier needs to know the URL of the render continuation (in order to save it).
	Unfortunately the redirect from the action to the render continuation happens totally transparently to the JavaScript.
	So we add a custom header to the response so that the JavaScript can find out the URL of the render continuation."
	 (aRequestContext request headerAt: 'x-requested-with') = 'Ajaxifier' ifTrue: [
		aRequestContext response headerAt: 'X-RedirectedTo' put: aRequestContext request url greaseString ]
]

{ #category : #private }
WARenderPhaseContinuation >> createHtmlRootWithContext: aRenderContext [
	^ WAHtmlRoot context: aRenderContext
]

{ #category : #private }
WARenderPhaseContinuation >> createRenderContext [
	| renderContext |
	renderContext := WARenderContext new.
	
	"Wrap the default visitor with a rendering guide"
	renderContext visitor: (WARenderingGuide client: renderContext visitor).
	
	^ renderContext
		
]

{ #category : #processing }
WARenderPhaseContinuation >> documentOpened: aResponse [
	"callback sent once #updateRoot: has been send to:
	 	- all the libraries
		- the session
		- all the components
	and the document has been opened (the opening body tag has been written)
	per default do nothing"
]

{ #category : #handling }
WARenderPhaseContinuation >> handleFiltered: aRequestContext [
	self addRedirectedToHeader: aRequestContext.
	self respond: [ :response | self processRendering: response ].

	"The render phase should have returned a response"
	WAMissingResponseError signal
]

{ #category : #processing }
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
