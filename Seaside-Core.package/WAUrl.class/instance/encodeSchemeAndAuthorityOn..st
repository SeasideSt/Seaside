encoding
encodeSchemeAndAuthorityOn: aDocument
	host ifNil: [ ^ self ].
	aDocument nextPutAll: self scheme; nextPutAll: '://'.
	user notNil ifTrue: [
		aDocument urlEncoder nextPutAll: user.
		password notNil ifTrue: [
			aDocument nextPut: $:.
			aDocument urlEncoder nextPutAll: password ].
		aDocument nextPut: $@ ].
	aDocument urlEncoder nextPutAll: host.
	port notNil ifTrue: [
		((self scheme = 'http' and: [ port = 80 ])
			or: [ self scheme = 'https' and: [ port = 443 ] ])
			ifFalse: [ aDocument nextPut: $:; print: port ] ]