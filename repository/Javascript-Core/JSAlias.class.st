"
I alias the decorated object with a name.
"
Class {
	#name : 'JSAlias',
	#superclass : 'JSMember',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSAlias >> javascriptContentOn: aStream [
	aStream nextPutAll: self name
]
