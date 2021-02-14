Class {
	#name : #WAPlaceholderParameterMatch,
	#superclass : #WAParameterMatch,
	#instVars : [
		'index'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAPlaceholderParameterMatch class >> name: aString index: anInteger [
	^ self basicNew initializeWithName: aString index: anInteger
]

{ #category : #'instance creation' }
WAPlaceholderParameterMatch class >> name: aNameString value: aValueString arguments: aCollectionOfStrings [
	^ self
		name: aNameString
		index: (self
			targetIndexOf: (aValueString copyFrom: 2 to: aValueString size - 1)
			arguments: aCollectionOfStrings)
]

{ #category : #accessing }
WAPlaceholderParameterMatch >> argumentCount [
	^ 1
]

{ #category : #accessing }
WAPlaceholderParameterMatch >> index [
	^ index
]

{ #category : #initialization }
WAPlaceholderParameterMatch >> initializeWithName: aString index: anInteger [
	self initializeWithName: aString.
	index := anInteger
]

{ #category : #public }
WAPlaceholderParameterMatch >> mapArgumentsWithParameters: aDictionary into: anArray [
	anArray at: index put: (aDictionary at: name)
]

{ #category : #testing }
WAPlaceholderParameterMatch >> matchesName: aNameString value: aValueString [
	^ name = aNameString
]
