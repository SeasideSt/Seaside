converting
pathUnencodedOn: aStream
	"Print the path on on the given stream without doing URL or HTML escaping."

	path isNil ifFalse: [
		path do: [ :each |
			aStream nextPut: $/.
			aStream nextPutAll: each ] ].
	(path isNil or: [ path isEmpty or: [ slash ] ])
		ifTrue: [ aStream nextPut: $/ ]