Extension { #name : #GRPlatformTest }

{ #category : #'*seaside-tests-core' }
GRPlatformTest >> testSubStringsInSplit [
	| subStrings |
	subStrings := GRPlatform subStringsIn: 'aaa' splitBy: $,.
	self assert: subStrings asArray equals: #('aaa').
	
	subStrings := GRPlatform subStringsIn: 'aaa,' splitBy: $,.
	self assert: subStrings asArray equals: #('aaa').
	
	subStrings := GRPlatform subStringsIn: ',aaa' splitBy: $,.
	self assert: subStrings asArray equals: #('aaa').
	
	subStrings := GRPlatform subStringsIn: 'aaa,bbb' splitBy: $,.
	self assert: subStrings asArray equals: #('aaa' 'bbb')
]

{ #category : #'*seaside-tests-core' }
GRPlatformTest >> testSubStringsInSplitByDo [
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
]

{ #category : #'*seaside-tests-core' }
GRPlatformTest >> testSubStringsInSplitCollect [
	| subStrings |
	subStrings := GRPlatform subStringsIn: '111' splitBy: $, collect: [ :each | each greaseInteger ].
	self assert: subStrings asArray equals: #(111).
	
	subStrings := GRPlatform subStringsIn: '111,' splitBy: $, collect: [ :each | each greaseInteger ].
	self assert: subStrings asArray equals: #(111).
	
	subStrings := GRPlatform subStringsIn: ',111' splitBy: $, collect: [ :each | each greaseInteger ].
	self assert: subStrings asArray equals: #(111).
	
	subStrings := GRPlatform subStringsIn: '111,222' splitBy: $, collect: [ :each | each greaseInteger ].
	self assert: subStrings asArray equals: #(111 222)
]
