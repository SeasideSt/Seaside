writing
writeElementsOn: aDocument
	aDocument openTag: 'title'; nextPutAll: title; closeTag: 'title'.
	headElements do: [ :each | aDocument print: each ]