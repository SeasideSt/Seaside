accessing
parameter
	| fieldValue request urlValue |
	request := self requestContext request.
	fieldValue := request at: 'input' ifAbsent: [ nil ].
	urlValue := request url queryFields at: 'input' ifAbsent: [ nil ].
	^ (urlValue = input and: [ fieldValue = input ])
		ifTrue: [ fieldValue ]
		ifFalse: [ 'fail!' ]