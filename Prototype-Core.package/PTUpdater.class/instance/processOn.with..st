processing
processOn: aStream with: argumentString
	callback isNil
		ifTrue: [ ^ self ].
	self 
		render: [ :html |
			callback argumentCount = 2
				ifTrue: [ callback valueWithArguments: (Array with: html with: argumentString) ]
				ifFalse: [ callback value: html ] ]
		on: aStream