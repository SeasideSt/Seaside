private
printMilliSeconds: aNumber 
	^ aNumber > 2000 
		ifTrue: [ self printDuration: (Duration milliseconds: aNumber greaseInteger) ]
		ifFalse: [
			aNumber > 2 
				ifTrue: [ aNumber greaseInteger printString , ' ms' ]
				ifFalse: [ (GRNumberPrinter new precision: 2) , ' ms' print: aNumber ] ]