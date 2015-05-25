accessing
handlerAt: aString ifAbsent: aBlock
	^ self
		handlerAt: (aString
			ifNil: [ ^ aBlock value ])
		with: [ :dispatcher :token |
			dispatcher handlers
				at: token
				ifAbsent: [ ^ aBlock value ] ]