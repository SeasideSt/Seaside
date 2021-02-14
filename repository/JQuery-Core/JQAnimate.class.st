Class {
	#name : #JQAnimate,
	#superclass : #JQPlugin,
	#instVars : [
		'parameters'
	],
	#category : 'JQuery-Core-Objects'
}

{ #category : #accessing }
JQAnimate >> arguments [
	^ Array with: self parameters with: self options
]

{ #category : #private }
JQAnimate >> doesNotUnderstand: aMessage [
	"A nasty trick to allow to define the animation properties more easily."

	^ aMessage selector numArgs = 1
		ifFalse: [ super doesNotUnderstand: aMessage ]
		ifTrue: [ self parameterAt: aMessage selector allButLast put: aMessage arguments first ]
]

{ #category : #options }
JQAnimate >> duration: aDuration [
	"A string representing one of the three predefined speeds (slow, normal, or fast) or the number of milliseconds to run the animation (e.g. 1000)."
	
	self optionAt: 'duration' put: aDuration

]

{ #category : #options }
JQAnimate >> easing: aString [
	"The name of the easing effect that you want to use (plugin required). There are two built-in values, linear and swing."
	
	self optionAt: 'easing' put: aString

]

{ #category : #accessing }
JQAnimate >> method [
	^ 'animate'
]

{ #category : #events }
JQAnimate >> onComplete: anObject [
	"A function to be executed whenever the animation completes, executes once for each element animated against."
	
	self optionAt: 'complete' put: anObject asFunction
]

{ #category : #events }
JQAnimate >> onStep: anObject [
	"A function to be executed on each animation step, executes for each element animated against."

	self optionAt: 'step' put: anObject asFunction
]

{ #category : #parameters }
JQAnimate >> parameterAt: aKey put: aValue [
	self parameters at: aKey put: aValue
]

{ #category : #parameters }
JQAnimate >> parameters [
	^ parameters ifNil: [ parameters := GRSmallDictionary2 new ]
]

{ #category : #parameters }
JQAnimate >> parameters: aDictionary [
	"A set of style attributes that you wish to animate, and to what end."
	
	parameters := aDictionary
]

{ #category : #options }
JQAnimate >> queue: aBoolean [
	"Setting this to false will make the animation skip the queue and begin running immediately."
	
	self optionAt: 'queue' put: aBoolean

]
