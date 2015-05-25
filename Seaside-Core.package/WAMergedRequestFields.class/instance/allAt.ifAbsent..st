enumerating
allAt: aKey ifAbsent: absentBlock
	| result |
	result := self allAt: aKey.
	^ result isEmpty
		ifTrue: [ absentBlock value ]
		ifFalse: [ result ]