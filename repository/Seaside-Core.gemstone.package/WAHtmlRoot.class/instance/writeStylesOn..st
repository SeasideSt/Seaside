writing
writeStylesOn: aDocument
	styles ifNil: [ ^ self ].
	styles do: [ :each |
		aDocument print: ((WALinkElement root: self)
			beStylesheet; beCss;
			document: each;
			yourself) ]