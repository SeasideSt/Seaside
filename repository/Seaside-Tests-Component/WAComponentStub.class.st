Class {
	#name : #WAComponentStub,
	#superclass : #WAComponent,
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
WAComponentStub >> children [
	^ childrenBlock isNil
		ifTrue: [ super children ]
		ifFalse: [ childrenBlock value ]
]

{ #category : #hooks }
WAComponentStub >> initialRequest: aRequest [
	super initialRequest: aRequest.
	initialRequestBlock isNil
		ifFalse: [ initialRequestBlock value: aRequest ]
]

{ #category : #events }
WAComponentStub >> onChildren: aBlock [
	childrenBlock := aBlock
]

{ #category : #events }
WAComponentStub >> onInitialRequest: aBlock [
	initialRequestBlock := aBlock
]

{ #category : #events }
WAComponentStub >> onRender: aBlock [
	renderBlock := aBlock
]

{ #category : #events }
WAComponentStub >> onUpdateRoot: aBlock [
	updateRootBlock := aBlock
]

{ #category : #events }
WAComponentStub >> onUpdateStates: aBlock [
	updateStatesBlock := aBlock
]

{ #category : #events }
WAComponentStub >> onUpdateUrl: aBlock [
	updateUrlBlock := aBlock
]

{ #category : #rendering }
WAComponentStub >> renderContentOn: html [
	renderBlock isNil 
		ifTrue: [ super renderContentOn: html ]
		ifFalse: [ renderBlock value: html ]
]

{ #category : #updating }
WAComponentStub >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	updateRootBlock isNil
		ifFalse: [ updateRootBlock value: anHtmlRoot ]
]

{ #category : #updating }
WAComponentStub >> updateStates: aSnapshot [
	super updateStates: aSnapshot.
	updateStatesBlock isNil
		ifFalse: [ updateStatesBlock value: aSnapshot ]
]

{ #category : #updating }
WAComponentStub >> updateUrl: aUrl [
	super updateUrl: aUrl.
	updateUrlBlock isNil
		ifFalse: [ updateUrlBlock value: aUrl ]
]
