accessing
tag
	^ children isEmptyOrNil
		ifTrue: [ 'link' ]
		ifFalse: [ 'style' ]