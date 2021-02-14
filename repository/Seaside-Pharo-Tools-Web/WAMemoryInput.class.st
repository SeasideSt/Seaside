"
A WAMemoryInput is a dialog that allows the user to enter an amount of memory.

This is a Seaside internal class. Do not rely on it being present. If you need it, copy and paste it.
"
Class {
	#name : #WAMemoryInput,
	#superclass : #WAComponent,
	#instVars : [
		'value',
		'multiplier'
	],
	#category : 'Seaside-Pharo-Tools-Web'
}

{ #category : #'instance creation' }
WAMemoryInput class >> bytes: anInteger [
	^ self basicNew
		initialize;
		bytes: anInteger;
		yourself
]

{ #category : #'instance creation' }
WAMemoryInput class >> new [
	^ self bytes: 0
]

{ #category : #accessing }
WAMemoryInput >> bytes [
	^ value * multiplier
]

{ #category : #accessing }
WAMemoryInput >> bytes: anInteger [
	anInteger isZero
		ifTrue: [
			multiplier := 0.
			self value: 0 ]
		ifFalse: [
			multiplier := self unitDictionary keys sorted inject: 1 into: [ :last :each |
					(anInteger \\ each) isZero
						ifTrue: [ each ]
						ifFalse: [ last ] ].
			self value: (anInteger // multiplier) ]
]

{ #category : #initialization }
WAMemoryInput >> initialize [
	super initialize.
	self value: 0.
	self multiplier: 1
]

{ #category : #accessing }
WAMemoryInput >> multiplier [
	^ multiplier
]

{ #category : #accessing }
WAMemoryInput >> multiplier: anInteger [
	multiplier := anInteger
]

{ #category : #rendering }
WAMemoryInput >> renderContentOn: html [ 
	html textInput
		value: self value greaseString;
		callback: [ :v | self value: v ].
	html select
		list: self unitDictionary keys sorted;
		labels: [ :each | self unitDictionary at: each ];
		selected: self multiplier;
		callback: [ :m | self multiplier: m ]
]

{ #category : #private }
WAMemoryInput >> unitDictionary [
	^ Dictionary new
		at: 1 put: 'bytes';
		at: 1024 put: 'KiB';
		at: 1024 squared put: 'MiB';
		at: (1024 raisedTo: 3) put: 'GiB';
		yourself
]

{ #category : #accessing }
WAMemoryInput >> value [
	^ value
]

{ #category : #accessing }
WAMemoryInput >> value: anInteger [
	value := anInteger
]
