*javascript-core
passengerAt: aString ifAbsent: aBlock
	| passenger |
	passenger := callbacks at: aString ifAbsent: [ ^ aBlock value ].
	passenger isPassenger ifFalse: [ ^ aBlock value ].
	^ passenger object