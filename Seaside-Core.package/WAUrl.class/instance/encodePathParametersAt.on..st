encoding
encodePathParametersAt: anIndex on: aDocument
	self
		privatePathParameterMapAt: anIndex
		ifPresentDo: [ :parameters |
			parameters keys asSet do: [ :key |
				| values |
				aDocument nextPut: $;.
				aDocument urlEncoder nextPutAll: key.
				values := parameters allAt: key.
				(values size = 1 and: [ values first isNil ]) ifFalse: [
					| first |
					first := true.
					aDocument nextPut: $=.
					values do: [ :value |
						first ifFalse: [
							aDocument nextPut: $, ].
						aDocument urlEncoder nextPutAll: value greaseString.
						first := false ] ] ] ]
		ifAbsent: [ "ignore" ] 