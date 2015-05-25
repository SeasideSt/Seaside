tests
testWithoutCountry
	| locale |
	locale := WALocale fromString: 'de_CH'.
	self assert: locale language = 'de'.
	self assert: locale country = 'CH'.
	locale := locale withoutCountry.
	self assert: locale language = 'de'.
	self assert: locale country isNil.
	
	locale := WALocale fromString: 'de'.
	self assert: locale language = 'de'.
	self assert: locale country isNil.
	locale := locale withoutCountry.
	self assert: locale language = 'de'.
	self assert: locale country isNil