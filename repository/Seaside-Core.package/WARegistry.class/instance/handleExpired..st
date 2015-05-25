handling
handleExpired: aRequestContext 
	"This method is called whenever a request is received with a key that does not match a registered handler."
	
	aRequestContext responseGenerator
		expiredRegistryKey;
		respond