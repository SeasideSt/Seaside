*seaside-tests-core
testSubStringsInSplitCollect
	| subStrings |
	subStrings := GRPlatform subStringsIn: '111' splitBy: $, collect: [ :each | each greaseInteger ].
	self assert: subStrings asArray equals: #(111).
	
	subStrings := GRPlatform subStringsIn: '111,' splitBy: $, collect: [ :each | each greaseInteger ].
	self assert: subStrings asArray equals: #(111).
	
	subStrings := GRPlatform subStringsIn: ',111' splitBy: $, collect: [ :each | each greaseInteger ].
	self assert: subStrings asArray equals: #(111).
	
	subStrings := GRPlatform subStringsIn: '111,222' splitBy: $, collect: [ :each | each greaseInteger ].
	self assert: subStrings asArray equals: #(111 222)