Class {
	#name : #JQDroppableFunctionalTest,
	#superclass : #JQUiFunctionalTest,
	#instVars : [
		'selected'
	],
	#category : 'JQuery-Tests-UI-Functional'
}

{ #category : #accessing }
JQDroppableFunctionalTest >> colors [
	^ #(red green blue)
]

{ #category : #initialization }
JQDroppableFunctionalTest >> initialize [
	super initialize.
	selected := Bag new
]

{ #category : #rendering }
JQDroppableFunctionalTest >> renderContentOn: html [
	self renderInstructionsOn: html.
	self renderInventoryOn: html.
	self renderSelectedOn: html
]

{ #category : #rendering }
JQDroppableFunctionalTest >> renderInstructionsOn: html [
	html paragraph: 'Drag the colored items from the inventory on top into the list of selected items below. To remove selected items drag them out of the selected list.'
]

{ #category : #rendering }
JQDroppableFunctionalTest >> renderInventoryOn: html [
	html div class: 'inventory ui-corner-all'; with: [ 
		self colors do: [ :each |
			html div
				class: each;
				passenger: each;
				script: (html jQuery new draggable
					revert: true) ] ]
]

{ #category : #rendering }
JQDroppableFunctionalTest >> renderSelectedItemsOn: html [
	self selected do: [ :each |
		html div 
			class: each; 
			passenger: each;
			script: (html jQuery new draggable
				onStop: (html jQuery this effect 
					percent: 1; puff; 
					onComplete: (html jQuery this parent load html: [ :r | 
						self selected remove: each ifAbsent: [ ].
						self renderSelectedItemsOn: r ]))) ]
]

{ #category : #rendering }
JQDroppableFunctionalTest >> renderSelectedOn: html [
	html div
		class: 'selected ui-corner-all'; 
		script: (html jQuery new droppable
			onDrop: (html jQuery this load
				callbackDroppable: [ :event | self selected add: (event at: #draggable) ];
				html: [ :r | self renderSelectedItemsOn: r ]));
		with: [ self renderSelectedItemsOn: html ]
]

{ #category : #accessing }
JQDroppableFunctionalTest >> selected [
	^ selected
]

{ #category : #accessing }
JQDroppableFunctionalTest >> selectors [
	^ #(renderContentOn: renderInventoryOn: renderSelectedOn: renderSelectedItemsOn:)
]

{ #category : #hooks }
JQDroppableFunctionalTest >> style [
	^ '.inventory, .selected { 
	height: 4em;
	padding: 0.5em;
	margin-bottom: 0.5em;
	background-color: #ddd; 
	border-bottom: 1px solid #ccc;
}
.inventory div, .selected div {
	float: left;
	width: 4em;
	height: 4em;
	border-width: 0;
	margin-right: 0.5em;
}'
]

{ #category : #accessing }
JQDroppableFunctionalTest >> title [
	^ 'Droppable Interaction'
]

{ #category : #accessing }
JQDroppableFunctionalTest >> url [
	^ 'http://docs.jquery.com/UI/Droppable'
]
