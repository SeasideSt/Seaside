private
processMultipartFields: aKomRequest
	| fields |
	fields := WARequestFields new.	

	aKomRequest multipartFormFieldsDo: [ :chunk |
		| key value |
		key := chunk fieldName.
		value := chunk fileName isEmptyOrNil
			ifTrue: [
				String streamContents: [ :stream |
					chunk saveToStream: stream ] ]
			ifFalse: [ self convertMultipartFileField: chunk ].
		fields at: key add: value ].
	
	"ugly"
	aKomRequest propertyAt: #postFields put: fields