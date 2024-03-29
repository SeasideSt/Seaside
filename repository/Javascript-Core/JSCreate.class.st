"
I instantiate the decorated object.
"
Class {
	#name : 'JSCreate',
	#superclass : 'JSDecoration',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSCreate >> javascriptContentOn: aStream [
	aStream nextPutAll: 'new '.
	super javascriptContentOn: aStream
]
