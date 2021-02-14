Class {
	#name : #WAInitialRequestVisitor,
	#superclass : #WAPainterVisitor,
	#instVars : [
		'request'
	],
	#category : 'Seaside-Component-Visitors'
}

{ #category : #'instance creation' }
WAInitialRequestVisitor class >> new [
	^ self request: nil
]

{ #category : #'instance creation' }
WAInitialRequestVisitor class >> request: aRequest [
	^ self basicNew initializeWithRequest: aRequest; yourself
]

{ #category : #initialization }
WAInitialRequestVisitor >> initializeWithRequest: aRequest [
	self initialize.
	request := aRequest
]

{ #category : #accessing }
WAInitialRequestVisitor >> request [
	^ request
]

{ #category : #visiting }
WAInitialRequestVisitor >> visitPresenter: aPresenter [
	aPresenter initialRequest: self request
]
