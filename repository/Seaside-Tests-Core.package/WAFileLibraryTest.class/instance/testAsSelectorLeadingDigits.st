tests
testAsSelectorLeadingDigits
	| library |
	library := WATestingFiles default.
	self assert: (library asSelector: '1readme.txt') = #_1readmeTxt.
	self assert: (library asSelector: '123456789readme.txt') = #_123456789readmeTxt.
	self assert: (library asSelector: '123456789readme89.txt') = #_123456789readme89Txt.