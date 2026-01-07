"
A Squeak-specific implementation of a web-based object inspector.
"
Class {
	#name : 'WAPharoInspector',
	#superclass : 'WAInspector',
	#category : 'Seaside-Pharo-Development-Core',
	#package : 'Seaside-Pharo-Development',
	#tag : 'Core'
}

{ #category : 'class initialization' }
WAPharoInspector class >> initialize [
	self select
]

{ #category : 'class initialization' }
WAPharoInspector class >> unload [
	self unselect
]

{ #category : 'actions' }
WAPharoInspector >> doIt [
	| result |
	result := super doIt.
	selected ifNil: [ ^ result ].
	^ selected isNumber
		ifTrue: [ self object at: selected put: result ]
		ifFalse: [ self object instVarNamed: selected put: result ]
]

{ #category : 'actions' }
WAPharoInspector >> evaluate [
	^ self object class compilerClass new
		source: input;
		receiver: self object;
		evaluate
]

{ #category : 'private' }
WAPharoInspector >> fieldsFor: anObject [
	^ anObject inspectorFields
]
