"
I represent a sequence (or concatenation) of a decorated object and another object.
"
Class {
	#name : #JSConcatenation,
	#superclass : #JSStatement,
	#category : 'Javascript-Core-Decorations'
}

{ #category : #printing }
JSConcatenation >> javascriptContentOn: aStream [
	super javascriptContentOn: aStream.
	aStream
		nextPut: $;;
		javascript: self statement
]
