"
I am a fake implementation of RcCounter
"
Class {
	#name : #WAReducedConflictCounter,
	#superclass : #WAObject,
	#instVars : [
		'count'
	],
	#category : 'Seaside-Core-Cache'
}

{ #category : #public }
WAReducedConflictCounter >> increment [
	count := count + 1
]

{ #category : #initialization }
WAReducedConflictCounter >> initialize [
	super initialize.
	count := 0
]

{ #category : #public }
WAReducedConflictCounter >> value [
	^ count
]
