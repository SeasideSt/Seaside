private
openDocument: aDocument context: aContext 
	| documentRoot |
	self fullDocument ifFalse: [ ^ self ].
	documentRoot := self rootClass context: aContext.
	self rootBlock value: documentRoot.
	aDocument open: documentRoot