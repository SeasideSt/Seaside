accessing
languageName
	"answers the language name in english and all capitals"

	^ self language size = 2
		ifTrue: [ self class iso2Languages at: self language ]
		ifFalse: [ self class iso3Languages at: self language ]