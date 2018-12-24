tests
testWriteAttributes
	| cookie |
	cookie := (WACookie key: 'ikuser' value: '1234')
		httpOnly: true;
		secure: true;
		sameSite: 'Strict';
		yourself.
	self assert: cookie rfc6265String = 'ikuser=1234; path=/; Secure; HttpOnly; SameSite=Strict'