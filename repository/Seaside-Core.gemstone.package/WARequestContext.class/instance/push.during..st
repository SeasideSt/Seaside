actions
push: aRequestHandler during: aBlock
	"Push aRequestHandler onto the handler stack while evaluating aBlock."
	
	handlers addFirst: aRequestHandler.
	^ [ WACurrentRequestContext use: self during: aBlock ]
		ensure: [ handlers removeFirst ]