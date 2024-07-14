accessing
indexOf: anElement ifAbsent: exceptionBlock
	| index |
	index := buffer
		indexOf: anElement
		ifAbsent: [ ^ exceptionBlock value ].
		
	^ index > offset
		ifTrue: [ index - offset ]
		ifFalse: [ self size - offset + index ]