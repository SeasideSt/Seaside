"
I negate the decorated object and yield a boolean value.
"
Class {
	#name : #JSNegation,
	#superclass : #JSDecoration,
	#category : 'Javascript-Core-Decorations'
}

{ #category : #printing }
JSNegation >> javascriptContentOn: aStream [
	aStream nextPut: $!.
	super javascriptContentOn: aStream
]
