Class {
	#name : #CTComet,
	#superclass : #JSObject,
	#instVars : [
		'pusher',
		'url'
	],
	#category : 'Comet-Core'
}

{ #category : #configuration }
CTComet class >> headerField [
	^ '_c'
]

{ #category : #actions }
CTComet >> connect [
	self call: 'connect'
]

{ #category : #private }
CTComet >> defaultUrl [
	^ self renderContext actionUrl
		addField: self class headerField
		value: self pusher id
]

{ #category : #actions }
CTComet >> disconnect [
	self call: 'disconnect'
]

{ #category : #'accessing-readonly' }
CTComet >> filter [
	^ self session filters
		detect: [ :each | each isCometFilter ]
		ifNone: [ self session addFilterFirst: CTFilter new ]
]

{ #category : #printing }
CTComet >> javascriptContentOn: aStream [
	aStream
		nextPutAll: 'new Comet(';
		javascript: self url;
		nextPut: $)
]

{ #category : #accessing }
CTComet >> pusher [
	^ pusher
]

{ #category : #accessing }
CTComet >> pusher: aPusher [
	self url: (self renderContext actionUrl
		withField: self class headerField
		value: (self filter
			registerPusher: (pusher := aPusher)
			context: self requestContext))
]

{ #category : #accessing }
CTComet >> url [
	^ url ifNil: [ url := self defaultUrl ]
]

{ #category : #accessing }
CTComet >> url: aUrl [
	url := aUrl
]
