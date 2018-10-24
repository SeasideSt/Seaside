private
addCookieWithValue: aString to: aRequestContext
	"Create a new handler key cookie and att it to the response."
	
	aRequestContext response addCookie: 
		(aRequestContext newCookie
			key: self keyCookieName;
			value: aString;
			discard: true;
			sameSite: 'Strict';
			comment: 'the Seaside Session Cookie';
			commentUrl: 'https://github.com/SeasideSt/Seaside/wiki/Session-Cookie';
			yourself)