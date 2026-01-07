"
I represent a sequence (or concatenation) of a decorated object and another object.
"
Class {
	#name : 'JSConcatenation',
	#superclass : 'JSStatement',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSConcatenation >> javascriptContentOn: aRenderer [
	super javascriptContentOn: aRenderer.
	aRenderer document separator.
	aRenderer render: self statement
]
