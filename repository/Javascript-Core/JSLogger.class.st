"
I am a logger class to be used together with FireBug. I have nothing to do with Scriptaculous directly, but I nicely fit in here as everybody should be using FireBug for Script debugging anyway.
"
Class {
	#name : #JSLogger,
	#superclass : #JSObject,
	#category : 'Javascript-Core-Base'
}

{ #category : #assertions }
JSLogger >> assert: anObject [ 
	self 
		call: 'assert'
		with: anObject
]

{ #category : #assertions }
JSLogger >> assert: anObject equals: anotherObject [ 
	self 
		call: 'assertEquals'
		with: anObject
		with: anotherObject
]

{ #category : #assertions }
JSLogger >> assert: anObject greater: anotherObject [ 
	self 
		call: 'assertGreater'
		with: anObject
		with: anotherObject
]

{ #category : #assertions }
JSLogger >> assert: anObject less: anotherObject [ 
	self 
		call: 'assertLess'
		with: anObject
		with: anotherObject
]

{ #category : #assertions }
JSLogger >> assert: anObject notEquals: anotherObject [ 
	self 
		call: 'assertNotEquals'
		with: anObject
		with: anotherObject
]

{ #category : #assertions }
JSLogger >> assert: anObject notGreater: anotherObject [ 
	self 
		call: 'assertNotGreater'
		with: anObject
		with: anotherObject
]

{ #category : #assertions }
JSLogger >> assert: anObject notLess: anotherObject [ 
	self 
		call: 'assertNotLess'
		with: anObject
		with: anotherObject
]

{ #category : #assertions }
JSLogger >> assertFalse: anObject [ 
	self 
		call: 'assertFalse'
		with: anObject
]

{ #category : #assertions }
JSLogger >> assertNotNull: anObject [ 
	self 
		call: 'assertNotNull'
		with: anObject
]

{ #category : #assertions }
JSLogger >> assertNotUndefined: anObject [ 
	self 
		call: 'assertNotUndefined'
		with: anObject
]

{ #category : #assertions }
JSLogger >> assertNull: anObject [ 
	self 
		call: 'assertNull'
		with: anObject
]

{ #category : #assertions }
JSLogger >> assertTrue: anObject [ 
	self 
		call: 'assertTrue'
		with: anObject
]

{ #category : #assertions }
JSLogger >> assertUndefined: anObject [ 
	self 
		call: 'assertUndefined'
		with: anObject
]

{ #category : #messages }
JSLogger >> debug: anObject [ 
	self 
		call: 'debug'
		with: anObject
]

{ #category : #messages }
JSLogger >> error: anObject [ 
	self 
		call: 'error'
		with: anObject
]

{ #category : #messages }
JSLogger >> info: anObject [ 
	self 
		call: 'info'
		with: anObject
]

{ #category : #printing }
JSLogger >> javascriptContentOn: aStream [
	aStream nextPutAll: 'console'
]

{ #category : #logging }
JSLogger >> log: anObject [ 
	self 
		call: 'log'
		with: anObject
]

{ #category : #logging }
JSLogger >> log: anObject format: anArray [ 
	self 
		call: 'log'
		withArguments: (Array with: anObject) , anArray
]

{ #category : #messages }
JSLogger >> warn: anObject [ 
	self 
		call: 'warn'
		with: anObject
]
