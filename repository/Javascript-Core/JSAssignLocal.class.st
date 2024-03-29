"
I assign the decorated object to a local variable.
"
Class {
	#name : 'JSAssignLocal',
	#superclass : 'JSAssign',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSAssignLocal >> javascriptContentOn: aStream [
	aStream nextPutAll: 'var '.
	super javascriptContentOn: aStream
]
