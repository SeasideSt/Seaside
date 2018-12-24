private
convertMultipart: entity
	| dictionary |
	dictionary := ZnMultiValueDictionary new.
	entity partsDo: [ :each |
		| value |
		value := each fileName isEmptyOrNil 
			ifTrue: [ 
				each hasEntity
					ifTrue: [ self codec url decode: each fieldValueString ]
					ifFalse: [ String new ] ] 
			ifFalse: [ self convertMultipartFileField: each ] .
		dictionary at: each fieldName add: value ].
	^ dictionary