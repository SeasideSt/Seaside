Class {
	#name : #SUDragDropTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'cart'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #accessing }
SUDragDropTest >> cart [
	^ cart ifNil: [ cart := Bag new ]
]

{ #category : #accessing }
SUDragDropTest >> inventory [
	^ #( 'Broccoli' 'Brussels sprout' 'Cabbage' 'Cauliflower' 'Kale' 'Rapini' )
]

{ #category : #rendering }
SUDragDropTest >> renderCartItemsOn: html [
	self cart isEmpty
		ifTrue: [ ^ html text: 'Drop items here to add them to your cart.' ].
	self cart valuesAndCounts associations sorted do: [ :each |
		html div
			class: 'cart-item';
			passenger: each key;
			script: (html scriptaculous draggable
				revert: true;
				ghosting: true);
			with: [
				html text: each key.
				each value > 1
					ifTrue: [ html text: ' ('; text: each value; text: ')' ] ] ]
]

{ #category : #rendering }
SUDragDropTest >> renderCartOn: html id: cartId [
	html div
		class: 'cart';
		id: cartId;
		script: (html scriptaculous droppable
			accept: 'inventory-item';
			hoverclass: 'hover';
			onDrop: (html scriptaculous updater
				id: cartId;
				triggerPassenger: [ :value | self cart add: value ];
				callback: [ :renderer | self renderCartItemsOn: renderer ]));
		with: [ self renderCartItemsOn: html ]
]

{ #category : #rendering }
SUDragDropTest >> renderContentOn: html [
	| cartId |
	cartId := html nextId.
	self
		renderInventoryOn: html;
		renderCartOn: html id: cartId;
		renderTrashOn: html id: cartId
]

{ #category : #rendering }
SUDragDropTest >> renderInventoryOn: html [
	html div class: 'inventory'; with: [
		self inventory
			do: [ :each |
				html span
					passenger: each;
					class: 'inventory-item';
					script: (html scriptaculous draggable revert: true);
					with: each ]
			separatedBy: [ html text: ', ' ] ]
]

{ #category : #rendering }
SUDragDropTest >> renderTrashOn: html id: cartId [
	html div
		class: 'trash';
		script: (html scriptaculous droppable
			accept: 'cart-item';
			hoverclass: 'hover';
			onDrop: (html scriptaculous updater
				id: cartId;
				triggerPassenger: [ :value | self cart remove: value ];
				callback: [ :renderer | self renderCartItemsOn: renderer ];
				onSuccess: (html scriptaculous effect id: cartId; shake)));
		with: 'Drop items here to remove them from the cart.'
]

{ #category : #hooks }
SUDragDropTest >> style [
	^ 'div.inventory {
	margin: 1em;
	cursor: move}
	
div.cart {
	margin: 1em;
	padding: 1em;
	border: 1px dashed #e8a400;
	cursor: move}
	
div.trash {
	margin: 1em;
	padding: 1em;
	border: 1px dashed #c5dea1;
	cursor: move}
	
.hover {	background-color: #eeeeee}
	
'
]
