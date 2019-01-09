*Seaside-GemStone-Tools-Production-ObjectLog
debugContinuationString
	^ ((self continuation isNil not and: [ self continuation isKindOf: GsProcess ]) and: [ self continuation isContinuation ])
		ifTrue: [ 'debug' ]
		ifFalse: [ '' ]