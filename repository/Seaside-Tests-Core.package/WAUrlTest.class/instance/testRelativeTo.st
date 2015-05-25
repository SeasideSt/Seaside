tests-encoding
testRelativeTo
	| first second relativePath |
	first := WAUrl absolute: 'http://www.seaside.st/news'.
	second := WAUrl absolute: 'http://www.seaside.st/news/2008/April'.
	relativePath := first relativeTo: second.
	"we can not use #= here because of the Smalltalk that makes the easy parts more fucking tedious than Java"
	self assert: relativePath size = 2.
	self assert: relativePath first = '2008'.
	self assert: relativePath second = 'April'