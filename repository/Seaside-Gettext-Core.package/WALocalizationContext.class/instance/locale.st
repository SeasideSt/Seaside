accessing
locale

	locale ifNil: [ 
		self session
			ifNil: [ 
				self firstSupportedLocaleWithFallback: [ 
					"fall back to default. TODO: fix this... should be better" 
					translator supportedLocaleStrings anyOne ] ]
			ifNotNil: [ locale := self session locale ] ].
	^ locale