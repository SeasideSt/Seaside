"
The core functionality of jQuery centers around this object. Everything in jQuery is based upon this, or uses this in some way. The most basic use of this object is to pass in an expression (usually consisting of CSS), which then finds all matching elements.
"
Class {
	#name : #JQuery,
	#superclass : #JSObject,
	#classVars : [
		'FunctionName'
	],
	#category : 'JQuery-Core-Objects'
}

{ #category : #accessing }
JQuery class >> functionName [
	^ FunctionName
]

{ #category : #accessing }
JQuery class >> functionName: aString [
	"Changes the function name that Seaside generates to access the jQuery namespace. By default Seaside uses '$'. If another Javascript library (like Prototype, MooTools, or YUI) should be used simultaniously this name might be overridden. In this case use 'jQuery' as the function name, as this is an alias that normally does not conflict. In any case consult <http://docs.jquery.com/Using_jQuery_with_Other_Libraries>."

	FunctionName := aString
]

{ #category : #initialization }
JQuery class >> initialize [
	self functionName: '$'
]

{ #category : #private }
JQuery >> create: aPluginClass [
	^ (aPluginClass context: self renderContext owner: self)
		rendererClass: self rendererClass;
		yourself
]

{ #category : #private }
JQuery >> html: aRenderable [
	self subclassResponsibility
]

{ #category : #private }
JQuery >> id: aString [
	self subclassResponsibility
]

{ #category : #printing }
JQuery >> javascriptContentOn: aStream [
	aStream nextPutAll: FunctionName
]
