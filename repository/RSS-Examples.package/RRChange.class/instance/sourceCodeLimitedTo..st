api
sourceCodeLimitedTo: max
	self sourceCode ifNil: [ ^ String new ].
	^ self sourceCode copyFrom: 1 to: (max min: self sourceCode size)