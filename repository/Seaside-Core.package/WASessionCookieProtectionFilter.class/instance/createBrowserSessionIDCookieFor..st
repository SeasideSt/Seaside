private
createBrowserSessionIDCookieFor: aRequestContext
	"Override this to customize cookie properties that fit your application needs"
	^ aRequestContext newCookie
		sameSite: 'Strict';
		key: self browserSessionIDCookieKey;
		value: self browserSessionID