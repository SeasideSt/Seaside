tests
testQueryFieldOverridesCookie
	| cookie1 key context |
	cookie1 := WARequestCookie key: strategy keyCookieName value: 'cookie1'.
	context := self requestContext.
	context request setCookies: (Array with: cookie1).
	context request uri addField: strategy keyField value: 'value1'. 
	
	key := strategy keyFromContext: context.
	self assert: key = 'value1'