private
register: anObject
	^ block isNil
		ifTrue: [ anObject ]
		ifFalse: [ block value: anObject ]