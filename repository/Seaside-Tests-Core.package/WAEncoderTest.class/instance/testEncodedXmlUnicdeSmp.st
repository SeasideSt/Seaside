as yet unclassified
testEncodedXmlUnicdeSmp
	| emoji string |
	emoji := Character codePoint: 16r1F64C.
	string := (String with: emoji).
	self assert: string xmlEncodedGives: string