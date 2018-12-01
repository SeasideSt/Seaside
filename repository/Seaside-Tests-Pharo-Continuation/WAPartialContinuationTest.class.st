Class {
	#name : #WAPartialContinuationTest,
	#superclass : #TestCase,
	#category : 'Seaside-Tests-Pharo-Continuation'
}

{ #category : #private }
WAPartialContinuationTest >> callcc: aBlock [
	^ WAPartialContinuation currentDo: aBlock
]

{ #category : #private }
WAPartialContinuationTest >> mark: aBlock [
	^ aBlock on: WAMarkerRequest do: [ :request | request resume: thisContext home ]
]

{ #category : #private }
WAPartialContinuationTest >> markDiscardingResultOf: aBlock [
	aBlock on: WAMarkerRequest do: [ :request | request resume: thisContext home ]
]

{ #category : #tests }
WAPartialContinuationTest >> testEnsure [
	| kk count |
	
	" before evaluation, ensure blocks should be unwound "
	count := 0.
	self mark: [ 2 * (self callcc: [ :cc | kk := cc. 0 ]) ].
	self assert: (self mark: [
		[ kk value: 3 ]
			ensure: [ count := count + 1 ] ])
				= 6.
	self assert: count = 1.
	
	" ensure blocks within the continuation should be unwound as well "
	count := 0.
	self mark: [ [ 2 * (self callcc: [ :cc | kk := cc. 0 ]) ] ensure: [ count := count + 1 ] ].
	self assert: count = 1.
	self assert: (kk value: 2) = 4.
	self assert: count = 2.
	self assert: (kk value: 3) = 6.
	self assert: count = 3
]

{ #category : #tests }
WAPartialContinuationTest >> testMarkerOnValue [
	| kk captured seen |
	captured := false.
	seen := false.
	self	shouldnt: [
			self markDiscardingResultOf: [ | value |
				value := self callcc: [ :cc | kk := cc. captured := true ].
				seen := true.
				value ] ]
		raise: Error.
		
	self assert: captured.
	self assert: seen.
	captured := false.
	seen := false.
	"Make sure the marker method is not included in the continuation and the continuation returns directly
	into the marker method."
	self assert: (self mark: [ kk value: 123. 456 ]) = 123.
	self deny: captured.
	self assert: seen
]

{ #category : #tests }
WAPartialContinuationTest >> testNestedEvaluation [
	| k1 k2 |
	self assert: (self mark: [ 
		2 * (self callcc: [ :c1 | 
			k1 := c1. 
			3 * (self callcc: [ :c2 |
				k2 := c2.
				4 ]) ]) ])
					= 24.
					
	self assert: (self mark: [
		k1 value: 5 ])
			= 10.
	self assert: (self mark: [
		k2 value: 5 ])
			= 30
]

{ #category : #tests }
WAPartialContinuationTest >> testNoMarkerOnCall [
	| captured seen |
	captured := false.
	seen := false.
	self
		should: [
			self callcc: [ :cc | captured := true ].
			seen := true ]
		raise: Error.
		
	self deny: captured.
	self deny: seen
]

{ #category : #tests }
WAPartialContinuationTest >> testNoMarkerOnValue [
	| kk captured seen |
	captured := false.
	seen := false.
	self	shouldnt: [
			self markDiscardingResultOf: [
				| value |
				value := self callcc: [ :cc | kk := cc. captured := true ].
				seen := true.
				value ] ]
		raise: Error.
		
	self assert: captured.
	self assert: seen.
	captured := false.
	seen := false.
	"Make sure the marker method was not included in the continuation"
	self assert: (kk value: 123) = 123.
	self deny: captured.
	self assert: seen
]

{ #category : #tests }
WAPartialContinuationTest >> testReentrant [
	| kk |
	self assert: (self mark: [ 
		2 * (self callcc: [ :cc | 
			kk := cc. 2 ]) ]) 
				= 4.
	
	self assert: (self mark: [
		kk value: 3 ]) 
			= 6.
	self assert: (self mark: [
		kk value: 4 ]) 
			= 8.
	self assert: (self mark: [
		kk value: 5 ]) 
			= 10
]

{ #category : #tests }
WAPartialContinuationTest >> testSimple [
	self assert: (self mark: [ self callcc: [ :cc | cc value: true ] ])
]
