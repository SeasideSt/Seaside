Class {
	#name : #WAPartialContinuationTest,
	#superclass : #TestCase,
	#instVars : [
		'gsSeen'
	],
	#category : 'Seaside-Tests-GemStone-Continuation'
}

{ #category : #private }
WAPartialContinuationTest >> callbackMarker [

	| level aFrame markMeth markDiscardingMeth |
	markMeth := self class compiledMethodAt: #mark:.
	markDiscardingMeth := self class compiledMethodAt: #markDiscardingResultOf:.
	level := 1.
	[ (aFrame := GsProcess _frameContentsAt: level) ~~ nil ]
		whileTrue: [
			(((aFrame at: 1) == markMeth) or: [ (aFrame at: 1) == markDiscardingMeth ])
				ifTrue: [ ^aFrame at: 1 ].
			level := level + 1 ].
	^nil
]

{ #category : #private }
WAPartialContinuationTest >> callcc: aBlock [
	^WAPartialContinuation 
		currentDo: aBlock 
		markerBlock: [ self callbackMarker ]
]

{ #category : #private }
WAPartialContinuationTest >> mark: aBlock [
	^ aBlock value
]

{ #category : #private }
WAPartialContinuationTest >> markDiscardingResultOf: aBlock [
	[ aBlock value ] value
]

{ #category : #testing }
WAPartialContinuationTest >> testEnsure [
	| kk count |
	self flag: #skipit. "this test doesn't need to pass ... behaviour of ensure blocks is unspecified"
	true ifTrue: [ ^self ].
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

{ #category : #testing }
WAPartialContinuationTest >> testGemStoneMarkerOnValue [
	| kk captured result |
	captured := false.
	gsSeen := false.
	self	shouldnt: [
			self markDiscardingResultOf: [ | value |
				value := self callcc: [ :cc | kk := cc. captured := true ].
				gsSeen := true.
				value ] ]
		raise: Error.
	self assert: captured.
	self assert: gsSeen.
	captured := false.
	gsSeen := false.
	"Make sure the marker method is not included in the continuation and the continuation returns directly
	into the marker method."
	self assert: (result := self mark: [ kk value: 123. 456 ]) = 123.
	self assert: gsSeen
]

{ #category : #testing }
WAPartialContinuationTest >> testGemStoneNoMarkerOnValue [
	| kk captured result |
	captured := false.
	gsSeen := false.
	self	shouldnt: [
			self markDiscardingResultOf: [ | value |
				value := self callcc: [ :cc | kk := cc. captured := true ].
				gsSeen := true.
				value ] ]
		raise: Error.
	self assert: captured.
	self assert: gsSeen.
	captured := false.
	gsSeen := false.
	"Make sure the marker method was not included in the continuation"
	self assert: (result := kk value: 123) = 123.
	self deny: captured.
	self assert: gsSeen
]

{ #category : #testing }
WAPartialContinuationTest >> testMarkerOnValue [
	| kk captured seen result |
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
	true ifTrue: [ ^self ]. "avoid stomping on contexts"
	captured := false.
	seen := false.
	"Make sure the marker method is not included in the continuation and the continuation returns directly
	into the marker method."
	self assert: (result := self mark: [ kk value: 123. 456 ]) = 123.
	"known bug ... setting variables rooted in home context when intervening contexts are spliced out 
	 by partial continustaions, doesn't work"
	false 
		ifTrue: [
			self deny: captured.
			self assert: seen ].
]

{ #category : #testing }
WAPartialContinuationTest >> testMarkerOnValueNoShouldntBlock [
	| kk captured seen result |
	captured := false.
	seen := false.
	self markDiscardingResultOf: [ | value |
		value := self callcc: [ :cc | kk := cc. captured := true ].
		seen := true.
		value ].
	self assert: captured.
	self assert: seen.
	captured := false.
	seen := false.
	"Make sure the marker method is not included in the continuation and the continuation returns directly
	into the marker method."
	self assert: (result := self mark: [ kk value: 123. 456 ]) = 123.
	self deny: captured.
	 ((System stoneVersionAt: 'gsVersion') beginsWith: '3.') 
		ifTrue: [
			"Gs64 v3.0 deviation, was self assert: seen, but home context VC not unified after installing the partial continuation"
			self deny: seen ]
		ifFalse: [  self assert: seen ]
]

{ #category : #testing }
WAPartialContinuationTest >> testNestedEvaluation [
	| k1 k2 val |
	self assert: (self mark: [ 
		2 * (self callcc: [ :c1 | 
			k1 := c1. 
			3 * (self callcc: [ :c2 |
				k2 := c2.
				4 ]) ]) ])
					= 24.
					
	self assert: (val := self mark: [
		k1 value: 5 ])
			= 10.
	self assert: (val := self mark: [
		k2 value: 5 ])
			= 30
]

{ #category : #testing }
WAPartialContinuationTest >> testNoMarkerOnCall [
	| captured seen |
	captured := false.
	seen := false.
	self	should: [ self callcc: [ :cc | captured := true ]. seen := true ]
		raise: Error.
		
	self deny: captured.
	self deny: seen.
]

{ #category : #testing }
WAPartialContinuationTest >> testNoMarkerOnValue [
	| kk captured seen result |
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
	true ifTrue: [ ^self ]. "avoid stomping on contexts"
	captured := false.
	seen := false.
	"Make sure the marker method was not included in the continuation"
	self assert: (result := kk value: 123) = 123.
	"known bug ... setting variables rooted in home context when intervening contexts are spliced out 
	 by partial continustaions, doesn't work"
	false 
		ifTrue: [
			self deny: captured.
			self assert: seen ].
]

{ #category : #testing }
WAPartialContinuationTest >> testNoMarkerOnValueNoShouldntBlock [
	| kk captured seen result |
	captured := false.
	seen := false.
	self markDiscardingResultOf: [ | value |
		value := self callcc: [ :cc | kk := cc. captured := true ].
		seen := true.
		value ].
		
	self assert: captured.
	self assert: seen.
	captured := false.
	seen := false.
	"Make sure the marker method was not included in the continuation"
	self assert: (result := kk value: 123) = 123.
	self deny: captured.
	 ((System stoneVersionAt: 'gsVersion') beginsWith: '3.') 
		ifTrue: [
			"Gs64 v3.0 deviation, was self assert: seen, but home context VC not unified after installing the partial continuation"
			self deny: seen ]
		ifFalse: [  self assert: seen ]
]

{ #category : #testing }
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

{ #category : #testing }
WAPartialContinuationTest >> testSimple [
	self assert: (self mark: [ self callcc: [ :cc | cc value: true ] ]).
]
