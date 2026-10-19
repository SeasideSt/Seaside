private
addDeferredCallback: anObject named: aString
	self addDeferredCallback: [ :renderer |
		renderer document
			dotProperty: aString.
		renderer arguments: [ renderer argument: anObject asFunction ] ]