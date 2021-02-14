Class {
	#name : #JQSortableFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'items'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #initialization }
JQSortableFunctionalTest >> initialize [
	super initialize.
	items := self vegetables
]

{ #category : #rendering }
JQSortableFunctionalTest >> renderContentOn: html [
	html unorderedList
		script: (html jQuery new sortable
			onStop: (html jQuery ajax
				callback: [ :values | items := values ]
				passengers: (html jQuery this find: 'li')));
		with: [
			items do: [ :each |
				html listItem
					class: 'ui-corner-all';
					passenger: each;
					with: each ] ]
]

{ #category : #accessing }
JQSortableFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #hooks }
JQSortableFunctionalTest >> style [
	^ '.ui-sortable, .ui-sortable li { list-style-type: none; padding: 0; margin: 0; }
.ui-sortable li { cursor: move; padding: 5px; margin: 5px; background-color: #fff; border: #e6e6e6 1px solid; }'
]

{ #category : #accessing }
JQSortableFunctionalTest >> title [
	^ 'Sortable Interaction'
]

{ #category : #accessing }
JQSortableFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Sortable'
]
