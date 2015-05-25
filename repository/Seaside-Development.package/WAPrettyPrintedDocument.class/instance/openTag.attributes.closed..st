writing
openTag: aString attributes: anAttributes closed: aBoolean
	self indent.
	self nextPut: $<.
	html span
		class: 'wa-tag';
		with: aString.
	self attributes: anAttributes.
	aBoolean ifTrue: [ self nextPut: $/ ].
	self nextPut: $>.
	aBoolean ifFalse: [ indentLevel := indentLevel + 1 ].
	indentCloseTags removeLast; addLast: true; addLast: aBoolean