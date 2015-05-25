tests
testIso3
	| locale |
	locale := WALocale fromString: 'gsw-CHE'.
	self assert: locale language = 'gsw'.
	self assert: locale country = 'CHE'.
	self assert: locale greaseString = 'gsw-CHE'.
	locale := WALocale fromString: 'gsw_CHE'.
	self assert: locale language = 'gsw'.
	self assert: locale country = 'CHE'.
	self assert: locale greaseString = 'gsw-CHE'