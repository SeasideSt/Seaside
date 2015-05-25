updating
updateUrl: aUrl
	super updateUrl: aUrl.
	input isEmptyOrNil ifTrue: [ ^ self ].
	aUrl addToPath: input.
	aUrl addField: 'input' value: input