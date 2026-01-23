tests
testAsSelectorFunky
	self assert: (WAFileLibrary asSelector: '1_2$3-4/5()6!7   8.9.test 1 2 3 me 4 5 6 .txt') = #_123456789test123me456Txt