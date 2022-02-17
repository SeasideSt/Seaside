accessing
handlerAt: aString
	^ self
			handlerAt: aString
			ifAbsent: [ WAError signal: 'Handler not found.' ]