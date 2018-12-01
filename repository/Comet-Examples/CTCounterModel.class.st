Class {
	#name : #CTCounterModel,
	#superclass : #GRObject,
	#instVars : [
		'count'
	],
	#category : 'Comet-Examples'
}

{ #category : #accessing }
CTCounterModel >> count [
	^ count
]

{ #category : #accessing }
CTCounterModel >> count: anInteger [
	count := anInteger
]

{ #category : #actions }
CTCounterModel >> decrease [
	count := count - 1
]

{ #category : #actions }
CTCounterModel >> increase [
	count := count + 1
]

{ #category : #initialization }
CTCounterModel >> initialize [
	super initialize.
	count := 0
]
