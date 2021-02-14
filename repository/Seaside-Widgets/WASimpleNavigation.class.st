"
I'm a simple tab panel, that can be styled with stylesheets. New tabs can be added using #add:label:

You may want to add the WANavigationFiles library to your application for some default CSS styling.
"
Class {
	#name : #WASimpleNavigation,
	#superclass : #WANavigation,
	#instVars : [
		'components'
	],
	#category : 'Seaside-Widgets-Components'
}

{ #category : #behavior }
WASimpleNavigation >> add: aComponent label: aString [
	components add: aString -> aComponent
]

{ #category : #hooks }
WASimpleNavigation >> children [
	^ Array with: self selectedComponent
]

{ #category : #accessing }
WASimpleNavigation >> components [
	^ components
]

{ #category : #initialization }
WASimpleNavigation >> initialize [
	super initialize.
	components := OrderedCollection new
]

{ #category : #accessing }
WASimpleNavigation >> labels [
	"Return the tabs labels"

	^ self options
]

{ #category : #accessing }
WASimpleNavigation >> options [
	^ components collect: [ :each | each key ]
]

{ #category : #rendering }
WASimpleNavigation >> renderSelectionOn: html [
	html render: self selectedComponent
]

{ #category : #behavior }
WASimpleNavigation >> selectFirst [
	"Selects the first added component as active."
	
	components notEmpty
		ifTrue: [ self select: components first key ]
]

{ #category : #accessing }
WASimpleNavigation >> selectedComponent [
	^ (components detect: [ :each | each key = self selection ] ifNone: [ ^ nil ]) value
]
