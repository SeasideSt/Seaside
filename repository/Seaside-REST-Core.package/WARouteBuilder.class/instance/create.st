private
create
	^ path isNil
		ifTrue: [ self createSimpleRoute ]
		ifFalse: [ self createComplexRoute ]