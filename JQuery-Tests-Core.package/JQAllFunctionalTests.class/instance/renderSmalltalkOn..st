rendering-browser
renderSmalltalkOn: html 
	| source |
	html heading level: 4; with: 'Smalltalk'.
	contents selectors do: [ :selector | 
		source := ((contents class whichClassIncludesSelector: selector) 
			sourceCodeAt: selector) greaseString readStream.
		html div class: 'code'; with: [
			html span
				class: 'signature';
				with: [ html text: contents class name; text: '>>'; text: source nextLine ].
			html break.
			[ source atEnd ] whileFalse: [ 
				[ source peek = Character tab ] whileTrue: [ 
					html space; space; space.
					source next ].
				html render: source nextLine; break ] ] ]
		separatedBy: [ html break ]
