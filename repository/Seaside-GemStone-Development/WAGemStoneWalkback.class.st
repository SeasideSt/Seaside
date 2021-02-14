Class {
	#name : #WAGemStoneWalkback,
	#superclass : #WAWalkback,
	#instVars : [
		'frames'
	],
	#category : 'Seaside-GemStone-Development-Core'
}

{ #category : #initialization }
WAGemStoneWalkback class >> initialize [
	self select
]

{ #category : #private }
WAGemStoneWalkback >> currentContextForContinuation: aContinuation [ 
	| initial context |
	initial := context := GsContext fromContinuation: aContinuation atLevel: 1.
   "Attempt to trim stack to provide a more useful short stack report"
	[context ~~ nil _and: [context method selector ~~ #signal:args:signalDictionary:]]
		whileTrue: [context := context sender].
	context == nil
		ifTrue: [
			context := initial.
			[context ~~ nil _and: [context method selector ~~ #_gsReturnTos]]
				whileTrue: [context := context sender].
		].
        "Stack trimming was unsuccessful, return the whole stack"
	context == nil ifTrue: [ ^initial sender ].
	^context sender
]

{ #category : #private }
WAGemStoneWalkback >> currentContextForWalkback [
	^ self currentContextForContinuation: (GsProcess continuationFromLevel: 1)
]

{ #category : #accessing }
WAGemStoneWalkback >> frameCount [
	^ frames size
]

{ #category : #accessing }
WAGemStoneWalkback >> frames [
	^ frames first: (self limit min: frames size)
]

{ #category : #initialization }
WAGemStoneWalkback >> initializeWithContext: aGsContext [
	| context |
	context := aGsContext.
	frames := OrderedCollection new.
	[ context isNil ] whileFalse: [
		frames add: context.
		context := context sender ].
	limit := 5 min: frames size
]

{ #category : #initialization }
WAGemStoneWalkback >> initializeWithException: anException [
	super initializeWithException: anException.
	self initializeWithContext: self currentContextForWalkback.
]

{ #category : #'rendering-stack' }
WAGemStoneWalkback >> renderObject: anObject labelled: aString on: html [
	html definitionTerm: [
		html anchor
			callback: [ (WAInspectorHaloPlugin on: anObject for: self) execute ];
			with: aString ].
	html definitionData: (self safePrintString: anObject)
]

{ #category : #'rendering-stack' }
WAGemStoneWalkback >> renderStackFrame: aContext on: html [
	html definitionList: [
		self 
			renderObject: aContext
			labelled: 'thisContext'
			on: html.
		self 
			renderObject: aContext receiver
			labelled: 'self'
			on: html.
		self 
			tempNamesAndValuesIn: aContext 
			do: [ :name :value |
				self 
					renderObject: value
					labelled: name
					on: html ] ]
]

{ #category : #rendering }
WAGemStoneWalkback >> renderStackOn: html [
	html heading level: 3; with: 'Stack Trace'.
	html orderedList: [
		self frames do: [ :each |
			html listItem: [
				self renderStackFrame: each on: html ] ] ]
]

{ #category : #private }
WAGemStoneWalkback >> safePrintString: anObject [
	^ [ anObject printStringLimitedTo: 100 ]
		on: Error
		do: [ :err | 'unprintable ' , anObject class name ]
]

{ #category : #private }
WAGemStoneWalkback >> tempNamesAndValuesIn: aContext do: aTwoArgumentBlock [
	"Evaluate aTwoArgumentBlock for every temp in aContext with the name of the temp and the current value. The code is supposed to work on Squeak and Pharo closure and non-closure images."

	| tempNames |
	tempNames := aContext tempNames.
	tempNames do: [ :each |
		aTwoArgumentBlock
			value: each
			value: (aContext tempAt: (tempNames indexOf: each)) ]
]

{ #category : #updating }
WAGemStoneWalkback >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	WADevelopmentFiles default updateRoot: anHtmlRoot
]
