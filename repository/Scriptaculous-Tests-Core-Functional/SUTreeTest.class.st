Class {
	#name : #SUTreeTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'tree'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #private }
SUTreeTest >> childrenOf: anObject [
	^ Array streamContents: [ :stream |
		tree do: [ :each |
			each key = anObject
				ifTrue: [ stream nextPut: each value ] ] ]
]

{ #category : #initialization }
SUTreeTest >> initialize [
	super initialize.
	tree := OrderedCollection new
		add: nil -> 'Eukaryota';
			add: 'Eukaryota' -> 'Opisthokonts';
				add: 'Opisthokonts' -> 'Animalia';
				add: 'Opisthokonts' -> 'Choanoflagellates';
				add: 'Opisthokonts' -> 'Nucleariids';
				add: 'Opisthokonts' -> 'Fungi';
			add: 'Eukaryota' -> 'Amoebozoa';
				add: 'Amoebozoa' -> 'Plantae';
				add: 'Amoebozoa' -> 'Red algae';
				add: 'Amoebozoa' -> 'Glaucophytes';
			add: 'Eukaryota' -> 'Plants';
				add: 'Plants' -> 'Cercozoa';
				add: 'Plants' -> 'Foraminifera';
				add: 'Plants' -> 'Polycystinea';
				add: 'Plants' -> 'Acantharea';
				add: 'Plants' -> 'Sticholonche';
			add: 'Eukaryota' -> 'Rhizaria';
		yourself
]

{ #category : #rendering }
SUTreeTest >> renderChildren: aCollection on: html [
	aCollection do: [ :each |
		html listItem
			passenger: each;
			with: [ self renderNode: each on: html ] ]
]

{ #category : #rendering }
SUTreeTest >> renderContentOn: html [
	html unorderedList
		id: 'evolution';
		class: 'evolutionTree';
		script: (html scriptaculous sortable
			create;
			tree: true;
			onUpdate: (html scriptaculous request
				triggerTree: 'evolution'
				callback: [ :values | tree := values ]));
		with: [ self renderChildren: (self childrenOf: nil) on: html ]
]

{ #category : #rendering }
SUTreeTest >> renderNode: anObject on: html [
	| children |
	html text: anObject.
	(children := self childrenOf: anObject) isEmpty ifFalse: [
		html unorderedList: [
			self renderChildren: children on: html ] ]
]

{ #category : #hooks }
SUTreeTest >> style [
	^ 'ul.evolutionTree li {
	list-style: none;
	cursor: move}'
]
