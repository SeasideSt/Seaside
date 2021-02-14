Class {
	#name : #WAPlaceholderPathMatch,
	#superclass : #WAPPathMatch,
	#instVars : [
		'sourceIndex',
		'targetIndex'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #accessing }
WAPlaceholderPathMatch >> argumentCount [
	^ 1
]

{ #category : #initialization }
WAPlaceholderPathMatch >> initializeWithSourceIndex: anFirstInteger targetIndex: aSecondInteger [
	self initialize.
	sourceIndex := anFirstInteger.
	targetIndex := aSecondInteger
]

{ #category : #accessing }
WAPlaceholderPathMatch >> sourceIndex [
	^ sourceIndex
]

{ #category : #accessing }
WAPlaceholderPathMatch >> targetIndex [
	^ targetIndex
]
