private
getFieldsOf: aFSResponderRole into: aRequestFields
	"puts all the GET parameters of the given request decoded into a dictionary merger"
	^self
		decodeFields: (self parseFields: aFSResponderRole)
		using: [ :each | self codec url decode: each ]
		into: aRequestFields