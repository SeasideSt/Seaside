"
The output element represents the result of a calculation.
"
Class {
	#name : #WAOutputTag,
	#superclass : #WATagBrush,
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #attributes }
WAOutputTag >> for: aString [
	"The for content attribute allows an explicit relationship to be made between the result of a calculation and the elements that represent the values that went into the calculation or that otherwise influenced the calculation. The for attribute, if specified, must contain a string consisting of an unordered set of unique space-separated tokens that are case-sensitive, each of which must have the value of an ID of an element in the same Document."
	self attributeAt: 'for' put: aString
]

{ #category : #attributes }
WAOutputTag >> form: aString [
	"The form attribute is used to explicitly associate the output element with its form owner."
	self attributeAt: 'form' put: aString
]

{ #category : #attributes }
WAOutputTag >> name: aString [
	self attributeAt: 'name' put: aString
]

{ #category : #accessing }
WAOutputTag >> tag [
	^ 'output'
]
