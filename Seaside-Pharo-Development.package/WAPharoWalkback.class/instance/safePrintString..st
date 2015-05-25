private
safePrintString: anObject
	^ [ anObject printStringLimitedTo: 100 ]
		on: Error
		do: [ :err | 'unprintable ' , anObject class name ]