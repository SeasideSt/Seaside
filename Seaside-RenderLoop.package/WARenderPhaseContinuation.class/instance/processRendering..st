processing
processRendering: aResponse 
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