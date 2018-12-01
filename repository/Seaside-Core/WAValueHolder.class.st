"
I wrap a single object. I am like value holder except that I am portable and don't include the Model cruft in Squeak.
"
Class {
	#name : #WAValueHolder,
	#superclass : #WAObject,
	#instVars : [
		'contents'
	],
	#category : 'Seaside-Core-Utilities'
}

{ #category : #'instance creation' }
WAValueHolder class >> with: anObject [
	^ self new contents: anObject
]

{ #category : #accessing }
WAValueHolder >> contents [
	^ contents
]

{ #category : #accessing }
WAValueHolder >> contents: anObject [
	contents := anObject
]

{ #category : #printing }
WAValueHolder >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' contents: '; print: self contents
]
