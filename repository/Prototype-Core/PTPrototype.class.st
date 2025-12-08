Class {
	#name : 'PTPrototype',
	#superclass : 'PTObject',
	#instVars : [
		'options'
	],
	#category : 'Prototype-Core',
	#package : 'Prototype-Core'
}

{ #category : 'private' }
PTPrototype >> defaultArguments [
	^ options isNil
		ifTrue: [ Array new ] 
		ifFalse: [ Array with: options ]
]

{ #category : 'private' }
PTPrototype >> defaultOptions [
	^ GRSmallDictionary2 new
]

{ #category : 'private' }
PTPrototype >> defaultPrototype [
	self subclassResponsibility
]

{ #category : 'printing' }
PTPrototype >> javascriptContentOn: aStream [
	self printPrototypeOn: aStream.
	self printArgumentsOn: aStream
]

{ #category : 'accessing' }
PTPrototype >> optionAt: aKey put: anObject [
	self options at: aKey put: anObject
]

{ #category : 'accessing' }
PTPrototype >> options [
	^ options ifNil: [ options := self defaultOptions ]
]

{ #category : 'printing' }
PTPrototype >> printArgumentsOn: aRenderer [
	| arguments |
	arguments := self defaultArguments
		ifNil: [ ^ self ].
	aRenderer arguments: [ 
		arguments do: [ :each |
			aRenderer argument: each ] ]
]

{ #category : 'printing' }
PTPrototype >> printPrototypeOn: aRenderer [
	aRenderer document identifier: self defaultPrototype
]
