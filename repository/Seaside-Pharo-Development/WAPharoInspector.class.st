"
A Squeak-specific implementation of a web-based object inspector.
"
Class {
	#name : #WAPharoInspector,
	#superclass : #WAInspector,
	#category : 'Seaside-Pharo-Development-Core'
}

{ #category : #'class initialization' }
WAPharoInspector class >> initialize [
	self select
]

{ #category : #'class initialization' }
WAPharoInspector class >> unload [
	self unselect
]

{ #category : #actions }
WAPharoInspector >> doIt [
	| result |
	result := super doIt.
	selected ifNil: [ ^ result ].
	^ selected isNumber
		ifTrue: [ self object at: selected put: result ]
		ifFalse: [ self object instVarNamed: selected put: result ]
]

{ #category : #actions }
WAPharoInspector >> evaluate [
	^ self object class compilerClass new
		evaluate: input
		in: thisContext
		to: self object
]

{ #category : #private }
WAPharoInspector >> fieldsFor: anObject [
	^ anObject inspectorFields
]
