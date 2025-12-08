"
I represent an anonymous JavaScript function.
"
Class {
	#name : 'JSFunction',
	#superclass : 'JSScript',
	#instVars : [
		'return',
		'arguments'
	],
	#category : 'Javascript-Core-Base',
	#package : 'Javascript-Core',
	#tag : 'Base'
}

{ #category : 'accessing' }
JSFunction >> argument [
	^ arguments
]

{ #category : 'accessing' }
JSFunction >> arguments [
	^ arguments
]

{ #category : 'accessing' }
JSFunction >> arguments: aCollection [
	arguments := aCollection
]

{ #category : 'accessing' }
JSFunction >> argumentsDo: aBlock [
	self arguments do: aBlock
]

{ #category : 'converting' }
JSFunction >> asFunction [
	^ self
]

{ #category : 'converting' }
JSFunction >> asFunction: aCollection [
	self arguments: aCollection
]

{ #category : 'initialization' }
JSFunction >> initialize [
	super initialize.
	arguments := #()
]

{ #category : 'printing' }
JSFunction >> javascriptContentOn: aRenderer [
	aRenderer defineFunction
		arguments: self arguments;
		with: [ 
			statements isEmpty ifFalse: [
				self return
					ifTrue: [
						1 to: statements size - 1 do: [:index | 
							aRenderer render: (statements at: index).
							aRenderer document separator ].
						aRenderer return: statements last ]
					ifFalse: [
						statements
							do: [ :each | aRenderer render: each ]
							separatedBy: [ aRenderer document separator ] ] ] ]
]

{ #category : 'accessing' }
JSFunction >> return [
	^ return ifNil: [ false ]
]

{ #category : 'accessing' }
JSFunction >> return: aBoolean [
	return := aBoolean
]
