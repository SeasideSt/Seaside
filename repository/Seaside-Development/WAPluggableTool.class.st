"
A WAPluggableTool is a wrapper component around tools that can't be made subclasses of WATool. WATool is only really needed to provide the icon image.

Instance Variables
	component:		<WAComponent>

component
	- the component to render

"
Class {
	#name : #WAPluggableTool,
	#superclass : #WATool,
	#instVars : [
		'component'
	],
	#category : 'Seaside-Development-Core'
}

{ #category : #'instance creation' }
WAPluggableTool class >> on: aComponent [
	^ self basicNew
		initializeWith: aComponent;
		yourself
]

{ #category : #hooks }
WAPluggableTool >> children [
	^ Array with: component
]

{ #category : #initialization }
WAPluggableTool >> initializeWith: aComponent [
	self initialize.
	component := aComponent.
	component onAnswer: [ self answer ]
]
