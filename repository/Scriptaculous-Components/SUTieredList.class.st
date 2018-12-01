Class {
	#name : #SUTieredList,
	#superclass : #WAComponent,
	#instVars : [
		'selectionPath',
		'childrenBlock',
		'labelBlock',
		'uid'
	],
	#category : 'Scriptaculous-Components-Core'
}

{ #category : #accessing }
SUTieredList >> children: aOneArgumentBlock [
	"Define a one argument block that answers a collection of children for a given node."

	childrenBlock := aOneArgumentBlock
]

{ #category : #accessing }
SUTieredList >> cssClass [
	^ 'tieredList'
]

{ #category : #initialization }
SUTieredList >> initialize [
	super initialize.
	selectionPath := OrderedCollection new.
	childrenBlock := [ :value | #() ].
	labelBlock := [ :value | value printString ]
]

{ #category : #accessing }
SUTieredList >> labels: aOneArgumentBlock [
	"Define a one argument block that answers a string for a given node."

	labelBlock := aOneArgumentBlock
]

{ #category : #rendering }
SUTieredList >> renderContentOn: html [
	html div
		class: self cssClass;
		id: (uid := html nextId);
		with: [ self renderListOn: html ]
]

{ #category : #rendering }
SUTieredList >> renderList: aCollection level: anInteger on: html [
	| id selected |
	aCollection isEmpty ifTrue: [ ^ self ].
	html select
		beOptional;
		list: aCollection;
		labels: labelBlock;
		id: (id := html nextId);
		optionalLabel: '(select)';
		selected: (selected := selectionPath
			at: anInteger
			ifAbsent: [ nil ]);
		callback: [ :value |
			[ selectionPath size < anInteger ]
		 		whileFalse: [ selectionPath removeLast ].
			selectionPath addLast: value ];
		onChange: (html scriptaculous updater
			id: uid;
			triggerFormElement: id;
			callback: [ :r | self renderListOn: r ]).
	selected isNil
		ifFalse: [ self renderList: (childrenBlock value: selected) level: anInteger + 1 on: html ]
]

{ #category : #rendering }
SUTieredList >> renderListOn: html [
	selectionPath isEmpty
		ifFalse: [ self renderList: (childrenBlock value: selectionPath first) level: 2 on: html ]
]

{ #category : #accessing }
SUTieredList >> selection [
	"Answer the selection path including the root node."

	^ selectionPath
]

{ #category : #accessing }
SUTieredList >> selection: anOrderedCollection [
	"Set the selection path including the root node."

	selectionPath := anOrderedCollection
]
