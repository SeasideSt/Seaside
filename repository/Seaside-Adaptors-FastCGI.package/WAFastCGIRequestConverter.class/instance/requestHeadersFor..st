converting-request
requestHeadersFor: aNativeRequest

	| params keys values |
	values := Dictionary new.
	params := aNativeRequest params.
	keys := params keys do: [:each | 
		(each ~= 'HTTP_COOKIE' and: [each beginsWith: 'HTTP_'])
			ifTrue: [
				values
					at: ((each copyFrom: 6 to: each size) asLowercase copyReplaceAll: '_' with: '-')
					put: (params at: each).
				(each beginsWith: 'HTTP_X_FORWARDED_')
					ifTrue: [ 
						values
							at: (each copyFrom: 18 to: each size) asLowercase
							put: (params at: each)].
			]
			ifFalse: [
				each asLowercase = 'authorization'
					ifTrue: [
						values
							at: 'authorization'
							put: (params at: each).
					]
			].
	].
	^values