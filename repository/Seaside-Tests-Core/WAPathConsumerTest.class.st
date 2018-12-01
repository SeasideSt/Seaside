Class {
	#name : #WAPathConsumerTest,
	#superclass : #TestCase,
	#instVars : [
		'consumer'
	],
	#category : 'Seaside-Tests-Core-RequestHandling'
}

{ #category : #running }
WAPathConsumerTest >> setUp [
	super setUp.
	consumer := WAPathConsumer path: #('tweets' 'kentbeck') asOrderedCollection
]

{ #category : #tests }
WAPathConsumerTest >> testAtEnd [
	self deny: consumer atEnd.
	consumer next.
	self deny: consumer atEnd.
	consumer next.
	self assert: consumer atEnd
]

{ #category : #tests }
WAPathConsumerTest >> testNext [
	self assert: consumer next = 'tweets'.
	self assert: consumer next = 'kentbeck'.
	self should: [ consumer next ] raise: Error
]

{ #category : #tests }
WAPathConsumerTest >> testNextIfPresent [
	| evaluated |
	evaluated := false.
	consumer nextIfPresentDo: [ :next |
		 self assert: next = 'tweets'.
		evaluated := true ].
	self assert: evaluated.
	
	evaluated := false.
	consumer nextIfPresentDo: [ :next |
		 self assert: next = 'kentbeck'.
		evaluated := true ].
	self assert: evaluated.
	
	evaluated := false.
	consumer nextIfPresentDo: [ :next |
		evaluated := true ].
	self deny: evaluated
]

{ #category : #tests }
WAPathConsumerTest >> testPeek [
	self assert: consumer peek = 'tweets'.
	self assert: consumer peek = 'tweets'.
	consumer next.
	self assert: consumer peek = 'kentbeck'.
	self assert: consumer peek = 'kentbeck'.
	consumer next.
	self should: [ consumer peek ] raise: Error
]

{ #category : #tests }
WAPathConsumerTest >> testPeekToEnd [
	| result |
	result := Array with: 'tweets' with: 'kentbeck'.
	self assert: consumer peekToEnd = result.
	self deny: consumer atEnd.
	self assert: consumer next = 'tweets'.
	self assert: consumer next = 'kentbeck'.
	self assert: consumer atEnd
]

{ #category : #tests }
WAPathConsumerTest >> testTry [
	self deny: (consumer try: 'foo').
	self assert: (consumer try: 'tweets').
	self deny: (consumer try: 'tweets').
	self assert: (consumer try: 'kentbeck').
	self assert: consumer atEnd.
	self deny: (consumer try: 'kentbeck')
	
]

{ #category : #tests }
WAPathConsumerTest >> testUpToEnd [
	| result |
	result := OrderedCollection new add: 'tweets' ; add: 'kentbeck'; yourself.
	self assert: consumer upToEnd = result.
	self assert: consumer atEnd
]
