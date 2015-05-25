rendering-stack
renderObject: anObject labelled: aString on: html
	html definitionTerm: [
		html anchor
			callback: [ (WAInspectorHaloPlugin on: anObject for: self) execute ];
			with: aString ].
	html definitionData: (self safePrintString: anObject)