Class {
	#name : #SUHorizontalSplitterTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'splitter'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUHorizontalSplitterTest >> children [
	^ Array with: splitter
]

{ #category : #accessing }
SUHorizontalSplitterTest >> coreClass [
	^ SUHorizontalSplitter
]

{ #category : #initialization }
SUHorizontalSplitterTest >> initialize [
	super initialize.
	splitter := SUHorizontalSplitter new
		add: (SUCounterTest on: 1) size: '50px' min: 30;
		add: (SUCounterTest on: 2) size: '50px' min: 30;
		add: (SUCounterTest on: 3) size: '50px' min: 30;
		yourself
]
