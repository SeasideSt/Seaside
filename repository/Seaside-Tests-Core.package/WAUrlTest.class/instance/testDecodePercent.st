testing-parsing
testDecodePercent
	"regression test for https://github.com/SeasideSt/Seaside/issues/1157"
	| element |
	url := WAUrl absolute: 'http://www.seaside.st/%21%2a%7A'.
	element := url path first.
	self assert: element equals: (String
											with: (Character codePoint: 16r21)
											with: (Character codePoint: 16r2a)
											with: (Character codePoint: 16r7A))