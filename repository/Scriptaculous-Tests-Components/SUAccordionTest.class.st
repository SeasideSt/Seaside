Class {
	#name : #SUAccordionTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'accordion'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUAccordionTest >> children [
	^ Array with: accordion
]

{ #category : #accessing }
SUAccordionTest >> coreClass [
	^ SUAccordion
]

{ #category : #initialization }
SUAccordionTest >> initialize [
	super initialize.
	accordion := SUAccordion new
		add: (SUCounterTest on: 1) label: 'Counter 1';
		add: (SUCounterTest on: 2) label: 'Counter 2';
		add: (SUCounterTest on: 3) label: 'Counter 3';
		yourself
]
