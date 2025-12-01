Class {
	#name : 'WACurrentRequestContextTest',
	#superclass : 'TestCase',
	#category : 'Seaside-Tests-Core-RequestHandling',
	#package : 'Seaside-Tests-Core',
	#tag : 'RequestHandling'
}

{ #category : 'tests' }
WACurrentRequestContextTest >> testWithValue [
	WACurrentRequestContext
		use: 1
		during: [ self assert: WACurrentRequestContext value = 1 ]
]

{ #category : 'tests' }
WACurrentRequestContextTest >> testWithoutValue [
	self should: [ WACurrentRequestContext value ] raise: WARequestContextNotFound
]
