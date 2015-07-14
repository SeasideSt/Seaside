actions
resumeContinuation

	logEntry == nil
		ifTrue: [ 
			self inform: 'No process to resume'.
			^false ].
	logEntry resumption == nil
		ifTrue: [ self inform: 'Remote continuation not ''continued'' yet' ]
		ifFalse: [ | proc |
			logEntry isResumed
				ifTrue: [ 
					self inform: 'Remote continuation has already resumed.'.
					^false ].
			proc := logEntry resumption.
			logEntry resumeContinuation.
			proc == proc _continue ifTrue: [ proc _continue ]].
	^false