initialization
destroy
	"Clear references to objects when the receiver is no longer required. This helps avoid circular references and reduces memory consumption. This method is called by the ServerAdaptor after request processing is finished."
	
	self forDebugging ifFalse: [ super destroy ]