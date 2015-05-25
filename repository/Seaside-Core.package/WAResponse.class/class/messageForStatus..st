accessing
messageForStatus: anInteger
	^ StatusMessages at: anInteger ifAbsent: [ nil ]