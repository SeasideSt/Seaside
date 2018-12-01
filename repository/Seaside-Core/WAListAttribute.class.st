"
WAListAttribute is an attribute that is restricted to a list of values. 

Instance Variables:
	options	<Block>	A block returning a list of possible values for the attribute
"
Class {
	#name : #WAListAttribute,
	#superclass : #WAAttribute,
	#instVars : [
		'optionsBlock'
	],
	#category : 'Seaside-Core-Configuration'
}

{ #category : #visiting }
WAListAttribute >> accept: aVisitor [
	aVisitor visitListAttribute: self
]

{ #category : #accessing }
WAListAttribute >> options [
	^ optionsBlock isNil
		ifTrue: [ #() ]
		ifFalse: [ optionsBlock value ]
]

{ #category : #accessing }
WAListAttribute >> options: aBlock [
	optionsBlock := aBlock
]

{ #category : #converting }
WAListAttribute >> valueFromString: aString [ 
	self error: 'List attributes cannot be converted from Strings'
]
