private
convertMultipartEntity: anEntity with: aMultiValueDictionary
	anEntity partsDo: [ :part |
		| value |
		value := part hasEntity
			ifFalse: [ '' ]
			ifTrue: [
				part fileName isEmptyOrNil
					ifTrue: [ self codec url decode: part fieldValueString ]
					ifFalse: [ self convertMultipartFileField: part ] ].
		aMultiValueDictionary
			at: part fieldName
			add: value ]