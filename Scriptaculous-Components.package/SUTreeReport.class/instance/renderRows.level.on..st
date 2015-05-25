rendering
renderRows: aCollection level: anInteger on: html
	aCollection do: [ :each |
		self renderRow: each level: anInteger on: html.
		(expanded includes: each) ifTrue: [
			self 
				renderRows: (childrenBlock value: each)
				level: anInteger + 1 on: html ] ]