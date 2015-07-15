private
postFieldsOf: aNativeRequest into: aDictionaryMerger
	"puts all the POST parameters of the given request decoded into a dictionary merger"
	| isUrlEncoded |
	isUrlEncoded := self isUrlEncoded: aNativeRequest.
	^self
		decodeFields: (aNativeRequest params at: 'postFields' ifAbsent: [ Dictionary new ])
		using: [ :each |
			isUrlEncoded 
				ifTrue: [ self codec url decode: each ]
				ifFalse: [ self codec decode: each ] ]
		into: aDictionaryMerger