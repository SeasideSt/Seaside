Extension { #name : #JSConversionTest }

{ #category : #'*javascript-tests-pharo-core' }
JSConversionTest >> testColor [
	self assert: Color red equals: '"#FF0000"'
]
