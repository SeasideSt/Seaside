compatibility
start
	^ self default isNil
		ifFalse: [ self default start; yourself ]
		ifTrue: [ self error: 'No adaptor currently configured. Use #startOn:.'. nil ]