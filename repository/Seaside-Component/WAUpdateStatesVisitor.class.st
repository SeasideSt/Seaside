Class {
	#name : #WAUpdateStatesVisitor,
	#superclass : #WAPainterVisitor,
	#instVars : [
		'snapshot'
	],
	#category : 'Seaside-Component-Visitors'
}

{ #category : #'instance creation' }
WAUpdateStatesVisitor class >> new [
	^ self snapshot: WASnapshot new
]

{ #category : #'instance creation' }
WAUpdateStatesVisitor class >> snapshot: aSnapshot [
	^ self basicNew initializeWithSnapshot: aSnapshot; yourself
]

{ #category : #initialization }
WAUpdateStatesVisitor >> initializeWithSnapshot: aSnapshot [
	self initialize.
	snapshot := aSnapshot
]

{ #category : #accessing }
WAUpdateStatesVisitor >> snapshot [
	^ snapshot
]

{ #category : #visiting }
WAUpdateStatesVisitor >> visitPresenter: aPresenter [
	aPresenter updateStates: self snapshot
]
