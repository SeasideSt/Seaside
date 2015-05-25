private
indent
	firstLine
		ifTrue: [ firstLine := false ]
		ifFalse: [ html break ].
	indentLevel timesRepeat: [ html space: 2 ].
	html flush