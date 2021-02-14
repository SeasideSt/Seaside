Class {
	#name : #PTNamed,
	#superclass : #PTPrototype,
	#instVars : [
		'id',
		'method',
		'arguments'
	],
	#category : 'Prototype-Core'
}

{ #category : #accessing }
PTNamed >> arguments [
	^ arguments ifNil: [ Array with: self id ]
]

{ #category : #accessing }
PTNamed >> arguments: aCollection [
	arguments := aCollection
]

{ #category : #private }
PTNamed >> defaultArguments [
	^ self arguments , super defaultArguments
]

{ #category : #private }
PTNamed >> defaultId [
	^ JSStream on: 'this'
]

{ #category : #private }
PTNamed >> defaultMethod [
	^ nil
]

{ #category : #accessing }
PTNamed >> id [
	^ id ifNil: [ self defaultId ]
]

{ #category : #accessing }
PTNamed >> id: aString [
	id := aString
]

{ #category : #printing }
PTNamed >> javascriptContentOn: aStream [
	self printPrototypeOn: aStream.
	self method isNil ifFalse: [ self printMethodOn: aStream ].
	self printArgumentsOn: aStream
]

{ #category : #accessing }
PTNamed >> method [
	^ method ifNil: [ self defaultMethod ]
]

{ #category : #accessing }
PTNamed >> method: aString [
	method := aString
]

{ #category : #printing }
PTNamed >> printMethodOn: aStream [
	aStream nextPut: $.; nextPutAll: self method
]
