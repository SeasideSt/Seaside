"
I access a member of the decorated object.
"
Class {
	#name : 'JSAccess',
	#superclass : 'JSMember',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSAccess >> javascriptContentOn: aStream [
	super javascriptContentOn: aStream.
	aStream
		nextPut: $.;
		nextPutAll: self name
]
