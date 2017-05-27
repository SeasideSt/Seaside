handling
handleExpired: aRequestContext 
	"This method is called whenever a request is received with a key that does not match a registered handler."
	
	aRequestContext request isXmlHttpRequest ifTrue: [
		^ aRequestContext responseGenerator
			forbidden;
			respond ].
	
	"Previously, Seaside used to send a redirect response (302) with the
	'Location' header set to the same path as in the request (if possible).
	Any session cookie would at this point have been set for deletion (i.e.
	a 'Set-Cookie' header with a request for deletion would have been set).
	Unfortunately, user-agents across the board don't play well with 'Set-Cookie'
	and redirect responses.
	Hence, we proceed and respond as usual. If a session is to be created,
	another 'Set-Cookie' header will tell the browser to use the new
	session identifier from now on.
	Nice side-effect: user-agents will no longer need to perform the additional
	redirect when a stale cookie is still in the cache.
	
	See https://github.com/SeasideSt/Seaside/issues/916."
	self handleDefault: aRequestContext