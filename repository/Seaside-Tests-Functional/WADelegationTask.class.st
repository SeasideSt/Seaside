Class {
	#name : #WADelegationTask,
	#superclass : #WATask,
	#instVars : [
		'component1',
		'component2'
	],
	#category : 'Seaside-Tests-Functional'
}

{ #category : #hooks }
WADelegationTask >> children [
	"Even if we component1 and component2, we have to return them as children as otherwise their decorations are not properly backtracked. See WADecorationTest."
	
	^ Array with: component1 with: component2
]

{ #category : #running }
WADelegationTask >> go [
	self call: component1 onAnswer: [ :a1 |
		self call: component2 onAnswer: [ ] ]
]

{ #category : #initialization }
WADelegationTask >> initialize [
	super initialize.
	component1 := WAFormDialog new
		addMessage: 'Step 1';
		yourself.
	component2 := WAFormDialog new
		addMessage: 'Step 2';
		yourself
]
