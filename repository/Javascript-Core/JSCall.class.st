"
I represent a function call or method invocation to the decorated object.
"
Class {
	#name : #JSCall,
	#superclass : #JSDecoration,
	#instVars : [
		'name',
		'arguments'
	],
	#category : 'Javascript-Core-Decorations'
}

{ #category : #accessing }
JSCall >> arguments [
	^ arguments
]

{ #category : #accessing }
JSCall >> arguments: anArray [ 
	arguments := anArray
]

{ #category : #printing }
JSCall >> javascriptContentOn: aStream [
	super javascriptContentOn: aStream.
	(self name isNil or: [ self name isEmpty ]) ifFalse:
			[ aStream
				nextPut: $.;
				nextPutAll: self name ].
	JSStream encodeArguments: self arguments on: aStream
]

{ #category : #accessing }
JSCall >> name [
	^ name
]

{ #category : #accessing }
JSCall >> name: aString [ 
	name := aString
]
