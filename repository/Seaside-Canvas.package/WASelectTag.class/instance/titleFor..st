private
titleFor: anObject
	^ titleBlock isNil
		ifTrue: [ anObject ]
		ifFalse: [ titleBlock value: anObject ]