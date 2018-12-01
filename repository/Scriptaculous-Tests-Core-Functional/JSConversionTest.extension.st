Extension { #name : #JSConversionTest }

{ #category : #'*scriptaculous-tests-core' }
JSConversionTest >> testInterval [
	self
		assert: (self mock interval: 2 seconds)
		equals: 'setInterval(function(){mock},2000)'
]

{ #category : #'*scriptaculous-tests-core' }
JSConversionTest >> testPoint [
	self assert: 1 @ 2 equals: '[1,2]'
]
