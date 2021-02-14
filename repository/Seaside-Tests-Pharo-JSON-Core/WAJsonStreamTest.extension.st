Extension { #name : #WAJsonStreamTest }

{ #category : #'*seaside-tests-pharo-json-core' }
WAJsonStreamTest >> testScaledDecimal [
	self assert: 123.4s1 equals: '123.4'
]
