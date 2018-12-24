encoding
encodePathParametersAt: anIndex on: aDocument
	self
		privatePathParameterMapAt: anIndex
		ifPresentDo: [ :parameters |
			parameters keysAndAllValuesDo: [ :key :values |
				aDocument nextPut: $;.
				aDocument urlEncoder nextPutAll: key.
				(values size = 1 and: [ values first isNil ]) ifFalse: [
					aDocument nextPut: $=.
					values
						do: [ :value | aDocument urlEncoder nextPutAll: value greaseString ]
						separatedBy: [ aDocument nextPut: $, ] ] ] ]
		ifAbsent: [ "ignore" ] 