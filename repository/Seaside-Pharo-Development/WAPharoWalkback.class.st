"
A Squeak-specific implementation of WAWalkback.
"
Class {
	#name : #WAPharoWalkback,
	#superclass : #WAWalkback,
	#instVars : [
		'frames'
	],
	#category : 'Seaside-Pharo-Development-Core'
}

{ #category : #'class initialization' }
WAPharoWalkback class >> initialize [
	self select
]

{ #category : #'class initialization' }
WAPharoWalkback class >> unload [
	self unselect
]

{ #category : #accessing }
WAPharoWalkback >> frameCount [
	^ frames size
]

{ #category : #accessing }
WAPharoWalkback >> frames [
	^ frames first: (self limit min: frames size)
]

{ #category : #initialization }
WAPharoWalkback >> initializeWithException: anException [
	| context |
	super initializeWithException: anException.
	context := anException signalerContext.
	frames := OrderedCollection new.
	[ context isNil ] whileFalse: [
		frames add: context.
		context := context sender ]
]

{ #category : #'rendering-stack' }
WAPharoWalkback >> renderObject: anObject labelled: aString on: html [
	html definitionTerm: [
		html anchor
			callback: [ (WAInspectorHaloPlugin on: anObject for: self) execute ];
			with: aString ].
	html definitionData: (self safePrintString: anObject)
]

{ #category : #'rendering-stack' }
WAPharoWalkback >> renderStackFrame: aContext on: html [
	html definitionList: [
		self 
			renderObject: aContext
			labelled: 'thisContext'
			on: html.
		self 
			renderObject: aContext receiver
			labelled: 'self'
			on: html ]
]

{ #category : #rendering }
WAPharoWalkback >> renderStackOn: html [
	html heading level: 3; with: 'Stack Trace'.
	html orderedList: [
		self frames do: [ :each |
			html listItem: [
				self renderStackFrame: each on: html ] ] ]
]

{ #category : #private }
WAPharoWalkback >> safePrintString: anObject [
	^ [ anObject printStringLimitedTo: 100 ]
		on: Error
		do: [ :err | 'unprintable ' , anObject class name ]
]

{ #category : #private }
WAPharoWalkback >> tempNamesAndValuesIn: aContext do: aTwoArgumentBlock [
	aContext tempScopedNames keysAndValuesDo: [ :index :each |
		aTwoArgumentBlock
			value: each
			value: (aContext tempAt: index) ]
]
