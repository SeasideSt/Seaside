tests-literals
testStringMultiByte
	"regression test for
	Issue 217: MultibyteString JavascriptOn infinite recursion [GemStone]
	http://code.google.com/p/glassdb/issues/detail?id=217"
	| multibyteString |
	multibyteString := String with: (Character codePoint: 8364).
	self assert: multibyteString equals: '"', multibyteString, '"'
