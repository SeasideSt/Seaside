options
timeout: anInteger
	"Set a local timeout (in milliseconds) for the request. This will override the global timeout, if one is set via $.ajaxSetup. For example, you could use this property to give a single request a longer timeout than all other requests that you've set to time out in one second. See $.ajaxSetup() for global timeouts."
	
	self optionAt: 'timeout' put: anInteger