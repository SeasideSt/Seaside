"
Abstract root class for all halo tools. They add functionality to the halo toolbar.
"
Class {
	#name : #WAHaloPlugin,
	#superclass : #WAPlugin,
	#instVars : [
		'root'
	],
	#category : 'Seaside-Development-Plugins'
}

{ #category : #'instance creation' }
WAHaloPlugin class >> allSubclassesOn: aTargetObject for: aRequestorObject [
	| plugins |
	plugins := self allSubclasses
		collect: [ :each | each on: aTargetObject for: aRequestorObject ].
	^ plugins sorted
]

{ #category : #'instance creation' }
WAHaloPlugin class >> on: aTargetObject for: aRequestorObject [
	^ self basicNew initializeRoot: aTargetObject requestor: aRequestorObject
]

{ #category : #initialization }
WAHaloPlugin >> initializeRoot: aRootObject requestor: aRequestorObject [
	self initializeRequestor: aRequestorObject.
	root := aRootObject

]

{ #category : #actions }
WAHaloPlugin >> open: aComponent onAnswer: aBlock [
	| component decoration |
	component := self session presenter.
	decoration := component decorations
		detect: [ :each | each isKindOf: WAToolDecoration ]
		ifNone: [ nil ].
	decoration isNil
		ifTrue: [ ^ super open: aComponent onAnswer: aBlock ].
	component removeDecoration: decoration.
	super open: aComponent onAnswer: [ :value |
		component addDecoration: decoration.
		aBlock value: value ]
]

{ #category : #rendering }
WAHaloPlugin >> renderContentOn: html [
	html div
		class: self cssClass;
		with: [ super renderContentOn: html ]
]

{ #category : #accessing }
WAHaloPlugin >> root [
	^ root
]
