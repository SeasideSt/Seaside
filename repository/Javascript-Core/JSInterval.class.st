"
I periodically execute the decorated object.
"
Class {
	#name : 'JSInterval',
	#superclass : 'JSTimed',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSInterval >> javascriptContentOn: aRenderer [
	(aRenderer function: 'setInterval')
		with: [
			aRenderer argument: [
				aRenderer defineFunction: [
					super javascriptContentOn: aRenderer ] ].
			aRenderer argument: self duration ]
]
