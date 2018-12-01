Class {
	#name : #SUTabPanelTest,
	#superclass : #SUFunctionalTest,
	#instVars : [
		'tabPanel'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #hooks }
SUTabPanelTest >> children [
	^ Array with: tabPanel
]

{ #category : #accessing }
SUTabPanelTest >> coreClass [
	^ SUTabPanel
]

{ #category : #initialization }
SUTabPanelTest >> initialize [
	super initialize.
	tabPanel := SUTabPanel new
		add: (SUCounterTest on: 1) label: 'Counter 1';
		add: (SUCounterTest on: 2) label: 'Counter 2';
		add: (SUCounterTest on: 3) label: 'Counter 3';
		yourself
]

{ #category : #updating }
SUTabPanelTest >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot stylesheet url: SUComponentLibrary / #tabPanelCss
]
