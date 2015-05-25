private
withLeadingZero: anInteger 
	^ anInteger < 10 
		ifTrue: [ '0' , anInteger greaseString ]
		ifFalse: [ anInteger greaseString ]