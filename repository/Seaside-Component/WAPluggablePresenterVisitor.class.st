Class {
	#name : #WAPluggablePresenterVisitor,
	#superclass : #WAPainterVisitor,
	#instVars : [
		'block'
	],
	#category : 'Seaside-Component-Visitors'
}

{ #category : #'instance creation' }
WAPluggablePresenterVisitor class >> block: aBlock [
	^ self basicNew initializeWithBlock: aBlock; yourself
]

{ #category : #'instance creation' }
WAPluggablePresenterVisitor class >> new [
	^ self block: [ :presenter | ]
]

{ #category : #accessing }
WAPluggablePresenterVisitor >> block [
	^ block
]

{ #category : #initialization }
WAPluggablePresenterVisitor >> initializeWithBlock: aBlock [
	self initialize.
	block := aBlock
]

{ #category : #visiting }
WAPluggablePresenterVisitor >> visitPresenter: aPresenter [
	self block value: aPresenter
]
