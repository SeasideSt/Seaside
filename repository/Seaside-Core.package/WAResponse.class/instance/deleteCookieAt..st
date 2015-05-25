accessing-cookies
deleteCookieAt: aKeyString
	"Delete the cookie in the browser. This method is quite unreliable. Consider using #deleteCookie:"
	self deleteCookie: (WACookie key: aKeyString value: '')