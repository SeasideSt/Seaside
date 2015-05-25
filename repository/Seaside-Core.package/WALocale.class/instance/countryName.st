accessing
countryName
	"answers the country name in english and all capitals"

	^ self country size = 2
		ifTrue: [ self class iso2Countries at: self country ]
		ifFalse: [ self class iso3Countries at: self country ]