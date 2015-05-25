configuration
cacheForeverExpiryDate
	"Answer the expiry date that should be used if the response should be cached forever.
	
	Note that according to HTTP 1.1 says: To mark a response as 'never expires,' an origin server sends an Expires date approximately one year from the time the response is sent. HTTP/1.1 servers SHOULD NOT send Expires dates more than one year in the future."
	
	^ (DateAndTime now) + (Duration days: 300 hours: 0 minutes: 0 seconds: 0)