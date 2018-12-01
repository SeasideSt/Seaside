Class {
	#name : #WAVisitor,
	#superclass : #WAObject,
	#category : 'Seaside-Core-Utilities'
}

{ #category : #visiting }
WAVisitor >> start: anObject [
	self visit: anObject
]

{ #category : #visiting }
WAVisitor >> visit: anObject [
	anObject accept: self
]

{ #category : #visiting }
WAVisitor >> visitAll: aCollection [
	aCollection do: [ :each | self visit: each ]
]
