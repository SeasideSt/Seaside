private
convertMultipartStreamingEntity: anEntity with: aMultiValueDictionary
	| entity |
	entity := ZnStreamingMultiPartFormDataEntity new
		readBinaryFrom: anEntity stream;
		contentType: anEntity contentType;
		yourself.
	entity
		partsDecodeWith: [ :znMimePart |
			aMultiValueDictionary
				at: znMimePart fieldName
				add: (self codec url decode: (znMimePart hasEntity
					ifTrue: [ znMimePart fieldValueString ]
					ifFalse: [ String new ])) ]
		decodeFilesWith: [ :znMimePart :filePath |
			"Empty file + empty filename means that the file form
			field did not contain a value (no file was selected)."
			(znMimePart fileName isEmpty and: [
				filePath asFileReference size isZero ])
					ifTrue: [ filePath asFileReference ensureDelete ]
					ifFalse: [
						aMultiValueDictionary
							at: znMimePart fieldName
							add: (WAExternalFile new
								contentType: znMimePart contentType printString;
								fileName: (znMimePart fileName ifEmpty: [
									"It is legal for the `filename` value to be empty"
									filePath asFileReference basename ]);
								filePath: filePath;
								yourself) ] ]