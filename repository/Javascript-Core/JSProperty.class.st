"
I access a property of the decorated object.
"
Class {
	#name : #JSProperty,
	#superclass : #JSMember,
	#category : 'Javascript-Core-Decorations'
}

{ #category : #printing }
JSProperty >> javascriptContentOn: aStream [
	super javascriptContentOn: aStream.
	aStream
		nextPut: $[;
		javascript: self name;
		nextPut: $]
]
