Class {
	#name : #SUVerticalSplitterTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'splitter'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUVerticalSplitterTest >> children [
	^ Array with: splitter
]

{ #category : #accessing }
SUVerticalSplitterTest >> coreClass [
	^ SUVerticalSplitter
]

{ #category : #initialization }
SUVerticalSplitterTest >> initialize [
	super initialize.
	splitter := SUVerticalSplitter new
		add: (SUCounterTest on: 1) size: '150px' min: 60;
		add: (SUCounterTest on: 2) size: '150px' min: 80;
		add: (SUCounterTest on: 3) size: '150px' min: 80;
		yourself
]
