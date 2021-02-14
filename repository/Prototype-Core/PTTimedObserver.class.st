"
This is an abstract class which corresponds to the class Abstract.TimedObserver in the prototype.js library.

All of the prototype.js observers watch an element (specified by #id) at a particular #frequency and evaluate a javascript #function if the element has changed. The function takes two arguments, element (the element that changed) and value (the new value).

So the simplest use of an observer looks something like this:

html textInput id: 'watchMe'.
html script: (html formElementObserver
	id: 'watchMe';
	frequency: 2 seconds;
	function: 'alert(value)')

or you can put something more interesting in the function, e.g.:

	function: (html updater ... )

"
Class {
	#name : #PTTimedObserver,
	#superclass : #PTNamed,
	#instVars : [
		'frequency',
		'function'
	],
	#category : 'Prototype-Core-Observers'
}

{ #category : #defaults }
PTTimedObserver >> defaultArguments [
	^ super defaultArguments , (Array with: self frequency with: self function)
]

{ #category : #defaults }
PTTimedObserver >> defaultFrequency [
	^ 1
]

{ #category : #defaults }
PTTimedObserver >> defaultFunction [
	^ JSFunction new
]

{ #category : #accessing }
PTTimedObserver >> frequency [
	^ frequency ifNil: [ self defaultFrequency ]
]

{ #category : #accessing }
PTTimedObserver >> frequency: anInteger [
	frequency := anInteger
]

{ #category : #accessing }
PTTimedObserver >> function [
	^ function ifNil: [ self defaultFunction ]
]

{ #category : #accessing }
PTTimedObserver >> function: anObject [ 
	function := anObject asFunction: #('element' 'value')
]

{ #category : #initialization }
PTTimedObserver >> initialize [
	super initialize.
	self create
]
