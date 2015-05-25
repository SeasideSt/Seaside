handling
handleFiltered: aRequestContext
	| document context canvas root rootComponent |
	self setContentType: aRequestContext response.
	document := aRequestContext newDocument.
	root := self createDocumentRoot.
	context := WARenderContext new document: document.
	[ canvas := RRRssRenderCanvas context: context.
	rootComponent := self createRootComponent.
	
	rootComponent updateRoot: root.
	document open: root.
	canvas render: rootComponent.
		
	document close ] ensure: [ context destroy ].
	aRequestContext respond