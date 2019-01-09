*seaside-tests-core
testSubStringsInSplitByDo
	| subStrings |
	subStrings := Array streamContents: [ :stream |
		GRPlatform subStringsIn: 'aaa' splitBy: $, do: [ :each |
			stream nextPut: each ] ].
	self assert: subStrings equals: #('aaa').
	
	subStrings := Array streamContents: [ :stream |
		GRPlatform subStringsIn: 'aaa,' splitBy: $, do: [ :each |
			stream nextPut: each ] ].
	self assert: subStrings equals: #('aaa').
	
	subStrings := Array streamContents: [ :stream |
		GRPlatform subStringsIn: ',aaa' splitBy: $, do: [ :each |
			stream nextPut: each ] ].
	self assert: subStrings equals: #('aaa').
	
	subStrings := Array streamContents: [ :stream |
		GRPlatform subStringsIn: 'aaa,bbb' splitBy: $, do: [ :each |
			stream nextPut: each ] ].
	self assert: subStrings equals: #('aaa' 'bbb')