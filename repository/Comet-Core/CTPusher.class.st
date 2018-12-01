Class {
	#name : #CTPusher,
	#superclass : #WAObject,
	#instVars : [
		'mutex',
		'handlers',
		'rendererClass'
	],
	#classInstVars : [
		'process'
	],
	#category : 'Comet-Core'
}

{ #category : #initialization }
CTPusher class >> initialize [
	GRPlatform current
		addToStartUpList: self;
		addToShutDownList: self
]

{ #category : #private }
CTPusher class >> pingProcess [
	self allInstancesDo: [ :each | each ping ].
	GRPlatform current cometWait
]

{ #category : #initialization }
CTPusher class >> shutDown [
	process ifNil: [ ^ self ].
	GRPlatform current terminateProcess: process.
	process := nil
]

{ #category : #initialization }
CTPusher class >> startUp [
	self shutDown.
	process := GRPlatform current cometForkProcessDo: [ [ self pingProcess ] repeat ]
]

{ #category : #initialization }
CTPusher class >> unload [
	GRPlatform current
		removeFromStartUpList: self;
		removeFromShutDownList: self.
	self shutDown
]

{ #category : #accessing }
CTPusher >> handlers [
	"Answer the current list of handlers."

	^ handlers
]

{ #category : #initialization }
CTPusher >> initialize [
	super initialize.
	mutex := GRPlatform current semaphoreClass forMutualExclusion.
	handlers := Array new
]

{ #category : #public }
CTPusher >> javascript: aBlock [
	"Evaluate aBlock with an JSScript instance and pushes the resulting script-string aString to all associated handlers."

	| script |
	script := (JSScript context: self renderContext)
		rendererClass: self rendererClass;
		yourself.
	aBlock value: script.
	self push: (String streamContents: [ :stream |
		stream
			nextPutAll: '<script type="text/javascript">parent.Comet.eval(';
			javascript: script asJavascript;
			nextPutAll: ')</script>' ])
]

{ #category : #accessing }
CTPusher >> mutex [
	"Answer the mutex in use with the receiver."

	^ mutex
]

{ #category : #protected }
CTPusher >> ping [
	"Ping all the associated handlers."

	self push: ' '
]

{ #category : #protected }
CTPusher >> push: aString [
	"Push aString to all associated handlers."

	self mutex critical: [ handlers := handlers select: [ :each | each push: aString ] ]
]

{ #category : #protected }
CTPusher >> register: aHandler [
	"Register a new handler into this pusher."

	mutex critical: [ handlers := handlers copyWith: aHandler ]
]

{ #category : #'accessing-rendering' }
CTPusher >> renderContext [
	"Answer a fake rendering context for this pusher."

	^ WARenderContext new
		document: (WAHtmlDocument on: (WriteStream on: String new));
		actionUrl: WAUrl new;
		yourself
]

{ #category : #'accessing-rendering' }
CTPusher >> rendererClass [
	"Answer the default renderer for this pusher."

	^ rendererClass ifNil: [ WARenderer default ]
]

{ #category : #'accessing-rendering' }
CTPusher >> rendererClass: aRendererClass [
	rendererClass := aRendererClass
]
