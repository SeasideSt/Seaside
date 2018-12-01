Class {
	#name : #WAPartialContinuation,
	#superclass : #Object,
	#instVars : [
		'partial',
		'markerBlock'
	],
	#category : 'Seaside-GemStone-Continuation'
}

{ #category : #'instance creation' }
WAPartialContinuation class >> currentDo: aBlock markerBlock: markerBlock [
	| marker |
	marker := markerBlock value
		ifNil: [ WAMarkerNotFound signal: 'Marker not found when capturing partial continuation.' ].
	^ aBlock value: (self to: marker offset: 1 markerBlock: markerBlock)
]

{ #category : #private }
WAPartialContinuation class >> findFrameIndexFor: aCompiledMethod [
	"Return the deepest stack level for aCompiledMethod, counting from top of stack"
	
	| level markLevel aFrame |
	markLevel := nil.
	level := 1.
	[ (aFrame := GsProcess _frameContentsAt: level) ~~ nil ]
		whileTrue: [
			(aFrame at: 1) == aCompiledMethod 
				ifTrue: [ ^ level + 0].
			level := level + 1].
	^nil
]

{ #category : #'instance creation' }
WAPartialContinuation class >> to: aCompiledMethod offset: offset markerBlock: aBlock [

	| partial frameIndex |
	frameIndex := self findFrameIndexFor: aCompiledMethod.
	partial := GsProcess 
		partialContinuationFromLevel: 3 + offset
		to: frameIndex.
	^(self basicNew) 
		with: partial;
		markerBlock: aBlock;
		yourself
]

{ #category : #accessing }
WAPartialContinuation >> markerBlock [

	^markerBlock
]

{ #category : #accessing }
WAPartialContinuation >> markerBlock: aBlock [

	markerBlock := aBlock
]

{ #category : #evaluating }
WAPartialContinuation >> value [
	^ self value: nil
]

{ #category : #evaluating }
WAPartialContinuation >> value: anObject [ 

	| marker frameIndex |
	marker := self markerBlock value.
	marker isNil
		ifTrue: [ 
			marker := ((GsProcess _frameContentsAt: 2) at: 1).
			frameIndex := 2 ]
		ifFalse: [ frameIndex := self class findFrameIndexFor: marker ].
	^GsProcess 
		installPartialContinuation: partial 
		atLevel: frameIndex
		value: anObject
]

{ #category : #evaluating }
WAPartialContinuation >> valueWithArguments: anArray [
	anArray size = 1
		ifTrue: [ self value: anArray first ]
		ifFalse: [ GRInvalidArgumentCount signal: 'Continuations can only be resumed with one argument.' ]
]

{ #category : #evaluating }
WAPartialContinuation >> valueWithPossibleArguments: anArray [
	^ self value: anArray first
]

{ #category : #initialization }
WAPartialContinuation >> with: aWAPartialContinuation [

	partial := aWAPartialContinuation
]
