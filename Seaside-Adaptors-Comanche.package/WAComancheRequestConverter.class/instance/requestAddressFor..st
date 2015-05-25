converting-request
requestAddressFor: aNativeRequest
	| remoteAddress |
	remoteAddress := aNativeRequest remoteAddress.
	remoteAddress isString
		ifTrue: [ ^ remoteAddress ].
	^ String streamContents: [ :stream |
		remoteAddress
			do: [ :each | stream print: each ]
			separatedBy: [ stream nextPut: $. ] ]