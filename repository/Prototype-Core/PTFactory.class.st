"
I am a factory to create Scriptaculous objects.
"
Class {
	#name : #PTFactory,
	#superclass : #WAObject,
	#instVars : [
		'context',
		'block',
		'rendererClass'
	],
	#category : 'Prototype-Core'
}

{ #category : #'instance creation' }
PTFactory class >> context: aRenderContext [
	^ self context: aRenderContext using: nil
]

{ #category : #'instance creation' }
PTFactory class >> context: aRenderContext using: aBlock [
	^ self basicNew initializeWithContext: aRenderContext using: aBlock; yourself
]

{ #category : #private }
PTFactory >> create: aClass [
	^ self register:
		((aClass context: context)
			rendererClass: self rendererClass;
			yourself)
]

{ #category : #creational }
PTFactory >> document [
	^ (self create: PTObject) alias: 'document'
]

{ #category : #'creational-elements' }
PTFactory >> element [
	^ self create: PTElement
]

{ #category : #'creational-ajax' }
PTFactory >> evaluator [
	^ self create: PTEvaluator
]

{ #category : #creational }
PTFactory >> event [
	^ self create: PTEvent
]

{ #category : #'creational-elements' }
PTFactory >> form [
	^ self create: PTForm
]

{ #category : #'creational-elements' }
PTFactory >> formElement [
	^ self create: PTFormElement
]

{ #category : #'creational-observers' }
PTFactory >> formElementObserver [
	^ self create: PTFormElementObserver
]

{ #category : #'creational-observers' }
PTFactory >> formObserver [
	^ self create: PTFormObserver
]

{ #category : #creational }
PTFactory >> function [
	^ self create: JSFunction
]

{ #category : #initialization }
PTFactory >> initializeWithContext: aRenderContext using: aBlock [
	self initialize.
	context := aRenderContext.
	block := aBlock
]

{ #category : #'creational-ajax' }
PTFactory >> insertion [
	^ self create: PTInsertion
]

{ #category : #creational }
PTFactory >> logger [
	^ self create: JSLogger
]

{ #category : #'creational-ajax' }
PTFactory >> periodical [
	^ self create: PTPeriodical
]

{ #category : #'creational-ajax' }
PTFactory >> periodicalEvaluator [
	^ self create: PTPeriodicalEvaluator 
]

{ #category : #private }
PTFactory >> register: anObject [
	^ block isNil
		ifTrue: [ anObject ]
		ifFalse: [ block value: anObject ]
]

{ #category : #accessing }
PTFactory >> rendererClass [
	^ rendererClass ifNil: [ rendererClass := WARenderer default ]
]

{ #category : #accessing }
PTFactory >> rendererClass: anObject [
	rendererClass := anObject
]

{ #category : #'creational-ajax' }
PTFactory >> request [
	^ self create: PTRequest
]

{ #category : #'creational-ajax' }
PTFactory >> responders [
	^ self create: PTResponders
]

{ #category : #creational }
PTFactory >> script [
	^ self create: JSScript
]

{ #category : #'creational-elements' }
PTFactory >> selector [
	^ self create: PTSelector
]

{ #category : #creational }
PTFactory >> stream [
	^ self register: JSStream new
]

{ #category : #'creational-ajax' }
PTFactory >> updater [
	^ self create: PTUpdater
]

{ #category : #creational }
PTFactory >> window [
	^ (self create: PTObject) alias: 'window'
]
