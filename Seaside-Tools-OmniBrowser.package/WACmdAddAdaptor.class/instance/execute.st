execution
execute
	| class port adaptor |
	class := OBChoiceRequest 
		prompt: 'Chose adaptor type'
		labels: (self adaptors collect: [ :each | each name ])
		values: self adaptors.
	class isNil ifTrue: [ ^ self ].
	port := OBTextRequest 
		prompt: 'Enter port number'
		template: class basicNew defaultPort greaseString.
	(port isNil or: [ port isEmpty or: [ port isAllDigits not ] ]) ifTrue: [ ^ self ].
	adaptor := class port: port greaseInteger.
	requestor browser announce: (OBNodeCreated node: adaptor asNode)