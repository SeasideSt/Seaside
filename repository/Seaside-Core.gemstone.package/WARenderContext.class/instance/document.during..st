accessing
document: aDocument during: aBlock
	"Set the value of document for the duration of aBlock"
	| previous |
	previous := document.
	[ document := aDocument.
	aBlock value ]
		ensure: [ document := previous ]