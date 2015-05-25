generation
pageExpired
	"The page is no longer in the cache and the request could not be processed."

	self makePlainTextAndPerform: #doNotCache.
	self response
		nextPutAll: 'This page has expired, please use the back-button to navigate to the last valid page.'