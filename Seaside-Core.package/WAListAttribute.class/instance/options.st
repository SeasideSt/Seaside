accessing
options
	^ optionsBlock isNil
		ifTrue: [ #() ]
		ifFalse: [ optionsBlock value ]