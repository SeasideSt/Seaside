Class {
	#name : #JQSelectableFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'selected'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #initialization }
JQSelectableFunctionalTest >> initialize [
	super initialize.
	selected := Set new
]

{ #category : #rendering }
JQSelectableFunctionalTest >> renderContentOn: html [
	html unorderedList
		script: (html jQuery new selectable
			onStop: (html jQuery ajax
				callback: [ :value | selected := value asSet ]
				passengers: (html jQuery this find: '.ui-selected')));
		with: [
			self vegetables do: [ :each |
				html listItem
					class: 'ui-corner-all';
					class: 'ui-selected' if: (selected includes: each);
					passenger: each;
					with: each ] ]
]

{ #category : #accessing }
JQSelectableFunctionalTest >> selectors [
	^ #(renderContentOn:)
]

{ #category : #hooks }
JQSelectableFunctionalTest >> style [
	^ '.ui-selectable, .ui-selectable li { list-style-type: none; padding: 0; margin: 0; }
.ui-selectable li { padding: 5px; margin: 5px; border: #e6e6e6 1px solid; }
.ui-selectable li.ui-selecting { background-color: #e6e6e6; }
.ui-selectable li.ui-selected { background-color: #dadada; }'
]

{ #category : #accessing }
JQSelectableFunctionalTest >> title [
	^ 'Selectable Interaction'
]

{ #category : #accessing }
JQSelectableFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Selectable'
]
