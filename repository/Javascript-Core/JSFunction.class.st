"
I represent an anonymous JavaScript function.
"
Class {
	#name : #JSFunction,
	#superclass : #JSScript,
	#instVars : [
		'return',
		'arguments'
	],
	#category : 'Javascript-Core-Base'
}

{ #category : #accessing }
JSFunction >> argument [
	^ arguments
]

{ #category : #accessing }
JSFunction >> arguments [
	^ arguments
]

{ #category : #accessing }
JSFunction >> arguments: aCollection [
	arguments := aCollection
]

{ #category : #converting }
JSFunction >> asFunction [
	^ self
]

{ #category : #converting }
JSFunction >> asFunction: aCollection [
	self arguments: aCollection
]

{ #category : #initialization }
JSFunction >> initialize [
	super initialize.
	arguments := #()
]

{ #category : #printing }
JSFunction >> javascriptContentOn: aStream [
	aStream nextPutAll: 'function('.
	self arguments do: [ :each | aStream nextPutAll: each ] separatedBy: [ aStream nextPut: $, ].
	aStream nextPutAll: '){'.
	statements isEmpty ifFalse:
			[ statements allButLast do:
					[ :each | 
					aStream
						javascript: each;
						nextPut: $; ].
			self return ifTrue: [ aStream nextPutAll: 'return ' ].
			aStream javascript: statements last ].
	aStream nextPut: $}
]

{ #category : #accessing }
JSFunction >> return [
	^ return ifNil: [ false ]
]

{ #category : #accessing }
JSFunction >> return: aBoolean [
	return := aBoolean
]
