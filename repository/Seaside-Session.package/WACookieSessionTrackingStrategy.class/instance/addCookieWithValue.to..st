private
addCookieWithValue: aString to: aRequestContext
	"Create a new handler key cookie and att it to the response."
	
	aRequestContext response addCookie: 
		(aRequestContext newCookie
			key: self keyCookieName;
			value: aString;
			discard: true;
			comment: 'the Seaside Session Cookie';
			commentUrl: 'http://www.seaside.st/documentation/sessionCookie';
			yourself)