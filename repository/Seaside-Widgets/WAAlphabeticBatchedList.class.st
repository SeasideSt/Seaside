"
WAAlphabeticBatchedList organizes a collection of items into pages for display. A page contains all items whose string representation (item displayString) starts with the same character. WAAlphabeticBatchedList only displays the navigation (alphabet with links) for the list. Your code needs to display the current page.

Use WAAlphabeticBatchedList>>items: to set the collections of items.
Use WAAlphabeticBatchedList>>batch to get the items to display on the current page

See WABatchFunctionalTest for example of usage.
Select ""Batch"" tab of the Functional Seaside Test Suite to run an example  (http://127.0.0.1:xxxx/seaside/tests/alltests)

Instance Variables:
	currentPage	<Character>	the character of the curent page
	items	<(Collection of: (Object ))> collection of the items managed by WAAlphabeticBatchedList. Collection is sorted before items are displayed.

"
Class {
	#name : #WAAlphabeticBatchedList,
	#superclass : #WACanvasWidget,
	#instVars : [
		'items',
		'currentPage'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #'accessing-calculated' }
WAAlphabeticBatchedList >> allPages [
	^ 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
]

{ #category : #'accessing-calculated' }
WAAlphabeticBatchedList >> batch [
	^ items select: [ :each |
		each greaseString asUppercase first = self currentPage ]
]

{ #category : #accessing }
WAAlphabeticBatchedList >> currentPage [
	^ currentPage ifNil: [ currentPage := self validPages first ]
]

{ #category : #accessing }
WAAlphabeticBatchedList >> currentPage: aCharacter [
	currentPage := aCharacter
]

{ #category : #testing }
WAAlphabeticBatchedList >> isOnFirstPage [
	^ self validPages first = self currentPage
]

{ #category : #testing }
WAAlphabeticBatchedList >> isOnLastPage [
	^ self validPages last = self currentPage
]

{ #category : #accessing }
WAAlphabeticBatchedList >> items [
	^ items
]

{ #category : #accessing }
WAAlphabeticBatchedList >> items: aCollection [
	items := aCollection
]

{ #category : #actions }
WAAlphabeticBatchedList >> nextPage [
	self isOnLastPage
		ifFalse: [ currentPage := self validPages after: currentPage ]
]

{ #category : #actions }
WAAlphabeticBatchedList >> previousPage [
	self isOnFirstPage
		ifFalse: [ currentPage := self validPages before: currentPage ]
]

{ #category : #rendering }
WAAlphabeticBatchedList >> renderContentOn: html [
	items isEmpty
		ifTrue: [ ^ self ].
	html div
		class: 'batch';
		with: [
			self renderPreviousOn: html.
			self renderPagesOn: html.
			self renderNextOn: html ]
]

{ #category : #rendering }
WAAlphabeticBatchedList >> renderNextOn: html [
	html space.
	self isOnLastPage
		ifFalse: [ html anchor callback: [ self nextPage ]; with: '>>' ]
		ifTrue: [ html text: '>>' ]
]

{ #category : #rendering }
WAAlphabeticBatchedList >> renderPagesOn: html [
	self allPages
		do: [ :char |
			currentPage = char
				ifFalse: [
					(self validPages includes: char)
						ifTrue: [ html anchor callback: [ self currentPage: char ] ; with: char ]
						ifFalse: [ html text: char ] ]
				ifTrue: [ html strong: char ] ]
		separatedBy: [ html space ]
]

{ #category : #rendering }
WAAlphabeticBatchedList >> renderPreviousOn: html [
	self isOnFirstPage
		ifFalse: [ html anchor callback: [ self previousPage ]; with: '<<' ]
		ifTrue: [ html text: '<<' ].
	html space
]

{ #category : #hooks }
WAAlphabeticBatchedList >> states [
	^ Array with: self
]

{ #category : #'accessing-calculated' }
WAAlphabeticBatchedList >> validPages [
	^ (items collect: [ :each |
		each greaseString asUppercase first ]) asSet sorted
]
