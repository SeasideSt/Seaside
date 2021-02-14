"
I am used to represent html attribute values that can be sent separately to a brush but eventually need to be printed as a single attribute string. I was introduced to optimize html rendering where String concatentation is slow. See https://github.com/seasidest/seaside/issues/816

E.g. in the following code, multiple values for 'class' are sent to the anchor brush and they are eventually concatenated in the output
html anchor
   class: 'mycss-strong';
   class: 'mycss-bold';
   class: 'mycss-alignright';
   with: 'some text'

"
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
