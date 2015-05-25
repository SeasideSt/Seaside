tests
testAsSelectorLeadingDigits
	| library |
	library := WATestingFiles default.
	self assert: (library asSelector: '1readme.txt') = #readmeTxt.
	self assert: (library asSelector: '123456789readme.txt') = #readmeTxt.
	self assert: (library asSelector: '123456789readme89.txt') = #readme89Txt