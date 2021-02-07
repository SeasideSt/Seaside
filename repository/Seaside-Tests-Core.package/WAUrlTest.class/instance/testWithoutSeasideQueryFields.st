tests-copy
testWithoutSeasideQueryFields
	| copy |
	url addToPath: 'zork'.
	url addField: 'foo' value: 'bar'.
	url addField: '_k' value: '1'.
	url addField: '_s' value: '2'.
	url addField: '_d' value: '3'.
	copy := url withoutSeasideQueryFields.
	self assert: url printString = '/zork?foo=bar&_k=1&_s=2&_d=3'.
	self assert: copy printString = '/zork?foo=bar'