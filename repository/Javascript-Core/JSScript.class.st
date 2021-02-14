"
I represent a sequence of JavaScript statements.
"
Class {
	#name : #JSScript,
	#superclass : #JSObject,
	#instVars : [
		'statements'
	],
	#category : 'Javascript-Core-Base'
}

{ #category : #adding }
JSScript >> , anObject [
	self add: anObject
]

{ #category : #adding }
JSScript >> << anObject [
	^ self add: anObject
]

{ #category : #adding }
JSScript >> add: anObject [
	^ statements add: anObject
]

{ #category : #adding }
JSScript >> addAll: aCollection [
	^ statements addAll: aCollection
]

{ #category : #convenience }
JSScript >> alert: anObject [ 
	self add: (JSStream new
		nextPutAll: 'alert';
		argument: anObject;
		yourself)
]

{ #category : #convenience }
JSScript >> callback: aBlock [
	self goto: (self renderContext actionUrl
		withField: (self renderContext callbacks store: (WAActionCallback on: aBlock)))
]

{ #category : #convenience }
JSScript >> goto: aUrl [ 
	self add: (JSStream new
		nextPutAll: 'window.location=';
		javascript: aUrl)
]

{ #category : #initialization }
JSScript >> initialize [
	super initialize.
	statements := OrderedCollection new
]

{ #category : #convenience }
JSScript >> javascript [
	^ (JSScript context: self renderContext)
		rendererClass: self rendererClass;
		yourself
]

{ #category : #printing }
JSScript >> javascriptContentOn: aStream [
	statements do: [ :each | aStream javascript: each ] separatedBy: [ aStream nextPut: $; ]
]

{ #category : #convenience }
JSScript >> logger [
	^ self add: ((JSLogger context: self renderContext)
		rendererClass: self rendererClass;
		yourself)
]

{ #category : #convenience }
JSScript >> refresh [
	self goto: self renderContext actionUrl
]
