Class {
	#name : #WACollectionAttribute,
	#superclass : #WAListAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WACollectionAttribute >> accept: aVisitor [
	aVisitor visitCollectionAttribute: self
]

{ #category : #accessing }
WACollectionAttribute >> default: aCollection [
	super default: (Array withAll: aCollection)
]

{ #category : #initialization }
WACollectionAttribute >> initializeWithKey: aSymbol [
	super initializeWithKey: aSymbol.
	self default: #()
]

{ #category : #testing }
WACollectionAttribute >> isCollectionAttribute [
	^ true
]
