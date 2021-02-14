Class {
	#name : #WAContinuation,
	#superclass : #WAAbstractContinuation,
	#instVars : [
		'values'
	],
	#category : 'Seaside-GemStone-Continuation'
}

{ #category : #'instance creation' }
WAContinuation class >> current [
	^ self fromContinuation: (GsProcess continuationFromLevel: 2)
]

{ #category : #'instance creation' }
WAContinuation class >> currentDo: aBlock [
	^ aBlock callCC
]

{ #category : #'instance creation' }
WAContinuation class >> fromContinuation: aContinuation [
	^self new initializeFromContinuation: aContinuation
]

{ #category : #private }
WAContinuation >> initializeFromContinuation: aContinuation [
	values := aContinuation
]

{ #category : #accessing }
WAContinuation >> numArgs [
	^ 1
]

{ #category : #evaluating }
WAContinuation >> value [
	self value: nil
]

{ #category : #evaluating }
WAContinuation >> value: v [

  ^values value: v.
]

{ #category : #evaluating }
WAContinuation >> valueWithArguments: anArray [
	anArray size = 1
		ifFalse: [ ^ self error: 'continuations can only be resumed with one argument' ].
	self value: anArray first
]
