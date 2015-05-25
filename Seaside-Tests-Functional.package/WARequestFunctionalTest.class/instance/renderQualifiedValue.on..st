rendering
renderQualifiedValue: aQualifiedValue on: html
	html listItem: [
		| quality |
		html render: aQualifiedValue value.
		quality := aQualifiedValue quality.
		quality = Float infinity
			ifTrue: [ html superscript: [ html html: '&infin;' ] ]
			ifFalse: [ html superscript: quality ] ]