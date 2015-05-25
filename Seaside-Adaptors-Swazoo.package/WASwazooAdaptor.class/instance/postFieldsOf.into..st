private
postFieldsOf: aNativeRequest into: aRequestFields
	"break encapsulation - This line is likely unnecessary because #requestBodyFor:
		will have already done this after extracting the body."
	aNativeRequest ensureFullRead. ""
	aNativeRequest postData keysAndValuesDo: [ :key :value |
		| data |
		data := value filename isEmptyOrNil
			ifTrue: [ self codec url decode: value value ]
			ifFalse: [
				| isoCodec |
				isoCodec := GRCodec forEncoding: 'ISO-8859-1'.
				WAFile new
					fileName: (self codec url decode: value filename);
					contentType: value contentType seasideMimeType;
					"does a 1:1 mapping from character values to bytes"
					contents: (isoCodec encode: value value) asByteArray;
					yourself ].
		aRequestFields at: key add: data ]