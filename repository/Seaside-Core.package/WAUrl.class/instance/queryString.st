converting
queryString
	"Answer the full query part of the URL. It would probably be better to
	store this as a string somewhere so we can support queries that are not
	key/value field lists."
	
	^ String streamContents: [ :stream |
		| urlEncoder |
		urlEncoder := GRPlatform current urlEncoderOn: stream.
		self queryFields associations
			do: [ :each |
				urlEncoder nextPutAll: each key.
				each value notNil ifTrue: [
					stream nextPut: $=.
					urlEncoder nextPutAll: each value greaseString ] ]
			separatedBy: [ stream nextPut: $& ] ]