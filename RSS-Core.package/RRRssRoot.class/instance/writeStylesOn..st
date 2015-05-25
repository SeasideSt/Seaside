writing
writeStylesOn: aDocument
	styles isNil
		ifTrue: [ ^ self ].
	styles do: [ :each | aDocument print: each ]