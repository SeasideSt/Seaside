"
Oversees the calling of a particular function periodically.

PeriodicalExecuter shields you from multiple parallel executions of a callback function, should it take longer than the given interval to execute.

This is especially useful if you use one to interact with the user at given intervals (e.g. use a prompt or confirm call): this will avoid multiple message boxes all waiting to be actioned.
"
Class {
	#name : #PTPeriodicalExecuter,
	#superclass : #JSDecoration,
	#instVars : [
		'callback',
		'frequency'
	],
	#category : 'Prototype-Core-Ajax'
}

{ #category : #accessing }
PTPeriodicalExecuter >> callback [
	"the function to be executed at each interval"
 	^ callback ifNil: [ callback := self defaultCallback ]
]

{ #category : #accessing }
PTPeriodicalExecuter >> callback: anObject [
 	callback := anObject
]

{ #category : #private }
PTPeriodicalExecuter >> defaultArguments [
 	^ Array with: self callback with: self frequency
]

{ #category : #private }
PTPeriodicalExecuter >> defaultCallback [
 	| stream |
 	stream := JSStream new.
 	self owner javascriptContentOn: stream.
 	^ stream asFunction
]

{ #category : #private }
PTPeriodicalExecuter >> defaultFrequency [
 	^ 1 "second"
]

{ #category : #accessing }
PTPeriodicalExecuter >> frequency [
	"the amount of time, in seconds, to wait in between callbacks"
 	^ frequency ifNil: [ frequency := self defaultFrequency ]
]

{ #category : #accessing }
PTPeriodicalExecuter >> frequency: anInteger [
 	frequency := anInteger
]

{ #category : #printing }
PTPeriodicalExecuter >> javascriptContentOn: aStream [
 	aStream nextPutAll: 'new PeriodicalExecuter'.
 	JSStream
 		encodeArguments: self defaultArguments
 		on: aStream
]
