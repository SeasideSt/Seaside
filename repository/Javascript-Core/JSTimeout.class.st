"
I evaluate the decorated object after a timeout.
"
Class {
	#name : 'JSTimeout',
	#superclass : 'JSTimed',
	#category : 'Javascript-Core-Decorations',
	#package : 'Javascript-Core',
	#tag : 'Decorations'
}

{ #category : 'printing' }
JSTimeout >> javascriptContentOn: aRenderer [
	(aRenderer function: 'setTimeout')
		with: [
			aRenderer argument: [
				aRenderer defineFunction: [
					super javascriptContentOn: aRenderer ] ].
			aRenderer argument: self duration ]
]
