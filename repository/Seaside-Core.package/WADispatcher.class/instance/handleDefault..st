handling
handleDefault: aRequestContext
	self defaultName isNil
		ifTrue: [ aRequestContext responseGenerator forbidden; respond ]
		ifFalse: [ self handleFiltered: aRequestContext named: self defaultName ]