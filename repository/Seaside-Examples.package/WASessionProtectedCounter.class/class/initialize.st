initialization
initialize
	| app |
	app := WAAdmin register: self asApplicationAt: self handlerName.
	app sessionClass: WASessionCookieProtectedSession