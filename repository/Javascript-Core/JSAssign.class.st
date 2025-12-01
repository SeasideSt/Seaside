"
I assign the decorated object to a global variable.
"
Class {
	#name : 'JSAssign',
	#superclass : 'JSMember',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSAssign >> javascriptContentOn: aRenderer [
	aRenderer document identifier: self name.
	aRenderer assignment: [
		super javascriptContentOn: aRenderer ]
]
