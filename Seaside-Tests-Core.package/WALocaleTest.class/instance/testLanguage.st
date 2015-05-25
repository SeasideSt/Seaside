tests
testLanguage
	| locale |
	locale := WALocale language: 'de'.
	self assert: locale language = 'de'.
	self assert: locale country isNil