accessing
locale
	locale ifNil: [
		self session
			ifNil: [
				^ self firstSupportedLocaleWithFallback: [ WASession basicNew defaultLocale ] ]
			ifNotNil: [ locale := self session locale ] ].
	^ locale