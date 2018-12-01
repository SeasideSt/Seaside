Class {
	#name : #WAParameterMatch,
	#superclass : #WAMatch,
	#instVars : [
		'name'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #private }
WAParameterMatch class >> isPattern: aString [
	^ aString isEmpty not
		and: [ aString first = ${
		and: [ aString last = $} ] ]
]

{ #category : #'instance creation' }
WAParameterMatch class >> name: aKeyString value: aValueString arguments: aCollectionOfStrings [ 
	^ ((self isPattern: aValueString)
		ifTrue: [ WAPlaceholderParameterMatch ]
		ifFalse: [ WAExactParameterMatch ]) name: aKeyString value: aValueString arguments: aCollectionOfStrings 
]

{ #category : #accessing }
WAParameterMatch >> argumentCount [
	self subclassResponsibility
]

{ #category : #initialization }
WAParameterMatch >> initializeWithName: aString [
	self initialize.
	name := aString
]

{ #category : #public }
WAParameterMatch >> mapArgumentsWithParameters: aDictionary into: anArray [
	self subclassResponsibility
]

{ #category : #testing }
WAParameterMatch >> matchesName: aNameString value: aValueString [
	self subclassResponsibility
]
