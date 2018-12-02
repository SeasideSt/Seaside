Class {
	#name : #WADecorationStub,
	#superclass : #WADecoration,
	#instVars : [
		'initialRequestBlock',
		'updateRootBlock',
		'updateUrlBlock',
		'updateStatesBlock',
		'renderBlock',
		'childrenBlock'
	],
	#category : 'Seaside-Tests-Component-Stubs'
}

{ #category : #hooks }
WADecorationStub >> children [
	^ childrenBlock isNil
		ifTrue: [ super children ]
		ifFalse: [ super children , childrenBlock value ]
]

{ #category : #hooks }
WADecorationStub >> initialRequest: aRequest [
	super initialRequest: aRequest.
	initialRequestBlock isNil
		ifFalse: [ initialRequestBlock value: aRequest ]
]

{ #category : #events }
WADecorationStub >> onChildren: aBlock [
	childrenBlock := aBlock
]

{ #category : #events }
WADecorationStub >> onInitialRequest: aBlock [
	initialRequestBlock := aBlock
]

{ #category : #events }
WADecorationStub >> onRender: aBlock [
	renderBlock := aBlock
]

{ #category : #events }
WADecorationStub >> onUpdateRoot: aBlock [
	updateRootBlock := aBlock
]

{ #category : #events }
WADecorationStub >> onUpdateStates: aBlock [
	updateStatesBlock := aBlock
]

{ #category : #events }
WADecorationStub >> onUpdateUrl: aBlock [
	updateUrlBlock := aBlock
]

{ #category : #rendering }
WADecorationStub >> renderContentOn: html [
	renderBlock isNil 
		ifTrue: [ super renderContentOn: html ]
		ifFalse: [ renderBlock value: html value: [ super renderContentOn: html ] ]
]

{ #category : #updating }
WADecorationStub >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	updateRootBlock isNil
		ifFalse: [ updateRootBlock value: anHtmlRoot ]
]

{ #category : #updating }
WADecorationStub >> updateStates: aSnapshot [
	super updateStates: aSnapshot.
	updateStatesBlock isNil
		ifFalse: [ updateStatesBlock value: aSnapshot ]
]

{ #category : #updating }
WADecorationStub >> updateUrl: aUrl [
	super updateUrl: aUrl.
	updateUrlBlock isNil
		ifFalse: [ updateUrlBlock value: aUrl ]
]
