Class {
	#name : #WANavigation,
	#superclass : #WACanvasWidget,
	#instVars : [
		'selection'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #initialization }
WANavigation >> initialize [
	super initialize.
	selection := WAValueHolder new
]

{ #category : #query }
WANavigation >> labelForOption: anObject [ 
	^ anObject greaseString
]

{ #category : #accessing }
WANavigation >> options [
	^ #()
]

{ #category : #rendering }
WANavigation >> renderContentOn: html [
	html div class: 'kalsey'; with: [
		html div
			class: 'navigation-options';
			with: [ self renderOptionsOn: html ].
		html div
			class: 'navigation-content';
			with: [ self renderSelectionOn: html ] ]
]

{ #category : #rendering }
WANavigation >> renderOptionsOn: html [
	html unorderedList
		list: self options;
		selected: self selection;
		callback: [ :value | self select: value ];
		labels: [ :each | self labelForOption: each ]
]

{ #category : #rendering }
WANavigation >> renderSelectionOn: html [
]

{ #category : #selection }
WANavigation >> select: anObject [
	selection contents: anObject.
	self selectionChanged
]

{ #category : #selection }
WANavigation >> selection [
	^ selection contents
]

{ #category : #selection }
WANavigation >> selectionChanged [
]

{ #category : #hooks }
WANavigation >> states [
	^ Array with: selection
]
