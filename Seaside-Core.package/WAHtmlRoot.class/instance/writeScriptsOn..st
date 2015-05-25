writing
writeScriptsOn: aDocument
	scripts ifNil: [ ^ self ].
	scripts do: [ :each |
		aDocument print: ((WAScriptElement root: self)
			beJavascript;
			document: each;
			yourself) ]