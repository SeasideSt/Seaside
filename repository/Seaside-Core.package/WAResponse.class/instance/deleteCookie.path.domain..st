accessing-cookies
deleteCookie: aCookie path: aPathString domain: aDomainString
	"Delete the cookie in the browser.
	
	The spec sez:
	If a CGI script wishes to delete a cookie, it can do so by returning a cookie with the same name, and an expires time which is in the past. The path and name must match exactly in order for the expiring cookie to replace the valid cookie. This requirement makes it difficult for anyone but the originator of a cookie to delete a cookie.
	
	What is not specified but also has to match is the domain.
	
	The trouble is:
	Browsers that follow the Netscape spec don't send path or domain information"
	| copy |
	copy := (WACookie 
		key: aCookie key
		value: '')
		pathUnencoded: aCookie pathUnencoded encoded: aCookie pathEncoded;
		version: aCookie version;
		domain: aCookie domain;
		yourself.
	aCookie version isNil ifTrue:  [
		"old Netscape cookie with no path or domain information"
		aPathString isNil ifFalse: [ 
			copy path: aPathString ].
		aDomainString isNil ifFalse: [
			copy domain: aDomainString ] ].
	copy expireInPast.
	self addCookie: copy