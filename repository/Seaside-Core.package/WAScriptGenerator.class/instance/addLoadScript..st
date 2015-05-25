accessing
addLoadScript: anObject
	"Add a script anObject to the receiver. This method ensures all scripts to run in the added order when the DOM is ready. Note that the default implementation calls the scripts when the page has finished loading."
	
	^ loadScripts addLast: anObject