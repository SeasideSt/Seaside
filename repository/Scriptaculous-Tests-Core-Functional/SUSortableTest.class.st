Class {
	#name : #SUSortableTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'collection'
	],
	#category : 'Scriptaculous-Tests-Core-Functional'
}

{ #category : #initialization }
SUSortableTest >> initialize [
	super initialize.
	collection := #( 'San Salvatore' 'Monte Bre' 'Calvagione' )
]

{ #category : #rendering }
SUSortableTest >> renderContentOn: html [
	| id |
	html unorderedList
		id: (id := html nextId);
		script: (html scriptaculous sortable
			onUpdate: (html scriptaculous request
				triggerSortable: id
				callback: [ :value | collection := value ]));
		with: [ self renderListItemsOn: html ]
]

{ #category : #rendering }
SUSortableTest >> renderListItemsOn: html [
	collection do: [ :each |
		html listItem
			passenger: each;
			with: each ]
]
