private
convertMultipartEntity: anEntity with: aMultiValueDictionary
	anEntity partsDo: [ :part |
		| value |
		value := part hasEntity
			ifFalse: [ String new ]
			ifTrue: [
				(part fileName isEmptyOrNil not or: [
					part contentType notNil and: [
						part contentType isBinary ] ])
							ifFalse: [ self codec url decode: part fieldValueString ]
							ifTrue: [ self convertMultipartFileField: part ] ].
		aMultiValueDictionary
			at: part fieldName
			add: value ]