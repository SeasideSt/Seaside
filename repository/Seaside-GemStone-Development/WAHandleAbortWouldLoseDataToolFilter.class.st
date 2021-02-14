Class {
	#name : #WAHandleAbortWouldLoseDataToolFilter,
	#superclass : #WARequestFilter,
	#category : 'Seaside-GemStone-Development-Filter'
}

{ #category : #processing }
WAHandleAbortWouldLoseDataToolFilter >> handleFiltered: aRequestContext [ 
	[ super handleFiltered: aRequestContext ] 
		on: Error
		do: [ :ex | 
			"TransactionError in 3.x and InterpreterError in 2.x ... make up your mind"
			ex gsNumber == 2412
				ifTrue: [
					"handle #rtErrAbortWouldLoseData by committing and resuming ... only safe in a development environment"
					System commitTransaction ifFalse: [ self error: 'Could not avoid #rtErrAbortWouldLoseData error' ].
					System inTransaction ifFalse: [ System beginTransaction ].
					ex resume ]
				ifFalse: [ ex pass ]]
]
