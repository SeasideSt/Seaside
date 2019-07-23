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
			aMultiValueDictionary
				at: znMimePart fieldName
				add: (WAExternalFile new
					contentType: znMimePart contentType printString;
					fileName: znMimePart fileName;
					filePath: filePath;
					yourself) ]