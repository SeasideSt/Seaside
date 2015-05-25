instance creation
fromString: aString
	^ Array streamContents: [ :stream |
		GRPlatform subStringsIn: aString splitBy: $, do: [ :each |
			| value quality semicolonIndex |
			quality := 1.0. "default value according to spec"
			semicolonIndex := each indexOf: $;.
			semicolonIndex = 0
				ifTrue: [
					value := self valueClass fromString: each trimBoth ]
				ifFalse: [
					| parameters |
					parameters := nil.
					value := self valueClass fromString: (each copyFrom: 1 to: semicolonIndex - 1) trimBoth.
					GRPlatform subStringsIn: (each copyFrom: semicolonIndex + 1 to: each size) splitBy: $; do: [ :parameter |
						| key parameterValue |
						key := (parameter copyUpTo: $=) trimBoth.
						parameterValue := (parameter copyAfter: $=) trimBoth.
						key = 'q'
							ifTrue: [
								parameterValue first = $. ifTrue: [
									"work around for Issue 655
									some user agents send '.2' instead of '2.0'"
									parameterValue := '0', parameterValue ].
								quality := Float readFrom: parameterValue readStream ]
							ifFalse: [
								parameters isNil ifTrue: [
									parameters := GRSmallDictionary new ].
								parameters at: key put: parameterValue ] ].
					(parameters isNil not and: [ value respondsTo: #parameters: ]) ifTrue: [
						"only WAMimeType actually supports parameters"
						value parameters: parameters ] ].
			stream nextPut: (self value: value quality: quality) ] ]