"
I wrap the decorated object into a conditional statement.
"
Class {
	#name : 'JSCondition',
	#superclass : 'JSStatement',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSCondition >> javascriptContentOn: aRenderer [

	(aRenderer function: 'if')
		with: [ 
			aRenderer render: self statement ].
	aRenderer document openBlock.
	super javascriptContentOn: aRenderer.
	aRenderer document closeBlock.
]
