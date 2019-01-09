converting
requestHeadersFor: aZincRequest
	| fields |
	fields := Dictionary new.
	aZincRequest headersDo: [ :key :value |
		fields at: key asLowercase put: value ].
	^ fields