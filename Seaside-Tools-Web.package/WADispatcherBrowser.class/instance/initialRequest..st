hooks
initialRequest: aRequest
	"Check my relative URL, if the last entry is an application open the config editor, else open the dispatcher editor."
	
	super initialRequest: aRequest.
	self openHandler: self lookupHandler