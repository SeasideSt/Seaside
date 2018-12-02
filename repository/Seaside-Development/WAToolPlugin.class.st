"
Abstract root class for all development tool bar tools.
"
Class {
	#name : #WAToolPlugin,
	#superclass : #WAPlugin,
	#category : 'Seaside-Development-Plugins'
}

{ #category : #'instance creation' }
WAToolPlugin class >> allSubclassesFor: aRequestorObject [
	| plugins |
	plugins := self allSubclasses
		collect: [ :each | each for: aRequestorObject ].
	^ plugins sorted
]

{ #category : #'instance creation' }
WAToolPlugin class >> for: aRequestorObject [
	^ self basicNew initializeRequestor: aRequestorObject
]

{ #category : #actions }
WAToolPlugin >> open: aComponent onAnswer: aBlock [
	| component |
	component := self requestor decoratedComponent.
	component removeDecoration: self requestor.
	super open: aComponent onAnswer: [ :value |
		component addDecoration: self requestor.
		aBlock value: value ]
]
