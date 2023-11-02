converting
requestHeadersFor: aZincRequest
	| fields |
	fields := Dictionary new.
	aZincRequest headersDo: [ :key :value |
		| keyLowercase combinedValue |
		keyLowercase := key asLowercase.
		combinedValue := fields at: keyLowercase
			ifPresent: [ :presentValue | presentValue , ',' , value ]
			ifAbsent: [ value ].
		fields at: keyLowercase put: combinedValue ].
	^ fields