initialization
initialize
	super initialize.
	ipStrategy := WAIPSessionTrackingStrategy new.
	cookieStrategy := WACookieOnlySessionTrackingStrategy new