private
postFieldsOf: aNativeRequest into: aRequestFields
	"puts all the POST parameters of the given request decoded into a WARequestFields"
	| isUrlEncoded |
	isUrlEncoded := self isUrlEncoded: aNativeRequest.
	^ self
		decodeFields: aNativeRequest postFields
		using: [ :each |
			isUrlEncoded 
				ifTrue: [ self codec url decode: each ]
				ifFalse: [ self codec decode: each ] ]
		into: aRequestFields