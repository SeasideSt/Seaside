accessing
label
	^ self isProfiling
		ifFalse: [ 'Profile' ]
		ifTrue: [ 'Stop Profile' ]