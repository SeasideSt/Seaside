"
WABatchedList helps display a collection of items across multiple pages. WABatchedList organizes a collection into pages (or batches) of batchSize items each and renders navigation links for a user to moved between pages. WABatchedList>>batch returns the items to display in the current page or batch. Your code has to display the items.

See WABatchSelection for example of usage.

Instance Variables:
	batchSize	<Integer>	number of items to display on a single page
	currentPage	<Integer>	 index of current page, starts a 1
	items	<SequenceableCollection of Objects>	objects organized into pages for display


"
Class {
	#name : #WABatchedList,
	#superclass : #WACanvasWidget,
	#instVars : [
		'items',
		'batchSize',
		'currentPage'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #accessing }
WABatchedList class >> exampleComponent [
	^ self new
		items: (1 to: 100);
		yourself
]

{ #category : #'accessing-calculated' }
WABatchedList >> batch [
	^ self items copyFrom: self startIndex to: self endIndex
]

{ #category : #accessing }
WABatchedList >> batchSize [
	^ batchSize
]

{ #category : #accessing }
WABatchedList >> batchSize: aNumber [
	batchSize := aNumber
]

{ #category : #accessing }
WABatchedList >> currentPage [
	^ currentPage
]

{ #category : #accessing }
WABatchedList >> currentPage: aNumber [
	currentPage := aNumber
]

{ #category : #'accessing-calculated' }
WABatchedList >> endIndex [
	^ self currentPage * self batchSize min: self items size
]

{ #category : #testing }
WABatchedList >> hasMultiplePages [
	^ self maxPages > 1
]

{ #category : #initialization }
WABatchedList >> initialize [
	super initialize.
	self batchSize: 10.
	self currentPage: 1
]

{ #category : #testing }
WABatchedList >> isOnFirstPage [
	^ self currentPage = 1
]

{ #category : #testing }
WABatchedList >> isOnLastPage [
	^ self currentPage = self maxPages
]

{ #category : #accessing }
WABatchedList >> items [
	^ items
]

{ #category : #accessing }
WABatchedList >> items: aCollection [
	items := aCollection
]

{ #category : #'accessing-calculated' }
WABatchedList >> maxPages [
	^ (self items size / self batchSize) ceiling
]

{ #category : #actions }
WABatchedList >> nextPage [
	self isOnLastPage
		ifFalse: [ self currentPage: self currentPage + 1 ]
]

{ #category : #'accessing-calculated' }
WABatchedList >> pageRange [
	^ self pageRangeStart to: self pageRangeEnd
]

{ #category : #'accessing-calculated' }
WABatchedList >> pageRangeEnd [
	^ self maxPages min: self currentPage + 9
]

{ #category : #'accessing-calculated' }
WABatchedList >> pageRangeStart [
	^ 1 max: self currentPage - 9
]

{ #category : #actions }
WABatchedList >> previousPage [
	self isOnFirstPage
		ifFalse: [ self currentPage: self currentPage - 1 ]
]

{ #category : #rendering }
WABatchedList >> renderContentOn: html [
	self maxPages = 0
		ifTrue: [ ^ self ].
	html div
		class: 'batch';
		with: [
			self renderPreviousOn: html.
			self renderPagesOn: html.
			self renderNextOn: html ]
]

{ #category : #rendering }
WABatchedList >> renderNextOn: html [
	html space.
	self isOnLastPage
		ifFalse: [ html anchor callback: [ self nextPage ]; with: '>>' ]
		ifTrue: [ html text: '>>' ]
]

{ #category : #rendering }
WABatchedList >> renderPagesOn: html [
	self pageRange
		do: [ :index |
			self currentPage = index
				ifFalse: [
					html anchor
						callback: [ self currentPage: index ];
						with: index ]
				ifTrue: [ html strong: index ] ]
		separatedBy: [ html space ]
]

{ #category : #rendering }
WABatchedList >> renderPreviousOn: html [
	self isOnFirstPage
		ifFalse: [ html anchor callback: [ self previousPage ]; with: '<<' ]
		ifTrue: [ html text: '<<' ].
	html space
]

{ #category : #'accessing-calculated' }
WABatchedList >> startIndex [
	^ (self currentPage - 1) * self batchSize + 1
]

{ #category : #hooks }
WABatchedList >> states [
	^ Array with: self
]
