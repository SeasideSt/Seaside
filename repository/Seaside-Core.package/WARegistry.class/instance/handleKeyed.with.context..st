handling
handleKeyed: aRequestHandler with: aString context: aRequestContext
	"This method is called whenever a request is received with a key that matches
	a registered handler."
	
	self dispatch: aRequestContext to: aRequestHandler key: aString