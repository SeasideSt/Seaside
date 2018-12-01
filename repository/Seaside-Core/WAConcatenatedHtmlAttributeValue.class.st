Class {
	#name : #WAConcatenatedHtmlAttributeValue,
	#superclass : #WAObject,
	#instVars : [
		'values',
		'separator'
	],
	#category : 'Seaside-Core-Document'
}

{ #category : #'instance creation' }
WAConcatenatedHtmlAttributeValue class >> separator: aSeparator value: anFirstObject value: aSecondObject [
	^ self basicNew initializeWithSeparator: aSeparator value: anFirstObject value: aSecondObject
]

{ #category : #public }
WAConcatenatedHtmlAttributeValue >> addValue: anObject [
	values add: anObject
]

{ #category : #printing }
WAConcatenatedHtmlAttributeValue >> encodeOn: aDocument [ 
	values
		do: [ :each | aDocument print: each ]
		separatedBy: [ aDocument print: separator ]
]

{ #category : #initialization }
WAConcatenatedHtmlAttributeValue >> initializeWithSeparator: aSeparator value: anFirstObject value: aSecondObject [
	self initialize.
	separator := aSeparator.
	values := OrderedCollection new: 4.
	values add: anFirstObject.
	values add: aSecondObject
]

{ #category : #testing }
WAConcatenatedHtmlAttributeValue >> isConcatenatedHtmlAttributeValue [
	^ true
]
