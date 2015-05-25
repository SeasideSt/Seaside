converting-request
requestAddressFor: aNativeRequest
	"converts a Squeak address (ByteArray) to an IPv4 String"
	| remoteAddress |
	remoteAddress := aNativeRequest peer.
	remoteAddress isString ifTrue: [
		"so apparently someone has a new VM with IPv6 support"
		^ remoteAddress ].
	
	^ String streamContents: [ :stream |
		remoteAddress
			do: [ :each | stream print: each ]
			separatedBy: [ stream nextPut: $. ] ]