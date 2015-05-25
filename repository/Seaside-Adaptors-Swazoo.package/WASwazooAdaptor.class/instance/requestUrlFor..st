converting-request
requestUrlFor: aNativeRequest
	| swazooUri seasideUrl |
	seasideUrl := WAUrl new.
	swazooUri := aNativeRequest uri.
	swazooUri identifierPath do: [ :each |
		"the first path element seems to always be '/'"
		each = '/' ifFalse: [
			seasideUrl addToPath: each ] ].
	swazooUri queries do: [ :each |
		| value |
		value := each value.
		"non-existing values are implemented as ''"
		value isEmpty
			ifTrue: [ seasideUrl addField: each key ]
			ifFalse: [ seasideUrl addField: each key value: value ] ].
	seasideUrl slash: swazooUri isDirectory.

	aNativeRequest isEncrypted
		ifTrue: [ seasideUrl scheme: 'https' ].
		
	^ seasideUrl decodedWith: self codec