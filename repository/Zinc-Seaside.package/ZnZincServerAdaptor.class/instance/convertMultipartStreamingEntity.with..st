private
convertMultipartStreamingEntity: anEntity with: aMultiValueDictionary
	ZnStreamingMultiPartFormDataEntity new
		readBinaryFrom: anEntity stream;
		contentType: anEntity contentType;
		partsAndValuesWithCodec: self codec url do: [ :mimePart :value |
			aMultiValueDictionary
				at: mimePart fieldName
				add: value ]