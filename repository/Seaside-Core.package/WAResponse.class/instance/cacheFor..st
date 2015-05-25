convenience-caching
cacheFor: aDuration
	"Configure the receiver to be cached for aDuration."

	self removeHeaderAt: 'Pragma'. "Proxies"
	self headerAt: 'Expires' putDate: DateAndTime now + aDuration. "HTTP 1.0"
	self headerAt: 'Cache-Control' put: 'max-age=' , aDuration asSeconds printString "HTTP 1.1"