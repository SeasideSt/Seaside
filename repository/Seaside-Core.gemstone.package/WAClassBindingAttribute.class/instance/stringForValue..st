converting
stringForValue: aBinding 
	^ aBinding isNil ifFalse: [ aBinding value name greaseString ]