updating
updateUrl: aUrl
	super updateUrl: aUrl.
	string isNil ifTrue: [ ^ self ].
	aUrl addToPath: string.
	aUrl fragment: string