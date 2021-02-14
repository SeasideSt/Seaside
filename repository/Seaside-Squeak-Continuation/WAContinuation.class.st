"
A WAContinuation is the Squeak implementation of a continuation. It serializes the whole stack into an array

Instance Variables
	values:		<Array<ContextPart>>

values
	- an Array of ContextPart and the values they store

"
Class {
	#name : #WAContinuation,
	#superclass : #GRObject,
	#instVars : [
		'values'
	],
	#category : 'Seaside-Squeak-Continuation'
}

{ #category : #'instance creation' }
WAContinuation class >> current [
	^ self fromContext: thisContext sender
]

{ #category : #'instance creation' }
WAContinuation class >> currentDo: aBlock [
	^ aBlock value: (self fromContext: thisContext sender)
]

{ #category : #'instance creation' }
WAContinuation class >> fromContext: aStack [
	^ self basicNew initializeFromContext: aStack
]

{ #category : #private }
WAContinuation >> initializeFromContext: aContext [
	| context stream |
	self initialize.
	context := aContext.
	stream := WriteStream on: (Array new: 200).
	[ context notNil ] whileTrue: [
		stream nextPut: context.
		1 to: context class instSize do: [ :index |
			stream nextPut: (context instVarAt: index) ].
		1 to: context size do: [ :index |
			stream nextPut: (context at: index) ].
		context := context sender ].
	values := stream contents
]

{ #category : #accessing }
WAContinuation >> numArgs [
	^ 1
]

{ #category : #private }
WAContinuation >> restoreValues [
	| stream context |
	stream := values readStream.
	[ stream atEnd ] whileFalse: [
		context := stream next.
		1 to: context class instSize do: [ :index |
			context instVarAt: index put: stream next ].
		1 to: context size do: [ :index |
			context at: index put: stream next ] ]
]

{ #category : #private }
WAContinuation >> terminate: aContext [
	| context |
	context := aContext.
	[ context notNil ] 
		whileTrue: [ context := context swapSender: nil ]
]

{ #category : #evaluating }
WAContinuation >> value [
	self value: nil
]

{ #category : #evaluating }
WAContinuation >> value: anObject [
	"Invoke the continuation and answer anObject as return value."

	self terminate: thisContext.
	self restoreValues.
	thisContext swapSender: values first.
	^ anObject
]

{ #category : #evaluating }
WAContinuation >> valueWithArguments: anArray [ 
	anArray size = 1 ifFalse: 
		[ ^ GRInvalidArgumentCount signal: 'Continuations can only be resumed with one argument.' ].
	self value: anArray first
]

{ #category : #evaluating }
WAContinuation >> valueWithPossibleArguments: anArray [
	^ self value: anArray first
]
