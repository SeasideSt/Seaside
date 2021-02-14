"
A WAMultiCounter is a component that consists of several instances of WACounter. Be sure to understand WACounter.

The lesson to learn here is how Seaside components can be composed of other components.

Instance Variables
	counters:		<Collection<WACounter>>

counters
	- a Collection of components (instances of WACounter) 

"
Class {
	#name : #WAMultiCounter,
	#superclass : #WAExampleComponent,
	#instVars : [
		'counters'
	],
	#category : 'Seaside-Examples-Misc'
}

{ #category : #accessing }
WAMultiCounter class >> description [
	^ 'Multiple Seaside components on one page'
]

{ #category : #initialization }
WAMultiCounter class >> initialize [
	WAAdmin register: self asApplicationAt: 'examples/multicounter'
]

{ #category : #hooks }
WAMultiCounter >> children [
	^ counters
]

{ #category : #initialization }
WAMultiCounter >> initialize [
	super initialize.
	counters := (1 to: 5) collect: [ :each | WACounter new ]
]

{ #category : #rendering }
WAMultiCounter >> renderContentOn: html [
	counters
		do: [ :each | html render: each ]
		separatedBy: [ html horizontalRule ]
]
