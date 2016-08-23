*seaside-tests-core
testSubStringsInSplit
	| subStrings |
	subStrings := GRPlatform subStringsIn: 'aaa' splitBy: $,.
	self assert: subStrings asArray equals: #('aaa').
	
	subStrings := GRPlatform subStringsIn: 'aaa,' splitBy: $,.
	self assert: subStrings asArray equals: #('aaa').
	
	subStrings := GRPlatform subStringsIn: ',aaa' splitBy: $,.
	self assert: subStrings asArray equals: #('aaa').
	
	subStrings := GRPlatform subStringsIn: 'aaa,bbb' splitBy: $,.
	self assert: subStrings asArray equals: #('aaa' 'bbb')