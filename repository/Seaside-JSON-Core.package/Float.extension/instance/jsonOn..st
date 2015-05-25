*seaside-json-core
jsonOn: aRenderer
	(self - self) = 0.0 "check for infinity, negative infinity and NaN"
		ifTrue: [ aRenderer number: self ]
		ifFalse: [ aRenderer null ]