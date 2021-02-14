"
WASelection creates a selectable list. Items can be any object. If optional labelBlock is not given the string versions of the items are displayed to user, otherwise labelBlock is used to generate the text to display for each item. Returns the item selected by user, (not the index nor the text shown the user). 

	| selection |
	selection := WASelection new.
	selection items: #(1 'cat' 'rat').
	selection 
		labelBlock: [:item | item = 1 ifTrue: ['First'] ifFalse: [item asUppercase]].
	result := self call: selection.
	self inform: result printString

Instance Variables:
	items	<Array of Objects> 	
	labelBlock	<One arg Block>	


"
Class {
	#name : #WASelection,
	#superclass : #WACanvasWidget,
	#instVars : [
		'items',
		'labelBlock'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #initialization }
WASelection >> initialize [
	super initialize.
	items := #().
	labelBlock := [ :each | each greaseString ]
]

{ #category : #accessing }
WASelection >> items [
	^ items
]

{ #category : #accessing }
WASelection >> items: aCollection [
	items := aCollection
]

{ #category : #accessing }
WASelection >> labelBlock [
	^ labelBlock
]

{ #category : #accessing }
WASelection >> labelBlock: aBlock [
	labelBlock := aBlock
]

{ #category : #rendering }
WASelection >> renderContentOn: html [
	html unorderedList
		list: self items;
		labels: self labelBlock;
		callback: [ :value | self answer: value ]
]
