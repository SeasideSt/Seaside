processing
handleFiltered: aRequestContext
	"If the browserSessionID instvar is nil, we are a newly created session and should set our browser session id.
	Otherwise, verify the browser session id for the current request."
	self hasBrowserSessionID
		ifFalse: [ self setBrowserSessionIDFor: aRequestContext ]
		ifTrue: [ 
			(self verifyBrowserSessionIDFor: aRequestContext) ifFalse: [
				"If we carry a redirected url field, we have tried setting a cookie, which failed. Stop here to avoid infinite redirect.
				In the other case, respond with the forbidden status code"
				(self requestContext request queryFields includesKey: 'cookiecheck') 
					ifTrue: [ self respondCookiesRequired: aRequestContext ]
					ifFalse: [ aRequestContext responseGenerator forbidden; respond ] ] ].
	super handleFiltered: aRequestContext