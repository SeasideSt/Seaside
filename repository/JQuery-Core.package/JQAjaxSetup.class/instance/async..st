options
async: aBoolean
	"By default, all requests are sent asynchronous (i.e. this is set to true by default). If you need synchronous requests, set this option to false. Note that synchronous requests may temporarily lock the browser, disabling any actions while the request is active."
	
	self optionAt: 'async' put: aBoolean