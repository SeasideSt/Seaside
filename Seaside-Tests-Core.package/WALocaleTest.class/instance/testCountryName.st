tests
testCountryName
	| locale |
	locale := WALocale fromString: 'de-CH'.
	
	self assert: locale countryName = 'SWITZERLAND'.
	
	locale := WALocale fromString: 'en-ZA'.
	
	self assert: locale countryName = 'SOUTH AFRICA'.
	
	locale := WALocale fromString: 'eng-ZAF'.
	
	self assert: locale countryName = 'SOUTH AFRICA'
