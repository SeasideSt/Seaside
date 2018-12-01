"
I wrap the decorated object into a conditional statement.
"
Class {
	#name : #JSCondition,
	#superclass : #JSStatement,
	#category : 'Javascript-Core-Decorations'
}

{ #category : #printing }
JSCondition >> javascriptContentOn: aStream [
	aStream
		nextPutAll: 'if(';
		javascript: self statement;
		nextPutAll: '){'.
	super javascriptContentOn: aStream.
	aStream nextPut: $}
]
