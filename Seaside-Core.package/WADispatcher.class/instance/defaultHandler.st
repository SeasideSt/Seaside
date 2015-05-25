accessing
defaultHandler
	self defaultName isNil ifTrue: [ ^ nil ].
	^ self handlerAt: self defaultName ifAbsent: [ nil ]