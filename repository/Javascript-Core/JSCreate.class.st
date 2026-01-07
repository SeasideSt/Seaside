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
JSCreate >> javascriptContentOn: aRenderer [
	aRenderer document keyword: 'new'.
	super javascriptContentOn: aRenderer
]
