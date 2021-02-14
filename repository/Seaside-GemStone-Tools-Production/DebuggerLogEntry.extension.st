Extension { #name : #DebuggerLogEntry }

{ #category : #'*Seaside-GemStone-Tools-Production-ObjectLog' }
DebuggerLogEntry >> debugContinuationString [
	^ ((self continuation isNil not and: [ self continuation isKindOf: GsProcess ]) and: [ self continuation isContinuation ])
		ifTrue: [ 'debug' ]
		ifFalse: [ '' ]
]
