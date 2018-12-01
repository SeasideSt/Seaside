"
Abstract base class for ordered and unordered list tags.

Ordered and unordered lists are rendered in an identical manner except that visual user agents number ordered list items. User agents may present those numbers in a variety of ways. Unordered list items are not numbered.

Both types of lists are made up of sequences of list items defined by the LI element (whose end tag may be omitted).

Lists may also be nested.
"
Class {
	#name : #WAListTag,
	#superclass : #WACollectionTag,
	#instVars : [
		'callbackBlock'
	],
	#category : 'Seaside-Canvas-Tags'
}

{ #category : #callbacks }
WAListTag >> callback: aBlock [
	callbackBlock := aBlock fixCallbackTemps
]

{ #category : #testing }
WAListTag >> hasCallback [
	^ callbackBlock notNil
]

{ #category : #private }
WAListTag >> performCallback: anObject [
	self hasCallback ifTrue: [ callbackBlock value: anObject ]
]

{ #category : #private }
WAListTag >> renderListItem: anObject labelled: aString [
	canvas listItem
		class: 'option-selected' if: (self isSelected: anObject);
		with: [
			self hasCallback
				ifFalse: [ canvas render: aString ]
				ifTrue: [
					canvas anchor
						callback: [ self performCallback: anObject ];
						with: aString ] ]
]
