accessing
handlerAt: aString
	^ self
			handlerAt: aString
			with: [ :dispatcher :token |
				dispatcher handlers at: token ] 