accessing-urls
selectorUrl
	^ selector isNil 
		ifTrue: [ self url ]
		ifFalse: [ self url greaseString , ' ' , selector greaseString ]