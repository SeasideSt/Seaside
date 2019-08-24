processing
handleFiltered: aRequestContext
	"If the browserSessionID instvar is nil, we are a newly created session and should set our browser session id.
	Otherwise, verify the browser session id for the current request."
	self browserSessionID
		ifNil: [ self privateSetBrowserSessionID: aRequestContext ]
		ifNotNil: [ 
			(self privateVerifyBrowserSession: aRequestContext)
				ifFalse: [
					"If we carry a redirected url field, we have tried setting a cookie, which failed. Stop here to avoid infinite redirect.
					In the other case, treat the request identical to when the session expired."
					(self requestContext request queryFields includesKey: 'cookiecheck') 
						ifTrue:[ self respondCookiesRequired: aRequestContext ]
						ifFalse: [ aRequestContext registry handleExpired: aRequestContext ] ] ].
	super handleFiltered: aRequestContext