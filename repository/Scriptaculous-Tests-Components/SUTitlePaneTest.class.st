Class {
	#name : #SUTitlePaneTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'component'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUTitlePaneTest >> children [
	^ Array with: component
]

{ #category : #accessing }
SUTitlePaneTest >> coreClass [
	^ SUTitlePane
]

{ #category : #initialization }
SUTitlePaneTest >> initialize [
	super initialize.
	component := self coreClass new title: 'Title';
		body: (SUFormTest new)
"		body: (SUCounterTest on: 1); yourself"
		
"		body: (SUCarouselTest new); yourself"

	


	
]
