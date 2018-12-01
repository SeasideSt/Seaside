Class {
	#name : #WAClassBindingCollectionAttribute,
	#superclass : #WAListAttribute,
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAClassBindingCollectionAttribute >> accept: aVisitor [
	aVisitor visitClassBindingCollectionAttribute: self
]

{ #category : #accessing }
WAClassBindingCollectionAttribute >> default: aCollection [
	default := aCollection collect: [ :each |
		GRPlatform current bindingOf: each ]
]

{ #category : #initialization }
WAClassBindingCollectionAttribute >> initializeWithKey: aSymbol [
	super initializeWithKey: aSymbol.
	self default: #()
]

{ #category : #testing }
WAClassBindingCollectionAttribute >> isCollectionAttribute [
	^ true
]
