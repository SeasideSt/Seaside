convenience-caching
cacheForever
	"Configure the response to be cached by user agents."
	
	self removeHeaderAt: 'Pragma'. "Proxies"
	self headerAt: 'Expires' putDate: self cacheForeverExpiryDate. "HTTP 1.0"
	self removeHeaderAt: 'Cache-Control' "HTTP 1.1"