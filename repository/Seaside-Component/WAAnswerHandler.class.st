"
I am the specific decoration to handle the answer of a given block.
"
Class {
	#name : #WAAnswerHandler,
	#superclass : #WADecoration,
	#instVars : [
		'block'
	],
	#category : 'Seaside-Component-Base'
}

{ #category : #accessing }
WAAnswerHandler >> block: aBlock [
	block := aBlock
]

{ #category : #processing }
WAAnswerHandler >> handleAnswer: anObject continueWith: aBlock [
	block valueWithPossibleArguments: (Array with:  anObject)
]
