accessing
visitor
	^ visitor ifNil: [ visitor := self defaultVisitor ]