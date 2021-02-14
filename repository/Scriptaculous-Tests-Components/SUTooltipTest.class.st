Class {
	#name : #SUTooltipTest,
	#superclass : #WAComponent,
	#instVars : [
		'text'
	],
	#category : 'Scriptaculous-Tests-Components'
}

{ #category : #accessing }
SUTooltipTest class >> tooltips [
	| dictionary |
	dictionary := Dictionary new.
	dictionary at: #hello put: 'Hello world!'.
	dictionary at: #ok put: 'This is not the ok button!'.
	^ dictionary
]

{ #category : #initialization }
SUTooltipTest >> initialize [
	super initialize.
	text := ''
]

{ #category : #rendering }
SUTooltipTest >> renderContentOn: html [
	html text: text
]

{ #category : #accessing }
SUTooltipTest >> text: aText [
	text := aText
]

{ #category : #accessing }
SUTooltipTest >> textWithKey: aKey [
	self text: (self class tooltips at: aKey asSymbol ifAbsent: [ 'Tooltip for key "', aKey , '" not found!' ])
]
