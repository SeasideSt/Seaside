ancestry
parents
	^ parentsBlock isNil 
		ifFalse: [ parentsBlock value ]
		ifTrue: 
			[ #() ]