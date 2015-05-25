tests-adding
testInvalidSyntax
	"Regression test for:
	http://code.google.com/p/seaside/issues/detail?id=762
	
	ANSI #next
	The result is undefined if there the receiver has no future sequence values."
	self 
		should: [ WAUrl decodePercent: 'abc%' ]
		raise: WAInvalidUrlSyntaxError