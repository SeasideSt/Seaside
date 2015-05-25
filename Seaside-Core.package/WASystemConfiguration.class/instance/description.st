private
description
	^ description isNil 
		ifFalse: [ description ]
		ifTrue: [ self buildDescription ]