api
addParametersTo: aUrl
	self hasChangedClass ifFalse: [ ^ self ].
	aUrl addField: 'class' value: self changedClassName.
	self hasChangedSelector ifTrue: [
		aUrl addField: 'method' value: self changedSelector ].
	self isMeta ifTrue: [
		aUrl addField: 'meta' ]
