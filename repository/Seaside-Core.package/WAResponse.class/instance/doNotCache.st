convenience-caching
doNotCache
	"Configure the receiver to not be cached at all."
	
	self headerAt: 'Pragma' put: 'no-cache'. "Proxies"
	self headerAt: 'Expires' putDate: self doNotCacheExpiryDate. "HTTP 1.0"
	"http://blog.55minutes.com/2011/10/how-to-defeat-the-browser-back-button-cache/"
	"https://code.google.com/p/seaside/issues/detail?id=772"
	self headerAt: 'Cache-Control' put: 'no-cache, max-age=0, must-revalidate, no-store' "HTTP 1.1"