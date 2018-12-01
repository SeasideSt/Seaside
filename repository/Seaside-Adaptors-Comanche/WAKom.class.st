"
Compatibility class to maintain WAKom interface from Seaside 2.8 and older.
"
Class {
	#name : #WAKom,
	#superclass : #WAObject,
	#classInstVars : [
		'default'
	],
	#category : 'Seaside-Adaptors-Comanche'
}

{ #category : #private }
WAKom class >> adaptorClass [
	^ WAComancheAdaptor
]

{ #category : #compatibility }
WAKom class >> default [
	^ (default notNil and: [ default manager notNil ])
		ifTrue: [ default ]
		ifFalse: [ nil ]
]

{ #category : #private }
WAKom class >> defaultCodec [
	^ GRNullCodec new
]

{ #category : #compatibility }
WAKom class >> port [
	^ self default isNil ifFalse: [ self default port ]
]

{ #category : #compatibility }
WAKom class >> start [
	^ self default isNil
		ifFalse: [ self default start; yourself ]
		ifTrue: [ self error: 'No adaptor currently configured. Use #startOn:.'. nil ]
]

{ #category : #compatibility }
WAKom class >> startOn: portInteger [
	self default isNil
		ifFalse: [ self default stop; port: portInteger ]
		ifTrue: [
			default := self adaptorClass port: portInteger.
			default codec: self defaultCodec ].
	^ self start
]

{ #category : #compatibility }
WAKom class >> stop [
	self default isNil ifFalse: [ self default stop ]
]
