"
I exsit so that script generator classes can be tested without loading the Javascript package.
"
Class {
	#name : #WAStubJsObject,
	#superclass : #WAObject,
	#instVars : [
		'value'
	],
	#category : 'Seaside-Tests-Canvas'
}

{ #category : #'instance creation' }
WAStubJsObject class >> on: anObject [
	^ self basicNew initializeOn: anObject
]

{ #category : #initialization }
WAStubJsObject >> initializeOn: anObject [
	self initialize.
	value := anObject
]

{ #category : #writing }
WAStubJsObject >> javascriptOn: aStream [
	aStream nextPutAll: value
]
