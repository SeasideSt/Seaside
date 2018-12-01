Class {
	#name : #WAExactParameterMatch,
	#superclass : #WAParameterMatch,
	#instVars : [
		'value'
	],
	#category : 'Seaside-REST-Core-Route'
}

{ #category : #'instance creation' }
WAExactParameterMatch class >> name: aNameString value: aValueString arguments: aCollectionOfStrings [ 
	^ self basicNew initializeWithName: aNameString value: aValueString
]

{ #category : #accessing }
WAExactParameterMatch >> argumentCount [
	^ 0
]

{ #category : #initialization }
WAExactParameterMatch >> initializeWithName: aNameString value: aValueString [
	self initializeWithName: aNameString.
	value := aValueString
]

{ #category : #public }
WAExactParameterMatch >> mapArgumentsWithParameters: aDictionary into: anArray [
	"ignore"
]

{ #category : #testing }
WAExactParameterMatch >> matchesName: aNameString value: aValueString [
	^ name = aNameString and: [ value = aValueString ]
]
