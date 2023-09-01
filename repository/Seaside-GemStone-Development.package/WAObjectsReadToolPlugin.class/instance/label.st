accessing
label
	^ self isProfiling
		ifFalse: [ 'ObjectsRead' ]
		ifTrue: [ 'Stop ObjectsRead' ]