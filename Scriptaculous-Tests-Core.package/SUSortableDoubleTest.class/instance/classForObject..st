private
classForObject: anObject
	^ anObject species = SmallInteger
		ifFalse: [ 'orange' ]
		ifTrue: [ 'green' ]