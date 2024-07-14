private
convertMultipartEntity: anEntity with: aMultiValueDictionary

	anEntity partsDo: [ :part |
		| value |
		value := part hasEntity
			ifTrue: [
				part fileName
					ifNil: [ self codec url decode: part fieldValueString ]
					ifNotNil: [ self convertMultipartFileField: part ] ]
			ifFalse: [ '' ].
		aMultiValueDictionary at: part fieldName add: value ]