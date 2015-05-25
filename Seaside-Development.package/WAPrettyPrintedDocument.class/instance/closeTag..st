writing
closeTag: aString
	indentLevel := indentLevel - 1.
	indentCloseTags removeLast
		ifTrue: [ self indent ].
	self nextPutAll: '</'.
	html span 
		class: 'wa-tag'; 
		with: aString.
	self nextPut: $>