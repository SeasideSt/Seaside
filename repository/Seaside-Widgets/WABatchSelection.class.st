"
WABatchSelection displays a list of objects. The list is show N (currently 8) items per page, with links to navigate to other pages if needed. Objects in the list must implement one method that returns text description of the item and one method that returns a name or label used as the link users click to select the item. The text description is displayed below the link.

Example
	items := OrderedCollection new.
	1 to: 20 do: [:each | items add: (Contact new name: each; phoneNumber: '54321';yourself)].
	selection := WABatchSelection items: items link: #name text: #phoneNumber.
	result := self call: selection.

	where the Contact class has methodsinstance vars ""phoneNumber"" and ""name"", with
	setter & getter methods.

Instance Variables:
	batcher	<WABatchedList>	description of batcher
	linkSelector	<Symbol>	method sent to items in list for link text
	textSelector	<Symbol>	method sent to items in list for text description


"
Class {
	#name : #WABatchSelection,
	#superclass : #WACanvasWidget,
	#instVars : [
		'batcher',
		'linkSelector',
		'textSelector'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #'instance creation' }
WABatchSelection class >> items: aCollection link: linkSelector text: textSelector [
	^ self new
		items: aCollection;
		linkSelector: linkSelector;
		textSelector: textSelector;
		yourself
]

{ #category : #accessing }
WABatchSelection >> batchSize [
	^ batcher batchSize
]

{ #category : #accessing }
WABatchSelection >> batchSize: aSize [
    batcher batchSize: aSize
]

{ #category : #hooks }
WABatchSelection >> children [
	^ Array with: batcher
]

{ #category : #commands }
WABatchSelection >> choose: anItem [
	self answer: anItem
]

{ #category : #accessing }
WABatchSelection >> items: aCollection [
	batcher := WABatchedList new
		items: aCollection;
		batchSize: 8;
		yourself
]

{ #category : #accessing }
WABatchSelection >> linkSelector: aSymbol [
	linkSelector := aSymbol
]

{ #category : #rendering }
WABatchSelection >> renderContentOn: html [
	html unorderedList: [
		batcher batch do: [ :each |
			html anchor
				callback: [ self choose: each ];
				with: (each perform: linkSelector).
			html break.
			html text: (each perform: textSelector).
			html paragraph ] ].
	html div
		style: 'text-align: center';
		with: batcher
]

{ #category : #accessing }
WABatchSelection >> textSelector: aSymbol [
	textSelector := aSymbol
]
