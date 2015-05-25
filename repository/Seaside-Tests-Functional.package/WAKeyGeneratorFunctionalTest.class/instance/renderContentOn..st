rendering
renderContentOn: html
	self renderExplanationOn: html.
	key isNil
		ifTrue: [ self renderKeyGeneratorOn: html ]
		ifFalse: [ self renderKeyOn: html ]