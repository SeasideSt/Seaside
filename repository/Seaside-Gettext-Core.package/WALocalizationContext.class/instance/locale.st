accessing
locale

	locale ifNil: [ 
		self session
			ifNil: [ ^ self firstSupportedLocaleWithFallback: [ WALocale fallbackLocale ] ]
			ifNotNil: [ locale := self session locale ] ].
	^ locale