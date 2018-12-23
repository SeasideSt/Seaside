private
printMilliSeconds: aNumber dividedBy: divisor
	^ divisor isZero
		ifTrue: [
			"avoid ZeroDivide"
			self printMilliSeconds: 0 ]
		ifFalse: [ self printMilliSeconds: aNumber / divisor ]