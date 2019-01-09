initialization
createDocumentHandlerCache
	"No mutex necessary since we are inside the session mutex.
	We don't expire document handlers"
	^ WAUnidirectionalCache new