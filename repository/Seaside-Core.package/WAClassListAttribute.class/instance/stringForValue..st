converting
stringForValue: aClass 
	^ aClass isNil ifFalse: [ aClass name greaseString ]