Class {
	#name : #PTPrototype,
	#superclass : #PTObject,
	#instVars : [
		'options'
	],
	#category : 'Prototype-Core'
}

{ #category : #private }
PTPrototype >> defaultArguments [
	^ options isNil
		ifTrue: [ Array new ] 
		ifFalse: [ Array with: options ]
]

{ #category : #private }
PTPrototype >> defaultOptions [
	^ GRSmallDictionary2 new
]

{ #category : #private }
PTPrototype >> defaultPrototype [
	self subclassResponsibility
]

{ #category : #printing }
PTPrototype >> javascriptContentOn: aStream [
	self printPrototypeOn: aStream.
	self printArgumentsOn: aStream
]

{ #category : #accessing }
PTPrototype >> optionAt: aKey put: anObject [
	self options at: aKey put: anObject
]

{ #category : #accessing }
PTPrototype >> options [
	^ options ifNil: [ options := self defaultOptions ]
]

{ #category : #printing }
PTPrototype >> printArgumentsOn: aStream [
	| arguments |
	arguments := self defaultArguments
		ifNil: [ ^ self ].
	JSStream encodeArguments: arguments on: aStream
]

{ #category : #printing }
PTPrototype >> printPrototypeOn: aStream [
	aStream nextPutAll: self defaultPrototype
]
