"
I am a fake implementation of RcCounter, which is a Gemstone Smalltalk class that provides a counter object with reduced transaction conflicts.
"
Class {
	#name : 'WAReducedConflictCounter',
	#superclass : 'WAObject',
	#instVars : [
		'count'
	],
	#category : 'Seaside-Core-Cache',
	#package : 'Seaside-Core',
	#tag : 'Cache'
}

{ #category : 'public' }
WAReducedConflictCounter >> increment [
	count := count + 1
]

{ #category : 'initialization' }
WAReducedConflictCounter >> initialize [
	super initialize.
	count := 0
]

{ #category : 'public' }
WAReducedConflictCounter >> value [
	^ count
]
