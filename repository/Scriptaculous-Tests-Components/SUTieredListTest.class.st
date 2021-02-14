Class {
	#name : #SUTieredListTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'tieredList'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUTieredListTest >> children [
	^ Array with: tieredList
]

{ #category : #accessing }
SUTieredListTest >> coreClass [
	^ SUTieredList
]

{ #category : #initialization }
SUTieredListTest >> initialize [
	super initialize.
	tieredList := SUTieredList new
		labels: [ :value | value fullName ];
		children: [ :value | 
			value subclasses
				asSortedCollection: [ :a :b | a name < b name ] ];
		selection: (OrderedCollection with: Collection);
		yourself
]
