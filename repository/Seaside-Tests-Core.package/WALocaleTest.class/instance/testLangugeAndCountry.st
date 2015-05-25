tests
testLangugeAndCountry
	| locale |
	locale := WALocale fromString: 'de-CH'.
	self assert: locale language = 'de'.
	self assert: locale country = 'CH'.
	self assert: locale greaseString = 'de-CH'.
	locale := WALocale fromString: 'de_CH'.
	self assert: locale language = 'de'.
	self assert: locale country = 'CH'.
	self assert: locale greaseString = 'de-CH'