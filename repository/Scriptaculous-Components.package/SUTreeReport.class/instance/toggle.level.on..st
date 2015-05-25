scripts
toggle: anObject level: anInteger on: aScript
	(expanded includes: anObject)
		ifTrue: [ self collapse: anObject level: anInteger on: aScript ]
		ifFalse: [ self expand: anObject level: anInteger on: aScript ]