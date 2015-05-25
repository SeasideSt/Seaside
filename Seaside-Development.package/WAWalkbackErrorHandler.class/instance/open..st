actions
open: anException 
	self requestContext request isXmlHttpRequest
		ifTrue: [ ^ super open: anException ].

	self shouldCall
		ifTrue: [ self openUsingCall: anException ]
		ifFalse: [ self openUsingDirectRendering: anException ]